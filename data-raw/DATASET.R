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
  players <- 
    page %>%
    rvest::html_nodes(css = ".team-name") %>%
    rvest::html_text() %>%
    tibble::as_tibble() %>%
    dplyr::mutate(id = dplyr::row_number()) %>%
    dplyr::rename("name" = value)
  final <- 
    players %>%
    dplyr::left_join(salary, by = "id") %>%
    dplyr::select(-id)
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
  dplyr::select(pitches:release_extension)

savant19 <- readr::read_csv("/home/yamamojo/pkgGrpq/data-raw/savant2019.csv") %>% 
  dplyr::select(pitches:release_extension)

savant20 <- readr::read_csv("/home/yamamojo/pkgGrpq/data-raw/savant2020.csv") %>% 
  dplyr::select(pitches:release_extension)



## ----------------------------------------------------------------------------------------------------
## joining data

full18 <- salary18 %>% 
  left_join(savant18, by = c("name" = "player_name")) %>% 
  filter(!is.na(pitches))

full19 <- salary19 %>% 
  left_join(savant19, by = c("name" = "player_name")) %>% 
  filter(!is.na(pitches))

full20 <- salary20 %>% 
  left_join(savant20, by = c("name" = "player_name")) %>% 
  filter(!is.na(pitches))

## ----------------------------------------------------------------------------------------------------
## final data

pitchR <- rbind(full18, full19, full20)

usethis::use_data(pitchR, overwrite = TRUE)
