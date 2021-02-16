## code to prepare `DATASET` dataset goes here

## getting team names

team_url <- "https://www.spotrac.com/mlb/payroll/"

html_team <- team_url %>%
  xml2::read_html() %>%
  rvest::html_nodes(css = ".xs-hide") %>%
  rvest::html_text() %>%
  janitor::make_clean_names() %>%
  tibble::as_tibble() %>%
  dplyr::mutate(value = str_replace_all(value, "_", "-")) %>%
  dplyr::pull(value) 

html_team <- html_team[1:30]


# function to pull salary and then player names and then join the two together

pull_salary <- function(x){
  page <- xml2::read_html(x)
  salary <- 
    page %>%
    rvest::html_nodes(css = ".info") %>%
    rvest::html_text() %>%
    tibble::as_tibble() %>%
    dplyr::mutate(value = stringr::str_remove(value, "\\$"),
           value = stringr::str_remove_all(value, ","),
           value = as.double(as.character(value)),
           id = dplyr::row_number()) %>%
    dplyr::rename("salary" = value)
  team <-
    page %>% 
    rvest::html_nodes(css = ".rank-position") %>% 
    rvest::html_text() %>%
    tibble::as_tibble() %>% 
    dplyr::mutate(value = str_trim(value, "both")) %>% 
    dplyr::rename(team = value)
  players <- 
    page %>%
    rvest::html_nodes(css = ".team-name") %>%
    rvest::html_text() %>%
    tibble::as_tibble() %>%
    dplyr::mutate(id = dplyr::row_number()) %>%
    dplyr::rename("name" = value)
  final_raw <- 
    players %>%
    dplyr::left_join(salary, by = "id") %>%
    dplyr::select(-id)
  final <- cbind(final_raw, team)
  return(final)
}

## using function to scrape data

data_pull <- function(year){
  glue::glue("https://www.spotrac.com/mlb/rankings/{year}/salary/{html_team}/starting-pitcher/") %>% 
    purrr::map(
      pull_salary
    ) %>% 
    dplyr::bind_rows() %>% 
    dplyr::mutate(Year = year)
}

salary18 <- data_pull(2018)
salary19 <- data_pull(2019)
salary20 <- data_pull(2020)


## ----------------------------------------------------------------------------------------------------

## statcast

savant18 <- readr::read_csv("/home/yamamojo/pkgGrpq/data-raw/savant2018.csv") %>% 
  dplyr::select(pitches:release_extension) %>% 
  dplyr::rename(name = player_name)

savant19 <- readr::read_csv("/home/yamamojo/pkgGrpq/data-raw/savant2019.csv") %>% 
  dplyr::select(pitches:release_extension) %>% 
  dplyr::rename(name = player_name)

savant20 <- readr::read_csv("/home/yamamojo/pkgGrpq/data-raw/savant2020.csv") %>% 
  dplyr::select(pitches:release_extension) %>% 
  dplyr::rename(name = player_name)



## ----------------------------------------------------------------------------------------------------
## joining data

normalize_name <- function(data){
  data %>% 
  dplyr::mutate(name = stringr::str_remove_all(name, " "),
                name = stringr::str_remove_all(name, "\\."),
                name = stringr::str_remove_all(name, "-"),
                name = stringr::str_to_lower(name))
  }



full18 <- normalize_name(salary18) %>% 
  dplyr::left_join(normalize_name(savant18), by = "name") 

full19 <- normalize_name(salary19) %>% 
  dplyr::left_join(normalize_name(savant19), by = "name") 

full20 <- normalize_name(salary20) %>% 
  dplyr::left_join(normalize_name(savant20), by = "name") 

## ----------------------------------------------------------------------------------------------------
## final data

pitchR <- rbind(full18, full19, full20)

pitchR <- pitchR %>% 
  dplyr::select(c(-year, -total_pitches, -pitch_percent, -eff_min_vel))

usethis::use_data(pitchR, overwrite = TRUE)

