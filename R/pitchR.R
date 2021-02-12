#' MLB Pitcher Statistics
#' 
#' Basic counting statistics, advanced, Sabermetric analytics, and salaries for starting MLB pitchers from 2018-2020.
#' 
#' @format A tibble of N observations and the following 22 variables:
#' \describe{
#'  \item{pitches	}{Total number of pitches thrown}
#'  \item{player_id}{Player MLB ID}
#'  \item{player_name}{Pitcher name}
#'  \item{year}{MLB season}
#'  \item{ba	}{Batting average against}
#'  \item{iso}{Isolated power against, only counts extra base hits (doubles, triples, home runs)}
#'  \item{babip}{Batting average on balls in play against}
#'  \item{slg}{Slugging percentage against, represents the total number of bases a player records per at-bat}
#'  \item{woba}{Weighted on base average against, similar to slg but considers walk rate}
#'  \item{xwoba}{ Statcast's expected weighted on base average against, expected values are derived by comparing the exit velocity and launch angle of batted balls against historical outcomes}
#'  \item{xba}{ Statcast's expected batting average against, expected values calculated as described above}
#'  \item{hits}{ Total number of hits given up}
#'  \item{abs}{ Total number of batters faced}
#'  \item{launch_speed}{ Average speed of batted balls against}
#'  \item{launch_angle	}{ Average angle of batted balls against}
#'  \item{spin_rate}{ Average spin rate (revolutions per minute)}
#'  \item{velocity}{ Average velocity (MPH)}
#'  \item{effective_speed	}{ Average velocity (MPH) after accounting for pitcher extension on the mound}
#'  \item{whiffs}{ Total number of times batters swung and whiffed on the player's pitches}
#'  \item{swings}{ Total number of times batters swung at the player's pitches}
#'  \item{takes	}{ Total number of times batters "took" the pitch by not swinging at the ball}
#'  \item{release_extension}{ How far off the mound a pitcher releases the pitch (feet)}
#'   }
#' 
#' 
#' @source {Data collated by Riley Leonard, Andy Zhao, and Josh Yamamoto and used in the Math 241 final project in order to model future ERA and salary based off current statistics. The basic counting statistics was taken from Sean Lahman's baseball database, Statcast data was downloaded via baseballsavant, the salary was scraped from Sportrac.}
#'  
#' @source {For a more in-depth explanation of many of these variables see} 
#' \url{http://m.mlb.com/glossary}
#' \url{https://baseballsavant.mlb.com/csv-docs}
"pitchR"
