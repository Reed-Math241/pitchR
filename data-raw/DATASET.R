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
salary21 <- data_pull(2021)

finalsalary <- rbind(salary18, salary19, salary20, salary21)

## ----------------------------------------------------------------------------------------------------

## statcast

stats18 <- read_csv("/Users/joshuayamamoto/Downloads/savant_data-7.csv") %>% 
  select(pitches:release_extension)

stats19 <- read_csv("/Users/joshuayamamoto/Downloads/savant_data-8.csv") %>%
  select(pitches:release_extension)



usethis::use_data(DATASET, overwrite = TRUE)
