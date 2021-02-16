
# pitchR <img src= "https://github.com/Reed-Math241/pkgGrpq/blob/master/figs/IMG_0175.png" align="right" width=175 />

<!-- badges: start -->

<!-- badges: end -->

The goal of `pitchR` is to provide an accessible dataset with advanced
pitching statistics and salary data for individual starting pitchers
from the 2018-2020 regular seasons. As a robust and tidy dataset,
`pitchR` provides a great resource for modeling with baseball’s most
novel advanced statistics ⚾.

<img src="man/figures/README-hist-1.png" width="75%" style="display: block; margin: auto;" />

## Installation

The development version of `pitchR` is available from
[GitHub](https://github.com/Reed-Math241/pkgGrpq) with:

``` r
# install.packages("devtools")
devtools::install_github("Reed-Math241/pkgDemo")
```

## About the Data

Salary data was collected from
[Spotrac](https://www.spotrac.com/mlb/rankings/2018/salary/starting-pitcher/)
and advanced pitching statistics from Baseball Savant’s
[Statcast](https://baseballsavant.mlb.com/statcast_search). The full
scraping and cleaning process is documented
[here](https://github.com/Reed-Math241/pkgGrpq/blob/master/data-raw/DATASET.R).

The `pitchR` package contains one dataset, with 24 variables and 662
observations.

``` r
library(pitchR)
data('pitchR')
```

Here is a simplified version of the data; run `?pitchR` for a more
in-depth description:

``` r
head(pitchR, 3)
#> # A tibble: 3 x 24
#>   name  salary team   Year pitches player_id    ba   iso babip   slg  woba xwoba
#>   <chr>  <dbl> <chr> <dbl>   <dbl>     <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 clay… 3.56e7 LAD    2018    2364    477132 0.227 0.139 0.276 0.366 0.272 0.285
#> 2 rich… 1.67e7 LAD    2018    2104    448179 0.219 0.181 0.272 0.4   0.297 0.309
#> 3 hyun… 7.83e6 LAD    2018    1238    547943 0.221 0.14  0.282 0.362 0.268 0.278
#> # … with 12 more variables: xba <dbl>, hits <dbl>, abs <dbl>,
#> #   launch_speed <dbl>, launch_angle <dbl>, spin_rate <dbl>, velocity <dbl>,
#> #   effective_speed <dbl>, whiffs <dbl>, swings <dbl>, takes <dbl>,
#> #   release_extension <dbl>
```

Here is a breakdown of how much missing data we have by variable. We
opted to keep observations with missing values in order to keep a full
version of the salary data.

<img src="man/figures/README-missing-data-1.png" width="75%" style="display: block; margin: auto;" />

## Examples

By virtue of `pitchR` having data from 3 different years, there is a lot
of summarizing and comparing that can be done. For example:

``` r
library(tidyverse)

pitchR %>% 
  count(Year)
#> # A tibble: 3 x 2
#>    Year     n
#>   <dbl> <int>
#> 1  2018   251
#> 2  2019   211
#> 3  2020   200

pitchR %>% 
  group_by(Year) %>% 
  summarize(across(where(is.numeric), mean, na.rm = T))
#> # A tibble: 3 x 22
#>    Year salary pitches player_id    ba   iso babip   slg  woba xwoba   xba  hits
#>   <dbl>  <dbl>   <dbl>     <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1  2018 4.50e6   1716.   563538. 0.255 0.173 0.294 0.428 0.327 0.333 0.256  98.6
#> 2  2019 5.15e6   1906.   576284. 0.259 0.192 0.301 0.451 0.327 0.332 0.259 112. 
#> 3  2020 5.76e6    759.   595009. 0.242 0.173 0.284 0.416 0.310 0.312 0.249  41.7
#> # … with 10 more variables: abs <dbl>, launch_speed <dbl>, launch_angle <dbl>,
#> #   spin_rate <dbl>, velocity <dbl>, effective_speed <dbl>, whiffs <dbl>,
#> #   swings <dbl>, takes <dbl>, release_extension <dbl>
```

Another exciting feature of the package is the inclusion of expected
statistics:

<img src="man/figures/README-pitcher_woba-1-1.png" width="75%" style="display: block; margin: auto;" />
