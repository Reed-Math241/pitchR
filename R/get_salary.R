# a vector of all acceptable team names

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



get_salary <- function(year, team){
  if (!is.numeric(year) || !is.character(team)){
    stop("year must be of type 'numeric' and team must be of type 'character'")
  }
  if (!(year %in% c(2018, 2019, 2020))) {
    stop("year must be in range 2018-2020")
  }
  if (!(team %in% teams)){
    stop("must use a valid team name")
  }
  link <- glue::glue("https://www.spotrac.com/mlb/rankings/{year}/salary/{team}/starting-pitcher/")
  
  data <- pull_salary(link)
  
  as_tibble(data)
}
  
  
  
  
  
  
  
  
  
  
  



  
  
  