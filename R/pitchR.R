#' MLB Pitcher Statistics
#' 
#' Basic counting statistics, advanced, Sabermetric analytics, and salaries for starting MLB pitchers from 2015-2019.
#' 
#' @docType data
#' @name pitchR
#' @usage data(pitchR)
#' @format  A data frame with 457 observations on the following 36 variables. Each observational unit in our dataset represents the season of an individual MLB pitcher between 2015 and 2019.
#' \itemize{
#' \item{\code{Pitches}}{ Total number of pitches thrown}
#' \item{\code{Pitcher}}{ Pitcher name}
#' \item{\code{Year}}{ MLB season}
#' \item{\code{BA	}}{ Batting average against}
#' \item{\code{BABIP}}{ Batting average on balls in play against}
#' \item{\code{wOBA}}{ Weighted on base average against}
#' \item{\code{xwOBA}}{ Statcast's expected weighted on base average against}
#' \item{\code{xBA}}{ Statcast's expected batting average against}
#' \item{\code{Hits}}{ Total number of hits given up}
#' \item{\code{ABs}}{ Total number of batters faced}
#' \item{\code{spin_rate}}{ Average spin rate (revolutions per minute)}
#' \item{\code{Velocity}}{ Average velocity (MPH)}
#' \item{\code{W}}{ Total wins}
#' \item{\code{L}}{ Total losses}
#' \item{\code{G}}{ Total games}
#' \item{\code{ERA}}{ Earned run average over the season}
#' \item{\code{H}}{ Total hits given up}
#' \item{\code{HR}}{ Total home runs given up}
#' \item{\code{BB}}{ Total batters walked on balls}
#' \item{\code{SO}}{ Total strikeouts}
#' \item{\code{K_percent}}{ Strikeout percent}
#' \item{\code{BB_percent}}{ Percent of batters walked on balls}
#' \item{\code{hard_hit_percent}}{ Percentage of pitches that resulted a "hard hit" by statcast's definition (exit velocity of >95 mph)}
#' \item{\code{barrel_percent}}{ Percentage of pitches that resulted in a "barrel", which statcast defines as a hit ball with an exit velocity and launch angle that have led to a minimum .500 batting average and 1.500 slugging percentage historically}
#' \item{\code{ERA_t1}}{ ERA in the next season}
#' \item{\code{Salary	}}{ Salary (US dollars)}
#' \item{\code{salary_t1	}}{ Salary of the next season}
#' \item{\code{BFP_per_G	}}{ Batters faced per game}
#' \item{\code{BABIP_minus_meanBABIP	}}{ Pitcher's BABIP subtracted by the mean BABIP of the league, meant to represent a quantification of the pitcher's luck}
#' \item{\code{xwOBA_minus_wOBA}}{ Pitcher's statcast expected wOBA minus observed wOBA, also a luck-reversion variable}
#' \item{\code{ERA/Barrel %	}}{ Pitcher ERA divided by barrel %, also a luck-reversion variable attempting to connect the amount of hard contact given up with the amount of runs allowed}
#' \item{\code{ERA/Hard Hit %	}}{ Pitcher ERA divided by hard hit %, yet another luck-reversion variable similar to ERA/barrel %}
#' \item{\code{ΔERA	}}{ Change in pitcher ERA from current season to the next}
#' \item{\code{ΔSalary	}}{ Change in pitcher salary from current season to the next}
#' \item{\code{luck_adj_ERA	}}{ Raw pitcher ERA adjusted with variously-weighted luck-reversion statistics}
#' }
#' @source 
#' Data collated by Riley Leonard, Andy Zhao, and Josh Yamamoto and used in the "Math 241" final project in order to model future ERA and salary based off current statistics. The basic counting statistics was taken from Sean Lahman's baseball database, Statcast data was downloaded via baseballsavant, the salary was scraped from Sportrac. 
#' For a more in-depth explanation of many of these variables see: 
#' <http://m.mlb.com/glossary/>
"pitchR"