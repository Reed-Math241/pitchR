#' MLB Pitcher Statistics
#' 
#' Basic counting statistics, advanced, Sabermetric analytics, and salaries for starting MLB pitchers from 2015-2019.
#' 
#' @format A tibble with 457 rows and 31 variables:
#' \describe{
#' \item{Pitches}{ Total number of pitches thrown}
#' \item{Pitcher}{ Pitcher name}
#' \item{Year}{ MLB season}
#' \item{BA	}{ Batting average against}
#' \item{BABIP}{ Batting average on balls in play against}
#' \item{wOBA}{ Weighted on base average against}
#' \item{xwOBA}{ Statcast's expected weighted on base average against}
#' \item{xBA}{ Statcast's expected batting average against}
#' \item{Hits}{ Total number of hits given up}
#' \item{ABs}{ Total number of batters faced}
#' \item{spin_rate}{ Average spin rate (revolutions per minute)}
#' \item{Velocity}{ Average velocity (MPH)}
#' \item{W}{ Total wins}
#' \item{L}{ Total losses}
#' \item{G}{ Total games}
#' \item{ERA}{ Earned run average over the season}
#' \item{H}{ Total hits given up}
#' \item{HR}{ Total home runs given up}
#' \item{BB}{ Total batters walked on balls}
#' \item{SO}{ Total strikeouts}
#' \item{K_percent}{ Strikeout percent}
#' \item{BB_percent}{ Percent of batters walked on balls}
#' \item{hard_hit_percent}{ Percentage of pitches that resulted a "hard hit" by statcast's definition (exit velocity of >95 mph)}
#' \item{barrel_percent}{ Percentage of pitches that resulted in a "barrel", which statcast defines as a hit ball with an exit velocity and launch angle that have led to a minimum .500 batting average and 1.500 slugging percentage historically}
#' \item{Salary	}{ Salary (US dollars)}
#' \item{BFP_per_G	}{ Batters faced per game}
#' \item{BABIP_minus_meanBABIP	}{ Pitcher's BABIP subtracted by the mean BABIP of the league, meant to represent a quantification of the pitcher's luck}
#' \item{xwOBA_minus_wOBA}{ Pitcher's statcast expected wOBA minus observed wOBA, also a luck-reversion variable}
#' \item{ERA/Barrel %	}{ Pitcher ERA divided by barrel %, also a luck-reversion variable attempting to connect the amount of hard contact given up with the amount of runs allowed}
#' \item{ERA/Hard Hit %	}{ Pitcher ERA divided by hard hit %, yet another luck-reversion variable similar to ERA/barrel %}
#' }
#' 
#' 
#' @source {Data collated by Riley Leonard, Andy Zhao, and Josh Yamamoto and used in the "Math 241" final project in order to model future ERA and salary based off current statistics. The basic counting statistics was taken from Sean Lahman's baseball database, Statcast data was downloaded via baseballsavant, the salary was scraped from Sportrac. For a more in-depth explanation of many of these variables see}
"pitchR"
