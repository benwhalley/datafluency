# TODO for next year

- **data-wrangling1 / data-wrangling2: replace `recode()` + `!!!` splicing.** `recode()` is
  superseded. dplyr 1.2 adds `recode_values(x, from = names(map), to = map)`, which avoids the
  `!!!` splice students find hardest. Switch once the RStudio server has dplyr >= 1.2 (it had
  1.1.3 in Sept 2026, where `case_match()` is the available alternative).
