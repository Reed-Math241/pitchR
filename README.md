
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this.  -->

# pitchR <img src= "https://github.com/Reed-Math241/pkgGrpq/blob/master/figs/IMG_0175.png" align="right" width=175 />

<!-- badges: start -->

<!-- badges: end -->

The goal of pitchR is to create an accessible dataset with advanced
pitcher statistics by season and their corresponding salaries. This
dataset contains statistics from the 2018, 2019, and 2020 seasons.

## Installation

The development version of pitchR is available from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Reed-Math241/pkgDemo")
```

## About the Data

Data were collected and made available by
[Spotrac](https://www.spotrac.com/mlb/payroll/) and the
[Savant](https://baseballsavant.mlb.com/statcast_search).

The pitchR package contains one dataset, with data on Pitchers from the
2018-2020 Seasons.

``` r
library(pitchR)
data('pitchR')
```

Here is a simplified version of the raw data; use `?pitchR` for more
info:

``` r
head(pitchR)
```

    ## # A tibble: 6 x 23
    ##   name  salary pitches player_id  year    ba   iso babip   slg  woba xwoba   xba
    ##   <chr>  <dbl>   <dbl>     <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ## 1 Clay… 3.56e7    2364    477132  2018 0.227 0.139 0.276 0.366 0.272 0.285 0.24 
    ## 2 Rich… 1.67e7    2104    448179  2018 0.219 0.181 0.272 0.4   0.297 0.309 0.229
    ## 3 Kent… 6.12e6    2051    628317  2018 0.24  0.159 0.323 0.399 0.304 0.292 0.225
    ## 4 Alex… 6.00e6    2443    622072  2018 0.247 0.116 0.295 0.363 0.288 0.295 0.244
    ## 5 Ross… 5.55e5    1999    548389  2018 0.257 0.174 0.324 0.431 0.309 0.272 0.223
    ## 6 Masa… 2.20e7    2398    547888  2018 0.24  0.182 0.286 0.422 0.307 0.311 0.247
    ## # … with 11 more variables: hits <dbl>, abs <dbl>, launch_speed <dbl>,
    ## #   launch_angle <dbl>, spin_rate <dbl>, velocity <dbl>, effective_speed <dbl>,
    ## #   whiffs <dbl>, swings <dbl>, takes <dbl>, release_extension <dbl>

``` r
ggplot(data = pitchR, aes(x = velocity, y = spin_rate)) +
  geom_point(
    aes(color = whiffs),
    alpha = 0.4
    ) +
  theme_minimal() +
  scale_color_distiller(direction = -1, palette = "YlGn") +
  labs(
    title = "Velocity, Spin Rate, and Whiffs",
    subtitle = "Whiffs: Total Number of times a batter swung and whiffed on the player's pitch",
    x = "Velocity (MPH)",
    y = "Spin Rate (Revolutions per Min.)"
    ) +
  theme(
    legend.background = element_rect(fill = "white", color = NA),
    plot.title.position = "plot",
    plot.caption = element_text(hjust = 0, face = "italic"),
    plot.caption.position = "plot"
    )
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->
