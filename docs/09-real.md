# Real world data {#real-world-data}



### In brief

> In the real world datasets are never neat and tidy, and findings rarely
> cut-and-dried. Dealing with complexity and ambiguity is part of the role of
> the scientist. In these final sessions and the assessment we apply the skills
> we have learnt to real world examples.



## Session 1: Reproducing a real paper

In this session we dissect a specific published paper, attempt to replicate the
authors findings, and reflect on the challenges of reproducing findings given
the current state of scientific publishing.


#### The assessment {.exercise}

Read the assessment. Discuss in groups what you think is necessary for each part of the assessment. What sort of work is going to be required for each part?
Make notes on any points of disagreement or different interpretations and collate these.


#### Your paper {.exercise}

Work in groups of 3 and give a short summary of each of your papers to the others in the group. If there are people in your group without their own paper, discuss the process of finding it and what worked for you.

Reflect on the process of reading statistical methods sections in detail. Is this something you do regularly? What did you take away from the experience this time?


#### Questions {.exercise}

- What are the primary research questions of the paper?

- What predictions (if any) do the authors make?

Complete the relevant columns in the xls file here: <https://liveplymouthac-my.sharepoint.com/:x:/g/personal/ben_whalley_plymouth_ac_uk/EamnhLiSjGNJqtQa-ZKOwrsBqzFlvSqG25RnHT-wQTj6vw?e=GS6OIV>


#### Manipulation and measurement {.exercise}

- What measurements does the study make to answer these questions? What instruments/scales/other outcomes are there?

- What variables are used as predictors?

- What experimental manipulations are used? How many groupings are formed by group allocations?

- Can these measurements be used directly, or do they need to be aggregated summarised or processed in some way before they are informative?

Complete the relevant columns in the xls file.


#### Statistical tests {.exercise}


- What statistical techniques does your paper use to address the primary research questions?

- Have all of the techniques been covered in PSY753? If not, make specific notes of terms you are unfamiliar with, and/or would like to learn.

- Confer with your group. Sometimes the same technique can be given different names. See if you can collaborate to work out what techniques/models are being used.

Complete the relevant columns in the xls file.



### For reference,

For reference, the fields in the spreadsheet are:

- First name
- Surname
- Email
- Programme
- Title of your chosen paper
- DOI or URL
- Brief summary of the paper
- Describe the primary outcome
- Was there an experimental manipulation? If so describe it briefly here.
- Describe any other predictor variables here.
- Describe/record predictions made in the introduction. Note if they are explicit or implicit.
- What statistical techniques are used in this paper? If you can describe them in terms of an `lm` model in R that is great, but don't worry if not - just describe what is done.
- Specifically, note any techniques you are not familiar with, or don't think have been covered so far in PSYC753. Include specific quotes from the methods section to illustrate.

I want everyone to have had a first-pass at completing the xls sheet before our next session.



## Session 2: Developing skills

In this session we will do additional work to build the skills you need to
develop your own replication (responding to the gaps you have identified).
You will build on skills learnt in previous weeks to wrangle the published
data into a suitable format, plot the data, and decide
which analyses to run for inferential tests.



### What is Ancova?


:::{.note}

Note: what follows are notes to support the talk I gave in-class. I don't expect you to work through these materials like a worksheet because the content is broadly similar to what has gone before — it's really the explanation that differs. There are specific exercises to complete at the end.

:::



Anova is just a regular linear model (`lm`) with one or more categorical variables as predictors.

The example dataset I described was as follows:

> A student dissertation project investigated the analgesic quality of music
during an experimental pain stimulus. Music was selected to be either _liked_
(or disliked) by participants and was either _familiar_ or unfamiliar to them.
Pain was rated without music (`no.music`) and with music (`with.music`) using a
10cm visual analog scale anchored with the labels "no pain" and "worst pain
ever".


I suggested we might run a linear model to predict pain scores when music was playing, including the two experimental variables:


```r
# this library is useful to provide a summary of lm models, see below
library(pander)

# read the data in
painmusic <-  read_csv('data/painmusic.csv')

# run a linear model
m.withmusic <- lm(with.music ~ liked * familiar, data=painmusic)

# show the output
m.withmusic %>%
  pander()
```


---------------------------------------------------------------------------------
              &nbsp;                 Estimate   Std. Error   t value   Pr(>|t|)  
----------------------------------- ---------- ------------ --------- -----------
          **(Intercept)**              5.5        0.3851      14.28    1.243e-26 

          **likedLiked**              -0.75       0.5446     -1.377     0.1713   

      **familiarUnfamiliar**          0.3571      0.5446     0.6558     0.5133   

 **likedLiked:familiarUnfamiliar**    0.1071      0.7701     0.1391     0.8896   
---------------------------------------------------------------------------------

Table: Fitting linear model: with.music ~ liked * familiar

The issue with the output is that we have 4 coefficients which don't map onto the questions we have. We want to know:

- Did familiarity make a difference
- Did liking make a difference
- Was there an *interaction* between familiarity and liking


To test this using frequentist methods we can use the `car::Anova` function:


```r
car::Anova(m.withmusic, type=3)
Anova Table (Type III tests)

Response: with.music
               Sum Sq  Df  F value Pr(>F)    
(Intercept)    847.00   1 204.0086 <2e-16 ***
liked            7.88   1   1.8968 0.1713    
familiar         1.79   1   0.4301 0.5133    
liked:familiar   0.08   1   0.0194 0.8896    
Residuals      448.39 108                    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

The `car::Anova` function is really just a special way of **displaying** results from a linear model. The important part is still the model formula, `with.music ~ liked * familiar`.


### Why use `car::Anova()` and not `anova`?

For many years SPSS made things simple: it largely hid the fact that when reporting Anova tests you need to choose the way the sums of squares (and so F ratios) are calculated when interactions are included in a model.

- Note: this ONLY matters if your model has an interaction term (e.g. `y ~ A*B`).

- Sometimes people don't report which they use.

- Because so many people used SPSS for so many years, most papers will report ***Type 3*** sums of squares. This is a good first guess.

- There are good reasons to use Type 2 instead though.

- The default `anova` function in R gives Type 1 sums of squares. This doesn't matter for models without an interaction, but is probbaly not a good choice if you do have interactions.

- The easist way to chose which type is to use `car::Anova(savedmodel, type=3)` instead of the built in `anova` function.


If you want more explanation of why/how to choose, see: <https://mcfromnz.wordpress.com/2011/03/02/anova-type-iiiiii-ss-explained/> or for a more technical reference see @venables1998exegeses.



### Modelling change scores

The  model above only uses the `with.music` pain ratings - i.e. scores when music was playing. To estimate the effect of the intervention properly we want to see the difference between scores with and without music:


```r
m.effectofmusic <- lm((no.music - with.music) ~ liked * familiar, data=painmusic)
m.effectofmusic %>%
  pander()
```


--------------------------------------------------------------------------------
              &nbsp;                 Estimate   Std. Error   t value   Pr(>|t|) 
----------------------------------- ---------- ------------ --------- ----------
          **(Intercept)**            -0.5357      0.2928     -1.829     0.0701  

          **likedLiked**              1.071       0.4141      2.587    0.01101  

      **familiarUnfamiliar**         0.07143      0.4141     0.1725     0.8634  

 **likedLiked:familiarUnfamiliar**   -0.9643      0.5857     -1.646     0.1026  
--------------------------------------------------------------------------------

Table: Fitting linear model: (no.music - with.music) ~ liked * familiar

Notice that we didn't create a new variable using mutate: we just used `(no.music - with.music)` on the left hand side of the `~` sign. R knows what we mean and creates the extra column for us behind the scenes.


After running the model we can use the `anova` function again to get the Anova table and F tests:


```r
car::Anova(m.effectofmusic, type=3)
Anova Table (Type III tests)

Response: (no.music - with.music)
                Sum Sq  Df F value  Pr(>F)  
(Intercept)      8.036   1  3.3466 0.07010 .
liked           16.071   1  6.6933 0.01101 *
familiar         0.071   1  0.0297 0.86339  
liked:familiar   6.509   1  2.7108 0.10258  
Residuals      259.321 108                  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Because we are now modelling **differences** in pain between when music is/isn't playing we have a much more powerful test. We can see that the F test for `liked` is p < .05 (although that isn't a very high bar).


### Using Ancova to 'control for baseline'

A common alternative is to put the `no.music` score on the right of the `~` sign, as a covariate:


```r
music.ancova <- lm(with.music ~ no.music + liked * familiar, data=painmusic)
music.ancova %>%
  pander()
```


---------------------------------------------------------------------------------
              &nbsp;                 Estimate   Std. Error   t value   Pr(>|t|)  
----------------------------------- ---------- ------------ --------- -----------
          **(Intercept)**             1.847       0.4585      4.029    0.0001052 

           **no.music**               0.7359     0.07345      10.02    4.63e-17  

          **likedLiked**             -0.9865      0.3937     -2.506     0.01372  

      **familiarUnfamiliar**         0.04177      0.3943     0.1059     0.9158   

 **likedLiked:familiarUnfamiliar**    0.7379      0.5593      1.319     0.1899   
---------------------------------------------------------------------------------

Table: Fitting linear model: with.music ~ no.music + liked * familiar

This means we have run a multiple regression with two categorical variables and their interaction PLUS a continuous predictor.

If we use the `anova` function on this model, the results are (perhaps confusingly) known as an **Ancova** or analysis of co-variance.


```r
music.ancova %>% car::Anova(type=3)
Anova Table (Type III tests)

Response: with.music
                Sum Sq  Df  F value    Pr(>F)    
(Intercept)     35.092   1  16.2292 0.0001052 ***
no.music       217.031   1 100.3721 < 2.2e-16 ***
liked           13.576   1   6.2788 0.0137250 *  
familiar         0.024   1   0.0112 0.9158285    
liked:familiar   3.763   1   1.7404 0.1899089    
Residuals      231.362 107                       
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

As with the change score model above, we have more power to detect effects of the intervention than with the very first model.

By including no-music scores as a covariate we have 'controlled-for' the variation between individals. Each participant acts as their own control.


### Why this isn't a repeated measures model?

In this experiment we took two measures of pain: with and without music. However, because we are interested in the difference between these two, we can either use change scores as our outcome, or include no-music as a covariate (which amounts to much the same thing).

We couldn't have done this if we had taken 3 measures... e.g. if we had measures before, during and after music was played.

The key difference is that in these models, the outcome  an be represented by a single column of numbers, and where each participant has only 1 row in the datafile. Any time you have more data than that we need to use a proper repeat-measures model.




### Other uses of Ancova

The other example I gave in the workshop was from `gapminder`.

This is the case where we have some outcome, `y`, and a categorical predictor, `x`, but we want to 'control for' some other variable, `Z`.

Technically, this is just the same as the Ancova example above. Only the ***interpretation*** differs.

I said, in R, we just write: `y ~ z + x` to estimate group differences, controlling for `z` (and where `x` is a categorical variable).


The models I showed were:


```r
m.without <- lm(lifeExp~continent, data=gapminder::gapminder)
m.without %>% pander
```


----------------------------------------------------------------------
        &nbsp;           Estimate   Std. Error   t value    Pr(>|t|)  
----------------------- ---------- ------------ --------- ------------
    **(Intercept)**       48.87       0.3696      132.2        0      

 **continentAmericas**    15.79       0.6486      24.35    1.38e-112  

   **continentAsia**       11.2       0.5931      18.88    2.438e-72  

  **continentEurope**     23.04       0.611       37.71    1.383e-226 

 **continentOceania**     25.46        1.92       13.26     2.99e-38  
----------------------------------------------------------------------

Table: Fitting linear model: lifeExp ~ continent

And then including `pop` and `gdpPercap` as covariates:



```r
m.with <-  lm(lifeExp~gdpPercap+pop+continent, data=gapminder::gapminder)
m.with %>% pander()
```


-----------------------------------------------------------------------
        &nbsp;           Estimate    Std. Error   t value    Pr(>|t|)  
----------------------- ----------- ------------ --------- ------------
    **(Intercept)**        47.81       0.3395      140.8        0      

     **gdpPercap**       0.0004495   2.346e-05     19.16    3.239e-74  

        **pop**          6.57e-09    1.975e-09     3.326    0.0009007  

 **continentAmericas**     13.48        0.6        22.46    5.188e-98  

   **continentAsia**       8.193       0.5712      14.34    4.064e-44  

  **continentEurope**      17.47       0.6246      27.97    6.335e-142 

 **continentOceania**      18.08       1.782       10.15     1.59e-23  
-----------------------------------------------------------------------

Table: Fitting linear model: lifeExp ~ gdpPercap + pop + continent


I then used `broom::augment` (which we previously encountered in the section on [predictions from regression models](#explanation-first-predictions)).

I created a new dataframe with one row per-continent, and where the values for `pop` and `gdpPercap` were set to the mean of all countries:


```r
nd = tibble(continent=unique(gapminder::gapminder$continent),
            gdpPercap=mean(gapminder::gapminder$gdpPercap),
            pop=mean(gapminder::gapminder$pop),
                           )
```


Then I made predictions from both models (with and without covariates) as a kind of ***sensitivity analysis***:


```r
without <- lm(lifeExp~continent, data=gapminder::gapminder) %>%
  broom::augment(newdata=nd) %>%
  mutate(model="without")

with <- lm(lifeExp~gdpPercap+pop+continent, data=gapminder::gapminder) %>%
  broom::augment(newdata=nd) %>%
  mutate(model="with")
```

Then I used `bind_rows` from `dplyr` to combine the two dataframes and make a single plot:


```r
bind_rows(without, with) %>%
  ggplot(aes(forcats::fct_rev(model), .fitted, fill=model)) +
  stat_summary(geom="bar", fun.data=mean_se) +
  coord_cartesian(ylim=c(40,80) )+
  facet_grid(.~continent) +
  xlab("With or without covariates") + ylab("Estimated life expectancy") +
  scale_fill_discrete(guide=F)
```

<img src="09-real_files/figure-html/unnamed-chunk-12-1.png" width="672" />


At this point, I probably droned on and on about how:

- Anova is a nickname for one way of presenting the unadjusted model.
- An Ancova is a nickname for the same thing for the adjusted model.
- Sensitivity analyses are great and we should do more of them.
- You shouldn't really use bar plots and if you do they should definitely have error bars.


We can look at both 'anova' tables here:


```r
anova(m.without)
Analysis of Variance Table

Response: lifeExp
            Df Sum Sq Mean Sq F value    Pr(>F)    
continent    4 139343   34836  408.73 < 2.2e-16 ***
Residuals 1699 144805      85                      
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```



```r
anova(m.with) # this is actually an Ancova tale
Analysis of Variance Table

Response: lifeExp
            Df Sum Sq Mean Sq  F value    Pr(>F)    
gdpPercap    1  96813   96813 1383.457 < 2.2e-16 ***
pop          1   1815    1815   25.938 3.919e-07 ***
continent    4  66766   16691  238.521 < 2.2e-16 ***
Residuals 1697 118754      70                       
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


We saw that the F value for `continent` is smaller in the adjusted model, but we still see small *p* values for the group comparison so we would reject the null hypothesis that all the continents are the same.


Note also that in this example --- because we don't have an interaction term --- the type of sums of squares doesn't make a difference:


```r
car::Anova(m.with, type=2)
Anova Table (Type II tests)

Response: lifeExp
          Sum Sq   Df F value    Pr(>F)    
gdpPercap  25684    1  367.02 < 2.2e-16 ***
pop          774    1   11.06 0.0009007 ***
continent  66766    4  238.52 < 2.2e-16 ***
Residuals 118754 1697                      
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
car::Anova(m.with, type=3)
Anova Table (Type III tests)

Response: lifeExp
             Sum Sq   Df  F value    Pr(>F)    
(Intercept) 1387694    1 19830.13 < 2.2e-16 ***
gdpPercap     25684    1   367.02 < 2.2e-16 ***
pop             774    1    11.06 0.0009007 ***
continent     66766    4   238.52 < 2.2e-16 ***
Residuals    118754 1697                       
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

The type 3 table has an extra row for the intercept, but all the other *F* values are identical.



#### Is using Ancova a good idea?

In many papers you will hear authors claiming that they are 'controlling' for all sorts of variables. This is typically reported as the 'natural' thing to do, and unproblematic.

In these cases it is always a concern that the covariates were specified apriori. If there were not this is an important source of 'researcher degrees of freedom' [@gelman2014statistical, @simmons2011false].

However, in addition to concerns about researcher degrees of freedom, it has been known for many years that including covariates can introduce biases. In my talk I gave a few examples of this and the bias that can be generated.

The nature of the possible bias is dependent on the true causal pathways responsible for generating the data. It's important to note that for real datasets we can never know for sure if our results are biased: we only know it's a possiblity because simulation studies show this is the case.

For more on new approaches to deciding when to include covariates see @pearl2018book, chapter 4.

The main example I gave was: Imagine smoking causes some underlying change in our cardiovascular system, which then causes strokes. This causal diagram represents that (quite plausible) situation:

<!--html_preserve--><div id="htmlwidget-b24b9e70ef8587c7b1e6" style="width:672px;height:300px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-b24b9e70ef8587c7b1e6">{"x":{"diagram":"\n      digraph ab {\n      Smoking -> Unknown -> Stroke2\n      Unknown -> Stroke1\n      Stroke1 -> Stroke2 [style=invis]\n      }\n      ","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

If we wanted to know the effect of smoking on stroke we might be tempted to 'control for' the number of previous strokes, but that would be a disaster:

<!--html_preserve--><div id="htmlwidget-783d59eb9e41831b1136" style="width:672px;height:400px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-783d59eb9e41831b1136">{"x":{"diagram":"\n      digraph ab {\n      Smoking -> Stroke\n      PreviousStroke -> Stroke\n      Smoking -> PreviousStroke [style=dashed]\n      }\n      ","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

The reason is that the effect of smoking is now being 'shared', and we might well underestimate the true causall effect of smoking on stroke, misattributing is to some individual/dispositional cause.




##### Should you use covariates then?

There is a fairly simple rule of thumb: If you have an experiment, controlling for covariates is probably fine and is often a good idea (especially if it's a 'pre-test' measurement of the same outcome).

If you have observational data it's really not so simple and you should do some more thinking before assuming it will improve the quality of the inferences you draw.


(Note - for the purposes of the assessment you should reproduce the model faithfully, but you might like to consider the use of covariates when interpreting your findings or thinking about a sensitivity analysis).



### Exercises



#### Exercise 1 {.exercise}

1. Re-run both the models from above which use the gapminder data and calculate the Bayes Factor
2. How much evidence do we have that these covariates improve a continent-only model?




#### Exercise 2  {.exercise}

Read in the following data like this:


```r
fitdata <- read_csv('https://zenodo.org/record/1120364/files/blind_data.csv?download=1')
```

This is data from a trial of Functional Imagery Training (FIT) for weight loss which you have seen before.
The variables starting `kg` relate to participants weights. The `group` variable indicates whether they were allocated to FIT or motivational interviewing (the control condition).

- Run an Anova predicting `kg3` from `group`.
- Now run an Ancova predicting `kg3` from group, controlling for `kg1`
- What are the *F* and *p* values for the `group` effect in each model?
- Which  model is better, and why?
- Calculate the BF for the effect of FIT.



<div class='solution'><button class='solution-button'>Try for yourself first, but click here to see the code and results</button>



```r
m.fit <- lm(kg3~kg1 + group, data=fitdata)
m.fit.without <- lm(kg3~ group, data=fitdata)

anova(m.fit)
Analysis of Variance Table

Response: kg3
           Df  Sum Sq Mean Sq  F value    Pr(>F)    
kg1         1 24046.5 24046.5 1037.292 < 2.2e-16 ***
group       1   990.3   990.3   42.719 2.094e-09 ***
Residuals 109  2526.8    23.2                       
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
anova(m.fit.without)
Analysis of Variance Table

Response: kg3
           Df  Sum Sq Mean Sq F value Pr(>F)
group       1   546.2  546.16  2.2237 0.1388
Residuals 110 27017.5  245.61               
```

The *F* for the Anova is much smaller, and the p larger. We have less power in this
model to detect a group difference.

In the Ancova each participant acts as their own control, increasing statistical power.



</div>





#### Graphs {.exercise}

If you didn't complete this in the previous workshop the following would be good preparation for the assessment:


- For each of (up to 3) question/predictions, draw out a graph, by hand, which would make it easy to *see* the answer to the question.

- Create alternative graphs of the same information which emphasise different aspects of the data, or use different visual aesthetics to make distinctions. Some points to consider when designing different graphs:

  - Is there a tradeoff between showing group differences vs. relationships vs. distributional information?
  - Is it possible to show both raw data and summaries at the same time? What are the tradeoffs involved?
  - Who is your graph for? Are you designing for other interested experts, or busy managers?

Please note for this final question you don't have to limit yourself to graphs you (personally) can actually plot. If you can describe or draw the graph we can discuss how/whether it can be made and provide support.



#### Optional: Causal diagram {.exercise}

Draw out a causal diagram for the study you are trying to replicate  (it might be quite simple or rather complex depending on the study).  What other variables might influence the outcome which are not being captured by the authors?
Would Ancova make sense in this case?




#### Optional: Chi-squared {.exercise}

If your study requires a chi-squared test, you can work through the examples here:

- <https://benwhalley.github.io/just-enough-r/crosstabs.html#crosstabs>



#### Optional: Correlations  {.exercise}

If your study reports correlations, see this page for details of how to create and format a correlation table:

- <https://benwhalley.github.io/just-enough-r/correlations.html>


If you want to run a Bayesian test on a correlation, see these examples:

- <https://ajwills72.github.io/rminr/vbg_corr.html>


If your study reports non-parametric correlations ask me during a workshop and we can figure out the best way of calculating the correct numbers.


#### Optional extension {.exercise}


One thing we have not covered in details is the way in which outcomes and predictors can be scaled to ease interpretation of regression coefficients.

Read this page: <https://benwhalley.github.io/just-enough-r/scaling-predictors.html> and also @gelman_scaling_2008.

Run models using the gapminder data to predict `lifeExp` which include scaled or unscaled predictors. Compare the regression coefficients from each and decide which you find easiest to interpret and why.






<!--


Next week:

hierarchical regression
effect size

Then

multiple comparisons
reporting results





### Effect size

Standardised effect sizes
Other types of effect size
Clinically significant/meaningful change definitions
ROPE

Calculating Cohen's D



Non-para



Ancova with baseline
Anova for pre-post change scores
Anova 2x2 between subjects
Hierarchical multiple regression
Regression to test moderation
Post-hoc contrasts between groups
Cohen's D for group differences

Independent samples t test
Paired sample t test
Mann Whitney U
Chi square to test contingency table

Levene's test (equality of variances)
Cronbach's alpha




-->



