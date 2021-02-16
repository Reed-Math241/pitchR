
library(tidyverse)

pull_salary <- function(x){
  download.file(url, destfile = "scrapedpage.html", quiet=TRUE)
  page <- xml2::read_html(x)
  
  salary <- 
    page %>%
    rvest::html_nodes(css = ".info") %>%
    rvest::html_text() %>%
    tibble::as_tibble() %>%
    dplyr::mutate(value = stringr::str_remove(value, "\\$"),
                  value = stringr::str_remove_all(value, ","),
                  value = as.double(as.character(value))) %>%
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
    dplyr::rename("name" = value)
  
  final <- cbind(players, team, salary)
  
  return(final)
  
}


# a function to output all acceptable team names

list_teams <- function(){
  teams <- c("los-angeles-dodgers", "new-york-yankees",
             "philadelphia-phillies", "houston-astros",
             "los-angeles-angels", "boston-red-sox",
             "new-york-mets", "washington-nationals",
             "san-diego-padres", "st-louis-cardinals",
             "chicago-cubs", "san-francisco-giants",
             "toronto-blue-jays", "atlanta-braves",
             "chicago-white-sox", "minnesota-twins",
             "cincinnati-reds", "colorado-rockies",
             "kansas-city-royals", "arizona-diamondbacks",
             "texas-rangers", "milwaukee-brewers",
             "detroit-tigers", "seattle-mariners",
             "oakland-athletics", "tampa-bay-rays",
             "miami-marlins", "baltimore-orioles",
             "pittsburgh-pirates", "cleveland-indians")
  teams
}



get_salary <- function(year, team){
  if (!is.numeric(year) || !is.character(team)){
    stop("year must be of type 'numeric' and team must be of type 'character'")
  }
  if (!(year %in% c(2018, 2019, 2020))) {
    stop("year must be in range 2018-2020")
  }
  if (!(team %in% list_teams())){
    stop("must use a valid team name")
  }
  link <- glue::glue("https://www.spotrac.com/mlb/rankings/{year}/salary/{team}/starting-pitcher/")
  data <- pull_salary(link)
  return(as_tibble(data))
}
  
  
  
  
  
  
  
  
  
  
  



  
  
  