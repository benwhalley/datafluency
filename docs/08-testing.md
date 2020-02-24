# Testing

### In brief

> A single statistical model can test many different hypotheses. Sometimes these
> hypotheses can, superficially, sound similar---but selecting the relevant test
> and reporting it correctly can sometimes be a challange. R packages exist to
> make specifying and reporting tests easier, but none can automate the process:
> Testing hypotheses always requires thought about both the research question in
> hand alongside statistical issues. The replication crisis has brought renewed
> focus on the pitfalls of multiple testing and researcher degrees of freedom.
> Both technical strategies and research policies can mitigate this risk to some
> degree, but research integrity is crucial.

## Session 1

Types of test to cover:

#### Multiple parameters

- Interactions with F
- Interactions with BF model comparison
- Multiple (blocked) predictors

#### Group/cell comparisons

- Pairwise comparisons
- Cell vs mean

#### Specific predictions

- Ordered differences with BF







### Planned contrasts Using BF



```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✔ ggplot2 3.2.1     ✔ purrr   0.3.3
## ✔ tibble  2.1.3     ✔ dplyr   0.8.4
## ✔ tidyr   1.0.2     ✔ stringr 1.4.0
## ✔ readr   1.3.1     ✔ forcats 0.4.0
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```r
library(BayesFactor)
```

```
## Loading required package: coda
```

```
## Loading required package: Matrix
```

```
## 
## Attaching package: 'Matrix'
```

```
## The following objects are masked from 'package:tidyr':
## 
##     expand, pack, unpack
```

```
## ************
## Welcome to BayesFactor 0.9.12-4.2. If you have questions, please contact Richard Morey (richarddmorey@gmail.com).
## 
## Type BFManual() to open the manual.
## ************
```

```r
disgust_data = read.table(url('http://www.learnbayes.org/disgust_example.txt'),header=TRUE)
bf1 = anovaBF(score ~ condition, data = disgust_data)

bf_for_null <- as.vector(1 / bf1)

samples.df = posterior(bf1, iterations = 100000) %>% as_tibble() %>%
  rename(Con = `condition-control`,
         Lem = `condition-lemon`,
         Sul = `condition-sulfur`)
```

```
## Warning: Calling `as_tibble()` on a vector is discouraged, because the behavior is likely to change in the future. Use `tibble::enframe(name = NULL)` instead.
## This warning is displayed once per session.
```

```r
samples.df %>%
  mutate(rightorder = (Con > Lem) & (Sul > Con)) %>%
  summarise( mean(rightorder) / (1/6) )
```

```
## # A tibble: 1 x 1
##   `mean(rightorder)/(1/6)`
##                      <dbl>
## 1                     4.34
```

```r
4.33 / bf_for_null
```

```
## Intercept only 
##       3.350625
```


###  With `emmeans`

In this session we primarily cover the `emmeans` library and ways to test
planned contrasts in an experimental design.

<!--


When performing statistical tests, I always keep in mind this quote from the
famous scientist Richard Feynman:

> The first principle is that you must not fool yourself and you are the easiest
> person to fool.
> [Feynman, 1974](http://calteches.library.caltech.edu/51/2/CargoCult.htm)


 -->
