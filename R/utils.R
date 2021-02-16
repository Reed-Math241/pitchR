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


pull_salary <- function(x){
  
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
  
  final
  
}