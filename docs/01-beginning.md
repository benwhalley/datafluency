# BeginneRs {#beginners}

![Photo:  [1ksmiles.com](http://www.1ksmiles.com/wp-content/uploads/2014/03/standing-up-first-time-giraffe.jpg)](media/leggy.jpg)

### In brief

> A big part of psychology is collecting data about people, visualizing it (graphs etc.), and
> drawing conclusions. Working with data is a core skill for researchers, and increasingly important
> in many professions.

> RStudio, like Excel, is computer software that helps us to do that. RStudio is rapidly becoming
> the standard tool for serious data analysis in psychology and other sciences, because it's
> powerful, relatively easy to use, and free.

> In this course [we'll learn R](#reasons-to-use-r) as we go, building a little at a time. This and
> the next session covers the basics (things you would learn as part of an undergraduate statistics
> course at Plymouth). If some of this is familiar, there will be extension exercises to enhance
> your knowledge.



---

This material was adapted from
[Andy Wills' RminR](https://ajwills72.github.io/rminr/using_rstudio.html).

All content on this site distributed under a [Creative Commons](https://creativecommons.org/)
licence. CC-BY-SA 4.0.

## Getting started with RStudio {#getting-started-rstudio}

Open a web browser (e.g. [Firefox](https://www.mozilla.org/en-US/firefox/new/), Safari, Chrome,
_not_ Edge) and go to an
[RStudio server, like the one at: https://rstudio.plymouth.ac.uk](https://rstudio.plymouth.ac.uk).
Log on, using the username and password you have been given.

If that works, you should see something like this:

![RStudio on first opening](media/rstudio-new.png)

We'll go through what it all means in a bit. But, first, we're going to...

#### Create a new project

RStudio uses **_projects_** to help you keep your work organized, and to make sure you have a record
of your analyses. You should start a new project each time you start a new module in your degree
(possibly more frequently, but we'll come back to that later). Here's how to create a new project:

1. At the top right of RStudio, you will see a little blue cube, with the text "Project: (none)".
   Click on this, and select "New project".

![RStudio without a project open](media/rstudio-new.png)

2. Now click "New Directory"

![Project dialog #1](media/create1.png)

3. Now click "New Project"

![Project dialog #2](media/create2.png)

4. Next, type in a name for the project that makes sense to you in the "Directory name" box. I've
   typed _psyc411_, but you should pick something more meaningful to you (e.g. _beginning-r_). Then
   click "Create project".

![Project dialog #3](media/create3.png)

5. Now, create a _R script_. An R script is a record of the analyses you have done. You create an R
   Script by clicking on the white plus sign on a green background (see below), and then clicking on
   "R Script".

![Script menu](media/script1.png)

If everything worked well, your screen should now look like this:

![Project created](media/project-made.png)

You should be able to see four parts:

1. The **Script** window - This is the rectangle on the top left. This is where you will tell R what
   to do. It only does what you tell it.

2. The **Console** window - This is the rectangle on the bottom left. This is where R prints the
   answers to your questions.

3. The **Environment** window - This is the rectangle on the top right. It's where R keeps a list of
   the data it knows about. It's empty at the moment, because we haven't given R any data yet.

4. The **Files** - This is the rectangle on the bottom right. This is a bit like the _File Explorer_
   in Windows, or the _Finder_ on a Mac. It shows you what files are in your R project.

That's it! You're all set to start learning how to analyse data in R.

<!--






 -->

## Exploring data (in brief) {#exploring-data-brief}

::: {.exercise}

Before starting this exercise, you should have had a brief introduction to using RStudio. If not,
take a look at the [Using RStudio](#getting-started-rstudio) worksheet.

:::

### Contents

-   [How to use these worksheets](#worksheets-how-to)
-   [Loading a package](#loading-a-package)
-   [Loading data](#loading-data)
-   [Inspecting data](#inspecting-data)
-   [Calculating a mean](#calculating-a-mean)
-   [Dealing with missing data](#missing-data)

### How to use these worksheets. {#worksheets-how-to}

Throughout this worksheet (and others on the course), you'll see the commands you should type into
RStudio inside a grey box, followed by the output you should expect to see in one or more white
boxes. Any differences in the colour of the text in these boxes can be ignored.

New commands in the worksheets are followed by one or more _explanation_ sections - those are there
to help you understand how the commands work and how to read the output they produce.

In some cases there will also be hidden answers or additiona explanations. To see these, you can see


<div class='solution'><button class='solution-button'>Click the boxes like this</button>


And text will appear!


</div>


---

In other places you will see sections in blue, like this:

:::{.exercise}

These sections are exercises for you to complete. The are the most important sections in the
worksheet, and you should always work through all of these problems.

:::

---

Finally, sometimes you will see questions with text boxes next to them. You just need to type in the
right answer ([42](https://www.urbandictionary.com/define.php?term=42)), and the box outline will go
blue:

**The answer to life, the universe and everything is:**
<span class='webex-fitb' id = 'Q229687' ><input class='solveme  nospaces' data-digits=4 size=2  style='width:2em;'  data-answer='["42"]'/><span class='solvedme'></span></span>

Other questions might ask you to make calculations. For these the text box acts like a mini
calculator. Try typing `1000 * 1024` into this box: <span class='webex-fitb' id = 'Q558021' ><input class='solveme  nospaces calculator' data-digits=4 size=7  style='width:7em;'  data-answer='["1024000"]'/><span class='solvedme'></span></span>

[Why do we use `*` and not $\times$?](#compoperators)).

:::{#compoperators .sidenote}

In most computer languages (and also in Excel) the arithmetic operators are:

-   `*` for multiplication
-   `/` for division
-   `^` for powers (e.g. `2^4` = $2^4$ = 16)

:::

### Loading a package {#loading-a-package}

First, we need to load a [package](https://www.datacamp.com/community/tutorials/r-packages-guide)
called `tidyverse`. A package is an extension to R that adds new commands. Nearly everything we'll
do in this course uses the tidyverse package, so pretty much every project starts with this
instruction.

**Type (or copy and paste) the command in the grey box into line 1 of the _Script_ window of
RStudio**. Now, with your cursor still on line 1, press CTRL+ENTER (i.e. press the key marked 'Ctrl'
and the RETURN or ENTER key together).


```r
library(tidyverse)
```

When you do this, line 1 is automatically copied to your _Console_ window and run. Then, RStudio
will print some text to the Console (shown in the white box, above). This text tells you that the
_tidyverse_ package has loaded ("attached") some other pacakges (e.g. _dplyr_). It also tells you
that the _dplyr_ package changes the way some commands in R work ("conflicts"). That's OK.

If you get an output that includes the word 'error', please see the
[common problems](#common-problems) section.

### Saving your script {#saving-your-script}

You should notice that the name `Untitled1` on the _Script_ window has now gone red. This is to
remind you that your script has changed since the last time you saved it. So, click on the "Save"
icon (the little floppy disk) and save your R script with some kind of meaningful name, for example
`briefguide.R`.

The `.R` indicates that it is an R script.

Re-save your script each time you change something in it; that way, you won't lose any of your work.

### Loading data {#loading-data}

Now, we're going to load some data on the income of 10,000 people in the United States of America.
I've made up this dataset for teaching purposes, but it's somewhat similar to large open data sets
available on the web, such as
[US Current Population Survey](https://thedataweb.rm.census.gov/ftp/cps_ftp.html). Here's how you
get a copy of this data into RStudio so you can start looking at it.

This video runs through the steps described below:

<iframe src="https://player.vimeo.com/video/361993933" width="640" height="500" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

1. Download a copy of the data, by clicking [here](http://www.willslab.org.uk/cps2.csv) and saving
   it to the Downloads folder of your computer.

2. Go to RStudio in your web browser.

3. Click on the 'Files' tab in RStudio (bottom right rectangle)

4. Click the 'Upload' button.

5. Click 'Browse...'

6. Go to your Downloads folder, and select the file you just saved there.

7. Click "OK".

8. Copy or type the following command into your RStudio script window, and run it (i.e. press
   CTRL+ENTER while your cursor is on that line)


```r
cpsdata <- read_csv("cps2.csv")
```

#### Explanation of the command

There are three parts to the command `cpsdata <- read_csv("cps2.csv")`:

1. The first part of the command is `cpsdata`. This gives a name to the data we are going to load.
   We'll use this name to refer to it later, so it's worth using a name that is both short and
   meaningful. I've called it `cpsdata` because it's somewhat similar to data from the US Current
   Population Survey, but you can give data pretty much any name you choose (e.g. _fart_).

2. The bit in the middle, `<-`, is an arrow and is typed by pressing `<` and then `-`, without a
   space. This arrow means "put the thing on the right of the arrow into the thing on the left of
   the arrow". In Rstudio

3. The last part of the command is `read_csv("cps2.csv")`. It loads the data file into `cpsdata`.
   The part inside the speech marks, `cps2.csv`, is the name of the file you just uploaded to your
   RStudio project. This command can also download data directly from the web, for example
   `read_csv("http://www.willslab.org.uk/cps2.csv")`. This would have been a quicker way to do it in
   this case, but of course not all data is on a web page.

#### Explanation of the output

R likes to print things in red sometimes -- this does not mean there's a problem. If there's a
problem, it will actually say 'error'. The output here tells us that R has loaded the data, which
has eight parts (columns, or `cols`). It gives us the name of the columns (`ID, sex, ...`) and tells
us what sort of data each column contains: `character` means the data is words (e.g. 'female'),
`double` means the data is a number (e.g. '42.78')
([more about the different types of variables](#more-on-tibbles)).

If you get an error here, please see [common errors](#common-problems).

## Inspecting data {#inspecting-data}

:::{.exercise}

Make sure you have just completed the [loading data](#loading-data) worksheet and have the `cps2`
dataset loaded.

:::

Next, we'll take a peek at these data. You can do this by clicking on the data in the _Environment_
tab of RStudio, see [here](#rstudio-environment-pane).

We can now see the data set (also known as a _data frame_). We can see that this data frame has 8
columns and 10000 rows. Each row is one person, and each column provides some information about
them. Below is a description of each of the columns. Where you see `NA` this means this piece of
data is missing for this person -- quite common in some real datasets.

Here's what each of the columns in the data set contains:

| Column    | Description                         | Values                                              |
| --------- | ----------------------------------- | --------------------------------------------------- |
| ID        | Unique anonymous participant number | 1-10,000                                            |
| sex       | Biological sex of participant       | male, female                                        |
| native    | Participant born in the US?         | foreign, native                                     |
| blind     | Participant blind?                  | yes, no                                             |
| hours     | Number of hours worked per week     | a number                                            |
| job       | Type of job held by participant:    | charity, nopay, private, public                     |
| income    | Annual income in dollars            | a number                                            |
| education | Highest qualification obtained      | grade-school, high-school, bachelor, master, doctor |

### Calculating a mean {#calculating-a-mean}

One question we can ask of these data is "what is the average income of people in the U.S.?" (or, at
least, in this sample).

In this first example, we're going to calculate the _mean_ income.

As you know, you calculate a mean by adding up all the incomes and dividing by the number of
incomes. Our sample has 10,000 participants, so this would be a long and tedious calculation -- and
we'd probably make an error.

It would also be a little bit tedious and error prone in a spreadsheet application (e.g. Excel,
Libreoffice Calc). There are some very famous cases of these kinds of "Excel errors" in research,
e.g. [genetics](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-1044-7),
[economics](https://arstechnica.com/tech-policy/2013/04/microsoft-excel-the-ruiner-of-global-economies/).

In R, we can calculate the mean instantly, and it's harder to make the
[sorts of errors](https://www.economist.com/graphic-detail/2016/09/07/excel-errors-and-science-papers)
that are common in Excel-based analysis.

To calculate mean income in R, we add the following command to our script and press CTRL+ENTER:


```r
cpsdata %>%
   summarise(mean(income))
> # A tibble: 1 x 1
>   `mean(income)`
>            <dbl>
> 1         87293.
```

Your output will tell you the mean income in this sample -- it's the last number on the bottom
right, and it's approximately \$87,000.

If you're happy with the output you've got, move on to the next section. If you would like a more
detailed explanation of this output, see [more on tibbles](more-on-tibbles.html). We'll cover this
later anyway.

If you get an error here, please see [common errors](#common-problems).

#### Explanation of the command

This command has three components:

1. The bit on the left, `cpsdata`, is our data frame, which we loaded and named earlier.

2. The bit in the middle, `%>%`, is called a _pipe_. Its job is to send data from one part of your
   command to another. It is typed by pressing `%` then `>` then `%`, without spaces. So
   `cpsdata %>%` sends our data frame to the next part of our command. See how to
   [type this quickly](#keyboard-shortcuts)

3. The bit on the right, `summarise(mean(income))` is itself made up of parts. The command
   `summarise` does as the name might suggest: it summarises a set of data (`cpsdata` in this case)
   into a single number, e.g. a mean. The `mean` command indicates that the type of summary we want
   is a mean (there are other summaries, as we will cover later). Finally, `income` is the name of
   the column of `cpsdata` we want to take the mean of -- in this case, the income of each
   individual.

:::{.exercise}

Make sure you are 100% clear about the difference between `<-` and `%>%`. If you're not, ask for an
explanation in class now.

The main clue is to look at the direction of the arrows:

`%>%` sends data from left to right. We call this **_'piping'_**.

`<-` sends results from the right hand side, to a variable named on the left. This is called
**_assignment_**.

---

Watch out that `->` is not the same as `%>%`. The thin arrow is always for assignment. You won't see
if often, because it's normally considered bad manners to use thin right arrows like this (they get
confusing).

---

**It really is worth learning the [keyboard shortcuts for `<-` and `%>%`](#keyboard-shortcuts) ---
you will be typing them a lot during the course.**

:::

## Missing data {#missing-data}

:::{.exercise}

Make sure you have recently completed the [loading data](#loading-data) worksheet and have the
`cps2` dataset is loaded.

:::

To calculate the mean number of hours worked per week, we have to deal with the fact that there is
some missing data - we don't know for all 10,000 people how many hours they work in a week, because
they didn't all tell us.

To get a mean of those who did tell us, we tell R to ignore the missing data, like this:


```r
cpsdata %>% summarise(mean(hours, na.rm = TRUE))
> # A tibble: 1 x 1
>   `mean(hours, na.rm = TRUE)`
>                         <dbl>
> 1                        38.9
```

#### Explanation of the command

`rm` is short for 'remove', but 'ignore' would be a more accurate description, as this command
doesn't delete the `NA` entries in `cpsdata`, it just ignores them. So `na.rm = TRUE` means "ignore
the missing data".

If you get an error here, please see [common errors](#common-problems).

### Patterns in missing data {#missing-data-patterns}

Sometime we won't only want to ignore missing data. We might also want to **count** how how many
variables are missing. The `mice` package has a useful command for doing this.

First, we need to load `mice` like the did `tidyverse` above. Type (or copy and paste) the command
below into your R script and run it:


```r
library(mice)
```

Then we can use the `md.pattern()` function to describe the patterns of missing data:


```r
cpsdata %>% mice::md.pattern()
```

<img src="01-beginning_files/figure-html/unnamed-chunk-5-1.png" width="672" />

```
>      ID sex native income education blind  job hours      
> 4483  1   1      1      1         1     1    1     1     0
> 515   1   1      1      1         1     1    1     0     1
> 3102  1   1      1      1         1     1    0     0     2
> 1900  1   1      1      1         1     0    0     0     3
>       0   0      0      0         0  1900 5002  5517 12419
```

#### Explanation of the output

`md.pattern()` produces two outputs: a plot, and a table.

In the plot we see

-   The variables in the dataset listed along the top
-   Squares indicating whether a variable is recorded (blue) or missing (purple/red)

Each row in the plot is a missing data **_pattern_**. So:

-   In the first row, the pattern is that all variables are recorded
-   The pattern in the second row is that all variables bar `hours` were recorded
-   The third pattern is that `job` and `hours` were missing, and so on.

The numbers on the left of the plot indicate **_how many people fit the pattern_**. So:

-   4483 people had complete data (pattern 1)
-   515 people had complete data except for the `hours` variable (pattern 2)
-   3102 people were missing `hours` and `job` (pattern 3, and so on

This can be really helpful when checking whether data has been imported properly, or properly
reporting missing data from our experiments [see @macpherson2010revised for current guidelines for
clinical trials, which would also be good practice for experimental research].

The numbers along the bottom of the plot show **_how many missing observations there were for the
variable marked at the top_**. So:

-   There were 5517 missing observations for `hours`, across all participants
-   5002 for `job`, and so on.

The table provides the same information as the plot, but is perhaps harder to read.

### Task: Try this on another dataset {.exercise}

The `mice` package includes example datasets with missing data. We can look at one of these like so:


```r
mice::boys %>% glimpse
> Observations: 748
> Variables: 9
> $ age <dbl> 0.035, 0.038, 0.057, 0.060, 0.062, 0.068, 0.068, 0.071, 0.071, 0.…
> $ hgt <dbl> 50.1, 53.5, 50.0, 54.5, 57.5, 55.5, 52.5, 53.0, 55.1, 54.5, 58.5,…
> $ wgt <dbl> 3.650, 3.370, 3.140, 4.270, 5.030, 4.655, 3.810, 3.890, 3.880, 4.…
> $ bmi <dbl> 14.54, 11.77, 12.56, 14.37, 15.21, 15.11, 13.82, 13.84, 12.77, 14…
> $ hc  <dbl> 33.7, 35.0, 35.2, 36.7, 37.3, 37.0, 34.9, 35.8, 36.8, 38.0, 40.5,…
> $ gen <ord> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
> $ phb <ord> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
> $ tv  <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
> $ reg <fct> south, south, south, south, south, south, south, west, west, east…
```

Identify the patterns of missing dataset in the `mice::boys` dataset.

1. How many participants provided complete data?

<!-- mice::boys %>% mice::md.pattern()









-->

## Group differences (briefly) {#group-differences-briefly}

### Before you start...

Before starting this worksheet, you should have had a brief introduction to using RStudio --
[Using RStudio](#getting-started-rstudio). You should also have also completed the worksheet
[Exploring Data](#exploring-data). If not, take a look these earlier worksheets before continuing.

If you have completed those worksheets, then you'll have set up an R project, and you'll have a
script in it that looks something like this:


```r
library(tidyverse)
library(mice)
cpsdata <- read_csv("cps2.csv")
cpsdata %>% summarise(mean(income))
cpsdata %>% summarise(mean(hours, na.rm = TRUE))
```

In this worksheet, we'll add some more commands to this script.

#### Contents

-   [Grouping data](#grouping-data)
-   [Drawing a density plot](#group-density)
-   [Filtering data](#filtering-data)
-   [Exercise](#grouping-data-exercise-1)

### Grouping data {#grouping-data}

One of the most widely discussed issues concerning income is the difference between what men and
women, on average, get paid. Let's have a look at that difference in our teaching sample of 10,000
US participants.

In order to do this, we need to split our data into two groups -- males and females. In R, the
command `group_by` allows us to do this. In this case, we want to group the data by biological sex,
so the command is `group_by(sex)`. We _pipe_ (`%>%`) the data in `cpsdata` to the `group_by` command
in order to group it, and then we _pipe_ (`%>%`) it to `summarise` to get a summary for each group
(a mean, in this case). So, the full command is:


```r
cpsdata %>% group_by(sex) %>% summarise(mean(income))
> # A tibble: 2 x 2
>   sex    `mean(income)`
>   <chr>           <dbl>
> 1 female         82677.
> 2 male           92137.
```

Copy it into your script and run it (CTRL+ENTER). Women in our made-up sample get paid, on average,
around 9,000 (9k) less than men. Of course, not every male gets 92k a year in the US, and not every
female gets 83k. It seems very likely that the range of incomes earned by men and women overlap --
meaning that if you picked one man and one woman at random, there's a reasonable chance that the
woman earns more than the man. We can look at this _variation_ in pay using a graph.

### Looking at variation using a density plot {#group-density}

The graph we're going to draw is a density plot. If you recall histograms from school, it's a lot
like that. If not, don't worry. A density plot is a curve that shows how likely a range of incomes
are. So, the higher the curve is at a particular income, the more people who have that income.

We're going to produce what's called a _scaled_ density plot. The highest point on a scaled density
plot is always one. This can make it easier to compare two groups, particularly if one group has
fewer people in it than the other.

So here's the command to do a scaled density plot for incomes, plotting men and women separately.
Copy it into your script and run it (CTRL+ENTER).


```r
cpsdata %>%
   ggplot(aes(income, colour=sex)) +
   geom_density(aes(y=..scaled..))
```

<img src="01-beginning_files/figure-html/group-density-1.png" width="672" />

#### Explanation of command

Here's what each part of this command means:

-   `cpsdata` - The data frame containing the data. You created this in the last worksheet.

-   `%>%` - A pipe. As in the last worksheet, this pipe carries the data in `cpsdata` to the next
    part of the command, which does something with it.

-   `ggplot()` - This means 'draw me a graph'. All graphs we use in these worksheets use the
    _Grammar for Graphics_ (gg) plotting commands, so they'll all include the command `ggplot`.

-   `aes()` - Short for _aesthetics_ (what things look like). It means 'This is the sort of graph I
    want'.

-   `income` - I want a graph of the data in the `income` column of `cpsdata`

-   `color=sex` - I want you to give me two graphs on top of each other, in different colours. One
    colour for men, a different color for women. Use the `sex` column of `cpsdata` to work out who
    is male and who is female.

-   `geom_density()` - I want this graph to be a _density_ plot.

-   `aes(y=..scaled..)` - I want this density plot to be _scaled_ (see above).

#### Discussion of output

Your graph will appear in the bottom-right window, and should look like the one above. You'll notice
that the two lines seem basically on top of each other ... but they can't be because we know the two
groups differ in mean income by over nine thousand dollars! We have a problem to solve...

### Dealing with extreme data points {#extreme-data}

The problem is one of scale -- there are a small number of people who earn very high salaries. In
fact, both the highest-paid man, and the highest-paid woman in our sample earn considerably more
than one million dollars a year.

#### Filtering data {#filtering-data}

Somehow, we need to deal with the fact that a few people in our sample are very well paid, which
makes the difference between men and women hard to see on our graph, despite the difference being
over nine thousand dollars a year.

One of the easiest ways around this is to exclude these very high salaries from our graph.

The vast majority of people are paid less than 150k a year. So, let's restrict our plotting to just
those people. We do this using the `filter` command. It's called _filter_ because it works a bit
like the filter paper in a chemistry lab (or in your coffee machine) -- stopping some things, while
letting other things pass through. We can filter our data by telling R _what data we want to keep_.
Here, we want to keep all people who earn less than £150k, and filter out the rest. So the filter we
need is `filter(income < 150000)`, where `<` means "less than".

We'll be using this dataset of people with <\$150k incomes a few times, so we're going to give it a
new name, `cpslow` (or any other name you want, e.g. _angelface_ )

So, what we need to do is _pipe_ (`%>%`) our `cpsdata` data to our `filter(income < 150000)`, and
use an arrow, `<-`, to send this data to our new _data frame_, `cpslow`. Recall that `<-` sends the
thing on its right to the thing on its left, so the full command is:


```r
cpslow <- cpsdata %>% filter(income < 150000)
```

We can take a look at this new _data frame_ by clicking on it in RStudio's _Environment_ window (see
[video here](#rstudio-environment-pane) if you're not sure how). By looking at the ID numbers, you
can see that some people in our original sample have been taken out, because they earned at least
150k.

Now, we can plot these filtered data in the same way as before, by changing the name of the
dataframe from `cpsdata` to `cpslow`.

**So start with the command**
`cpsdata %>% ggplot(aes(income, colour=sex)) + geom_density(aes(y=..scaled..))`, copy it onto the
next line in your script, **make that change, and press CTRL+RETURN.**

If you've got it right, your graph will look like this:

<img src="01-beginning_files/figure-html/group-density-filtered-1.png" width="672" />

At first glance, the two distributions of incomes still look similar. For example, the
[_modal_](<https://en.wikipedia.org/wiki/Mode_(statistics)>) income is at quite a low income, and
that income is quite similar for both men and women. However, on closer inspection, you'll also see
that the red line (females) is above the blue line (men) until about 25-50k, and below the blue line
from then on. This means that more women than men earn less than 50k, and more men than women earn
more than 50k.

So, the gender pay gap is visible in this graph. The graph also illustrates that the difference in
this sample is small, relative to the range of incomes. This doesn't mean that the gender pay gap is
less (or more) important than income inequality. These kinds of questions of importance are moral,
philosophical, and political. Data cannot directly answer these kinds of questions, but they can
provide information to inform the debate.

As we'll see later, this type of graph is also crucial to inform our choice of statistical models
(like regression or Anova): Without a clear sense of what the data _look_ like we can make bad
decisions in our analyses.

### Exercise {#grouping-data-exercise-1 .exercise}

This exercise consolidates what you've learned so far.

**The task is to further examine the sub-sample of participants who are living in the US, and
earning less than \$150k (`cpslow`).**

Specifically, the question to answer is whether people born in the US earn more. In order to do
this, you should calculate the mean income for each group, and produce a density plot with one line
for each group. Below are the answers you are aiming for:


```
> # A tibble: 2 x 2
>   native  `mean(income)`
>   <chr>            <dbl>
> 1 foreign         78408.
> 2 native          88480.
```

<img src="01-beginning_files/figure-html/ex1-1.png" width="672" />



Previously, we calculated the mean salary of men and women.

1. Why might it be a better idea to calculate the median?


<div class='solution'><button class='solution-button'>Show answer</button>


Because the data are strongly skewed, the median may be a better summary of the central tendency
(the middle).


</div>


2. Adapt the commands above to calculate the median instead. What is the median salary for women:
   <span class='webex-fitb' id = 'Q605992' ><input class='solveme  nospaces' data-digits=4 size=5  style='width:5em;'  data-answer='["52558"]'/><span class='solvedme'></span></span>, and for men: <span class='webex-fitb' id = 'Q257938' ><input class='solveme  nospaces' data-digits=4 size=5  style='width:5em;'  data-answer='["61746"]'/><span class='solvedme'></span></span>.


<div class='solution'><button class='solution-button'>Show answers</button>



```r
cpsdata %>%
  group_by(sex) %>%
  summarise(med=median(income))
> # A tibble: 2 x 2
>   sex       med
>   <chr>   <dbl>
> 1 female 52558.
> 2 male   61746.
```


</div>


### Extension exercise {.exercise}

If you've some spare time and are looking for something a bit more challenging, try Exercise 2 on
this slightly
[more advanced worksheet](https://ajwills72.github.io/rminr/group-differences.html#ex2).

<!--





 -->

## Undergraduate stats in R

All of the statistics you will have learned at undergraduate level can be produced in R. Here we
cover simple examples of:

-   A t-test
-   A correlation

:::{.exercise}

If you have no memory of t-tests or correlations, you might want to take time to work through these
expanded guides from our undergraduate course at a later date:

-   [Tests of group differences](https://ajwills72.github.io/rminr/group-differences.html)
-   [Relationships](https://ajwills72.github.io/rminr/corr.html)

:::

We'll run these statistics on an example dataset which is built into R, called `mtcars`. We can look
at this data using the glimpse function (this is loaded with `tidyverse`, so if you get an error
make sure that is loaded too):


```r
mtcars %>% glimpse()
> Observations: 32
> Variables: 11
> $ mpg  <dbl> 21.0, 21.0, 22.8, 21.4, 18.7, 18.1, 14.3, 24.4, 22.8, 19.2, 17.8…
> $ cyl  <dbl> 6, 6, 4, 6, 8, 6, 8, 4, 4, 6, 6, 8, 8, 8, 8, 8, 8, 4, 4, 4, 4, 8…
> $ disp <dbl> 160.0, 160.0, 108.0, 258.0, 360.0, 225.0, 360.0, 146.7, 140.8, 1…
> $ hp   <dbl> 110, 110, 93, 110, 175, 105, 245, 62, 95, 123, 123, 180, 180, 18…
> $ drat <dbl> 3.90, 3.90, 3.85, 3.08, 3.15, 2.76, 3.21, 3.69, 3.92, 3.92, 3.92…
> $ wt   <dbl> 2.620, 2.875, 2.320, 3.215, 3.440, 3.460, 3.570, 3.190, 3.150, 3…
> $ qsec <dbl> 16.46, 17.02, 18.61, 19.44, 17.02, 20.22, 15.84, 20.00, 22.90, 1…
> $ vs   <dbl> 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0…
> $ am   <dbl> 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0…
> $ gear <dbl> 4, 4, 4, 3, 3, 3, 3, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 4, 4, 4, 3, 3…
> $ carb <dbl> 4, 4, 1, 1, 2, 1, 4, 2, 2, 4, 4, 3, 3, 3, 4, 4, 4, 1, 2, 1, 1, 2…
```

#### Explanation of the `glimpse` output

`glimpse` produces a list of all variables in the dataset, tells us what type they are, and lists
however many obserervations from the dataset that will fit on a single line.

The type of all variables in `mtcars` is `dbl`. This is short for 'double-precision number'; for
now, just know that `dbl` means a _number_.

Other types include :

-   `int` --- short for 'integer' variable, so only contains whole numbers (e.g. a participant id
    number)
-   `chr` --- short for 'character variable', which will contain text (e.g. an email address)
-   `fct` --- short for 'factor'. i.e. a categorical variable (e.g. MCQ responses)
-   `ord` --- short for 'ordered'. This is variant of categorical variable where the categories have
    a particular order (responses like "Wost" < "Better" < "Best" could be stored as an `ord`)

### Two sample t-test

`mtcars` contains a variable called `mpg`, which is the miles per gallon each car will do, and
another called `am` which is encodes whether it was a manual or automatic transmission (0=automatic,
1=manual).

We can test if `mpg` differs between auto and manual cars with `t.test`:


```r
t.test(mpg ~ am, data=mtcars)
> 
> 	Welch Two Sample t-test
> 
> data:  mpg by am
> t = -3.7671, df = 18.332, p-value = 0.001374
> alternative hypothesis: true difference in means is not equal to 0
> 95 percent confidence interval:
>  -11.280194  -3.209684
> sample estimates:
> mean in group 0 mean in group 1 
>        17.14737        24.39231
```

### Explanation

The command contains three parts:

-   `t.test`: Says what we want to do
-   `mpg ~ am`: This is a 'formula', which tells `t.test` which variables to analyse.
-   `data=mtcars`: Which dataset we want to use for the analysis

The formula is split into two parts by the [`~` symbol](#tilde). On the left is our outcome. On the
right is the grouping variable, which we hope **predicts** the outcome.

In the output you can see the test statistic, degrees of freedom and _p_ value.

:::{#tilde .sidenote}

The tilde symbol. Pronounced "tilder".

In R, `~` almost always means **_"is predicted by"_**.

:::

### Correlations

The `mtcars` data also contains variables for weight (`wt`) and power (`hp`, short for horsepower).

We can select just these columns and save them to a smaller dataframe like this:


```r
carperformance <- mtcars %>% select(mpg, wt, hp)
```

#### Explanation of the commands

On the far left we have the name of the new variable which we will create: `carperformance`.

We can tell this will be a new variable because the `<-` symbol is just to the right, pointing at
it.

To work out what `carperformance` will contain, we look to the right of the `<-` There are two parts
here, linked with the pipe symbol (`%>%`) which passes data from one command to the next, from left
to right.

First we see the `mtcars` data. Using a pipe we pass this to the `select` command, which selects the
`mpg,`wt`, and`hp` columns.

#### Explanation of the result

When running the command you won't see any output --- but something **has** happened behind the
scenes: A new object was created called `carperformance` which contained copies of the columns from
`mtcars` we selected.

We can see the first few rows of our new smaller dataframe like this:


```r
carperformance %>% head()
>                    mpg    wt  hp
> Mazda RX4         21.0 2.620 110
> Mazda RX4 Wag     21.0 2.875 110
> Datsun 710        22.8 2.320  93
> Hornet 4 Drive    21.4 3.215 110
> Hornet Sportabout 18.7 3.440 175
> Valiant           18.1 3.460 105
```

---

To correlate the three columns in this dataset, we can use the `cor` function and round all the
results to 2 decimal places:


```r
carperformance %>% cor() %>% round(2)
>       mpg    wt    hp
> mpg  1.00 -0.87 -0.78
> wt  -0.87  1.00  0.66
> hp  -0.78  0.66  1.00
```

<div class='solution'>
<button class='solution-button'>Explain those commands...</button>

On the left we have the `carperformance` data.

We pipe this to the `cor` function which calculates the correlation between each pair of columns and returns a special kind of table, called a matrix.

To make the output simpler, we then pass the results to the `round` function, which rounds all the results to 2 decimal places.




</div>

The `cor` function is pretty bare-bones, and doesn't produce output we could easily use in a report
or article. The `apaTables` package helps us with this:


```r
apaTables::apa.cor.table(carperformance, filename = "correlations.doc")
> 
> 
> Means, standard deviations, and correlations with confidence intervals
>  
> 
>   Variable M      SD    1            2         
>   1. mpg   20.09  6.03                         
>                                                
>   2. wt    3.22   0.98  -.87**                 
>                         [-.93, -.74]           
>                                                
>   3. hp    146.69 68.56 -.78**       .66**     
>                         [-.89, -.59] [.40, .82]
>                                                
> 
> Note. M and SD are used to represent mean and standard deviation, respectively.
> Values in square brackets indicate the 95% confidence interval.
> The confidence interval is a plausible range of population correlations 
> that could have caused the sample correlation (Cumming, 2014).
> * indicates p < .05. ** indicates p < .01.
> 
```

<div class='solution'>
<button class='solution-button'>Explain the double colons (`::`) in the code above</button>

Sometimes we load a whole package, as we did when we wrote `library(tidyverse)` above. This is a good idea when we want to use lots of functions from that package.

When we only want to use one function from a package we can type `nameofpackage::nameoffunction` and this lets us use the function without loading the package.

This can be a good idea if the package or function is less well known, and you want to be explicit about which package it comes from---it helps 'future-you' work out what your code is doing.




</div>

#### Explanation of the result

We used the `apa.cor.table` function within the `apaTables` package to create a nicely-formatted
correlation table, in APA format.

We also specified a `filename`, and `apa.cor.table` created a
[Word document with this name containing the formatted table (click to see the result)](correlations.doc).

:::{.exercise}



- Use one of the other [built-in](#builtin) datasets in R to run a correlation between 2 variables.

- Use the built-in `sleep` data.  Compute a t-test comparing the `extra` variable between groups. Describe the results of the [t-test in APA format](https://www.youtube.com/watch?v=fQI3Xr9xMBI).

:::


#### Built in datasets {#builtin}

Some examples of built-in data are:

- `sleep`
- `iris`
- `airquality`
- `ChickWeight`
- `diamonds`

If you have loaded tidyverse you can access these by name, just like the `mtcars` data. For example::


```r
diamonds %>% glimpse()
> Observations: 53,940
> Variables: 10
> $ carat   <dbl> 0.23, 0.21, 0.23, 0.29, 0.31, 0.24, 0.24, 0.26, 0.22, 0.23, 0…
> $ cut     <ord> Ideal, Premium, Good, Premium, Good, Very Good, Very Good, Ve…
> $ color   <ord> E, E, E, I, J, J, I, H, E, H, J, J, F, J, E, E, I, J, J, J, I…
> $ clarity <ord> SI2, SI1, VS1, VS2, SI2, VVS2, VVS1, SI1, VS2, VS1, SI1, VS1,…
> $ depth   <dbl> 61.5, 59.8, 56.9, 62.4, 63.3, 62.8, 62.3, 61.9, 65.1, 59.4, 6…
> $ table   <dbl> 55, 61, 65, 58, 58, 57, 57, 55, 61, 61, 55, 56, 61, 54, 62, 5…
> $ price   <int> 326, 326, 327, 334, 335, 336, 336, 337, 337, 338, 339, 340, 3…
> $ x       <dbl> 3.95, 3.89, 4.05, 4.20, 4.34, 3.94, 3.95, 4.07, 3.87, 4.00, 4…
> $ y       <dbl> 3.98, 3.84, 4.07, 4.23, 4.35, 3.96, 3.98, 4.11, 3.78, 4.05, 4…
> $ z       <dbl> 2.43, 2.31, 2.31, 2.63, 2.75, 2.48, 2.47, 2.53, 2.49, 2.39, 2…
```

You can find out more about each of them by typing:


```r
help(iris)
```


## Sequences and designs

One trick you will need later in the course is making **sequences** of numbers.

There are a few ways to do this, but the simplest is to write: `1:10`. That is, the number to start
from (`1`), a colon (`:`), and then the number to end with (`10`).

Copy and paste these examples to see the output:


```r
1:10
>  [1]  1  2  3  4  5  6  7  8  9 10
20:30
>  [1] 20 21 22 23 24 25 26 27 28 29 30
```

**Explanation**: The output shows that R has created a sequence of whole numbers between the start
and finish number.

To get a sequence with only even numbers, we can use the `seq` function, and set the `by` argument
to 2:


```r
seq(from=2, to=10, by=2)
> [1]  2  4  6  8 10
```

You can set `by` to any number, including a decimal:


```r
seq(0, 27, by=3)
>  [1]  0  3  6  9 12 15 18 21 24 27
seq(0, 1, by=0.2)
> [1] 0.0 0.2 0.4 0.6 0.8 1.0
```

If your sequence doesn't have a simple pattern, you can also write out the numbers by hand using the
`c(..)` command:


```r
c(1,40,92,188)
> [1]   1  40  92 188
```

**Explanation**: `c(...)` is short for `combine`, so this command combines the numbers 1, 40, 92,
188 into a new sequence. This is sometimes called a **vector** in R-speak.

:::{.exercise}

Make some sequences which include:

-   Even numbers from 10 to 20
-   Numbers in the 8 times table less than 200
-   20 evenly spaced numbers between zero and 1 (including zero and 1)
-   The words "Wibble", "Wobble" and "Bobble"


<div class='solution'><button class='solution-button'>Show answers</button>


We can use `seq` for numbers:


```r
seq(10,20,by=2)
> [1] 10 12 14 16 18 20
seq(0,200, 8)
>  [1]   0   8  16  24  32  40  48  56  64  72  80  88  96 104 112 120 128 136 144
> [20] 152 160 168 176 184 192 200
seq(0,1, by=1/19)
>  [1] 0.00000000 0.05263158 0.10526316 0.15789474 0.21052632 0.26315789
>  [7] 0.31578947 0.36842105 0.42105263 0.47368421 0.52631579 0.57894737
> [13] 0.63157895 0.68421053 0.73684211 0.78947368 0.84210526 0.89473684
> [19] 0.94736842 1.00000000
```

But we need to use c() for lists of words:


```r
c("Wibble", "Wobble", "Bobble")
> [1] "Wibble" "Wobble" "Bobble"
```


</div>


:::

### Combinations of sequences {#expand-grid}

In designing experiments we often want to create combinations of different categories which
represent conditions or stimuli.

Imagine a hypothetical study with a test phase where participants are presented with multiple words,
in either red or green text, and shown at either the bottom or top of the computer screen.

The combinations look something like this:


----------------------------------------
 condition   colour   position    word  
----------- -------- ---------- --------
     1        Red       Top      Nobble 

     2       Green      Top      Nobble 

     3        Red      Bottom    Nobble 

     4       Green     Bottom    Nobble 

     5        Red       Top      Wobble 

     6       Green      Top      Wobble 

     7        Red      Bottom    Wobble 

     8       Green     Bottom    Wobble 

     9        Red       Top      Hobble 

    10       Green      Top      Hobble 

    11        Red      Bottom    Hobble 

    12       Green     Bottom    Hobble 
----------------------------------------

R provides quick ways of creating combinations of variables, using a command called `expand.grid`.

First, we need to create a sequence of each of the possible values for our categories:


```r
colours = c("Red", "Green")
positions = c("Top", "Bottom")
words = c("Nobble", "Wobble", "Hobble")
```

Then we can use `expand.grid` to give us all the possible combinations of these:


```r
expand.grid(colour=colours, position=positions, words = words)
>    colour position  words
> 1     Red      Top Nobble
> 2   Green      Top Nobble
> 3     Red   Bottom Nobble
> 4   Green   Bottom Nobble
> 5     Red      Top Wobble
> 6   Green      Top Wobble
> 7     Red   Bottom Wobble
> 8   Green   Bottom Wobble
> 9     Red      Top Hobble
> 10  Green      Top Hobble
> 11    Red   Bottom Hobble
> 12  Green   Bottom Hobble
```

**Explanation**: The `expand.grid` function has taken the items in the three input sequences
(colours, positions and words) and created a dataframe which contains all the possible combinations. We could save these to a file if we wanted to use them as part of our experiment.

#### Task: create some experimental designs of your own {.exercise}

1. Reproduce the experiment design above by copying and pasting

2. Adapt the commands to allow for an experiment where the word position could be either top,
   bottom, left or right. How many different conditions would there be in this case?

As an optional stretch task:

1. How would you create a design where the order of presentation of each word is also balanced? That
   is, where it's equally likely to see Nobble, Wobble or Bobble in the first, second or third
   trial?

### Random samples

In our example, each of the experimental conditions is allocated between-participants, which (as
you'll learn elsewhere in the programme) means we need recruit quite a large number of participants.
In this case we can imagine we might need at least 250 participants.

Allocating participants to condition is another boring task R can help with. The trick is to combine
sequences with randomness and random sampling.

For example, we might create a sequence of the numbers from 1:10:


```r
1:10
>  [1]  1  2  3  4  5  6  7  8  9 10
```

The `sample` function lets us take a random sample from this sequence:


```r
sample(1:10)
>  [1]  5  7  8  2  6 10  3  1  4  9
```

**Explanation** `sample` has shuffled the input sequence and gives us the original numbers (1...12)
in a random order.

---

If we want to take a larger sample, longer than the input sequence, we have to add the text
`replace=TRUE`:


```r
sample(1:10, size = 20, replace=TRUE)
>  [1]  7  8  3  4  6  9  9  9 10  4  7  3  6  3 10  6  1  7 10  3
```

**Explanation**: Using `replace=TRUE` is like picking a number from a hat, but then putting the
chosen number back into the hat so it can be picked again. This allows us to make longer random
sequences where numbers in the initial sequence are repeated.

### In-use: Randomising participants to conditions/groups

If we combine our experimental design from above with this idea of randomness we can randomise
participants to conditions in our experiment.

If we look again at our design we can see there are 12 possible combinations:


```r
expand.grid(colour=colours, position=positions, words = words)
>    colour position  words
> 1     Red      Top Nobble
> 2   Green      Top Nobble
> 3     Red   Bottom Nobble
> 4   Green   Bottom Nobble
> 5     Red      Top Wobble
> 6   Green      Top Wobble
> 7     Red   Bottom Wobble
> 8   Green   Bottom Wobble
> 9     Red      Top Hobble
> 10  Green      Top Hobble
> 11    Red   Bottom Hobble
> 12  Green   Bottom Hobble
```

We can use `sample` to make sure we allocate participants randomly to conditions, as they are
recruited:


```r
sample(1:12, size=250, replace=TRUE)
>   [1]  1  4  3  6  3  5  4  4  2  3  6  1 12 11 11  1 12  3  8  2 10 11  2  2 12
>  [26]  7  3  8  4 12  9 12 10  6 11  1  2  2  7  8 11  2 10 11  6  7  3  3  5 11
>  [51]  5  2  1  2  4  9 10  8  3 12  8  7 11  2 12  3 10  9  4  9  7 11  9  3 11
>  [76] 10  5  2 10 12  3  6  2  4 10  4  3  2 10 10  4  5 10  9 12 11 11  8  9  3
> [101]  3  7  6  4  5 12  3 11 11 12  2  3  9 11 11 11  7  1  3 10  7 12  3  6  9
> [126]  4  7  6  4  2  2  4  5  3  4  4  9 11  5  6  1  2  4  8  3 11  2  9  2  2
> [151] 10 12  1 12 11  5  9 12  7  3  6 12  7  2  9 10 12  8  1  5  2 12  4  1 12
> [176]  1  5  8  4  1  1  7  2  4 11 12  3  4  5  4  5  6  6  8 10  5  3  3  2  3
> [201]  5  4  4  4  3  7  1  1 10 12 12  7 12  2 10 12  6 10  5  3 11  8  7  7 12
> [226]  8  7  8  9  5  1  1 11  5  5 10 12  5  8  9  4  6  8  6  9  9  9  7  2 12
```

So, we would allocate participants to their condition in this order as they are recruited.

Alternatively, we could simply run this every time a new participant showed up:


```r
(new_allocation <- sample(1:12, size=1))
> [1] 8
```

#### Task: Randomise your own participants {.exercise}

1. Re-use the design you created above, and randomise 5 participants to conditions within it.

2. Try and create a design which might work for your own study (either this year, based on your UG
   project, or on any other study you might like to run).

As an optional stretch task:

1. [Read this extension, which shows how to sample from datasets as well as sequences](#sample_n)

## Reading data {#more-reading-data}

So far, we have read data from [CSV]() files. In this section we show how to import some other
common types.

### Reading CSV data directly from a URL (place on the web) {#read-data-from-url}

When you find data on the web it can save time to read it straight into R, without worrying about
downloading and uploading the files. If we do this, it's good to save a copy of the data in case the
website disappears or the file is taken down.

For example, [we previously](#loading-data) downloaded data from
<http://www.willslab.org.uk/cps2.csv> and then used `read_csv()` on this downloaded copy. We can
skip a few steps by loading it directly by writing:


```r
datafromtheweb <- read_csv('http://www.willslab.org.uk/cps2.csv')
```

**Explanation**: By providing `read_csv()` with a URL (a web address) R has automatically imported
the data from <http://www.willslab.org.uk/cps2.csv>, and saved it to a new variable called
`datafromtheweb`.

---

We might also want to save a copy of the data, in case the website disappears in future. In my code,
I would typically write:


```r
# datafromtheweb <- read_csv('http://www.willslab.org.uk/cps2.csv')
# write_csv(datafromtheweb, 'cps2.csv')
datafromtheweb <- read_csv('cps2.csv')
```

##### Explanation of the code

There are three lines in the code block above:

-   The first two lines start with a `#` (pronounced hash). This means R **won't** run the line of
    code. It is included only as a comment - for your reference in future.
-   However, if we did run these lines manually (by copying the code to the console without the
    `#`), this would download the data from the URL, and then save your own copy in a file in your
    RStudio project directory.
-   The third line reads data from `cps2.csv` to a variable called `datafromtheweb`.

:::{.tip}

In practice, if I was working on data available online, I would run the first two lines on one
occasion (to save my own copy of the data). The third line is the only thing that is run when we
execute the R script, so provided we have saved the data the script will run even when I'm not
online.

:::

#### Task: Read data from the web {.exercise}

1. Load the CPS data from Andy Wills' website, and save it to a file in your Rstudio project
   directory.

Optional extension tasks:

1. Find another csv dataset on the web (hint: try searching for "Plosone .csv dataset") and read it
   into R.

1. Calculate the mean of a few of the variables in this file.

### Reading SPSS files

If you have old data stored in SPSS files, they are likely to have a `.sav` file extension. These
can be read with the `haven` package.

For example, this paper in PlosOne provides a number of SAV files for the experiments reported:
<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0209900#sec039>



To use these files you should:

-   Download the file you want
-   Save it with a `.sav` extension
-   Upload it to RStudio server (use Firefox --- not Edge or Explorer).

You can then load it like this:


```r
library(haven)

datafromspss <- read_spss('journal.pone.0209900.s001.sav')
datafromspss %>% glimpse
> Observations: 89
> Variables: 29
> $ Subject       <dbl> 49, 37, 1, 84, 4, 85, 16, 30, 55, 22, 65, 59, 40, 61, 3…
> $ `filter_$`    <dbl+lbl> 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
> $ Age           <dbl> 22, 22, 21, 20, 22, 20, 23, 22, 21, 21, 20, 19, 19, 17,…
> $ Sex           <dbl> 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 2, 1, 2, 1, 1…
> $ Education     <chr> "4", "2", "2", "2", "2", "2", "3", "2", "2", "2", "2", …
> $ ADMC1         <dbl> 6, 6, 2, 1, 6, 5, 6, 5, 2, 6, 6, 2, 5, 4, 6, 2, 6, 6, 5…
> $ ADMC1hap      <dbl> 1, 6, 6, 3, 2, 2, 1, 1, 1, 2, 2, 2, 1, 3, 4, 3, 1, 1, 2…
> $ ADMC2         <dbl> 1, 1, 6, 6, 2, 2, 6, 5, 3, 5, 1, 5, 2, 2, 2, 6, 2, 4, 2…
> $ ADMC2hap      <dbl> 1, 4, 3, 1, 2, 2, 3, 2, 2, 1, 2, 2, 1, 4, 2, 1, 1, 1, 2…
> $ ADMC3         <dbl> 5, 1, 6, 6, 6, 6, 6, 3, 1, 2, 4, 6, 5, 5, 5, 3, 1, 6, 2…
> $ ADMC3hap      <dbl> 2, 8, 8, 1, 1, 6, 3, 3, 1, 5, 1, 4, 3, 5, 3, 5, 7, 6, 3…
> $ ADMC4         <dbl> 2, 4, 6, 3, 1, 1, 3, 1, 6, 5, 2, 6, 4, 3, 2, 5, 2, 5, 1…
> $ ADMC4hap      <dbl> 3, 7, 9, 4, 2, 7, 5, 3, 7, 1, 5, 3, 1, 2, 5, 3, 4, 1, 8…
> $ ADMC5         <dbl> 2, 6, 6, 3, 5, 1, 2, 1, 2, 1, 6, 6, 5, 3, 2, 1, 6, 6, 2…
> $ ADMC5hap      <dbl> 1, 9, 8, 1, 3, 1, 2, 2, 2, 2, 7, 4, 3, 2, 3, 5, 1, 3, 2…
> $ ADMC6         <dbl> 5, 6, 6, 6, 5, 5, 6, 4, 5, 2, 6, 5, 6, 6, 4, 5, 5, 6, 4…
> $ ADMC6hap      <dbl> 2, 9, 9, 4, 5, 1, 5, 5, 5, 3, 6, 3, 6, 6, 4, 5, 8, 9, 7…
> $ ADMC7         <dbl> 5, 5, 6, 6, 5, 1, 6, 5, 4, 6, 5, 6, 4, 3, 4, 5, 6, 6, 5…
> $ ADMC7hap      <dbl> 4, 9, 9, 2, 4, 3, 5, 6, 7, 7, 3, 4, 6, 2, 3, 5, 8, 9, 8…
> $ ADMC8         <dbl> 3, 1, 6, 1, 2, 2, 3, 2, 5, 1, 6, 6, 3, 2, 2, 4, 2, 1, 2…
> $ ADMC8hap      <dbl> 3, 4, 9, 3, 3, 1, 3, 2, 3, 3, 3, 4, 2, 5, 2, 5, 2, 1, 2…
> $ ADMC9         <dbl> 3, 5, 5, 6, 1, 6, 1, 6, 3, 1, 4, 6, 5, 5, 2, 2, 5, 6, 5…
> $ ADMC9hap      <dbl> 1, 5, 4, 1, 4, 2, 3, 7, 1, 3, 2, 4, 6, 2, 4, 2, 1, 1, 2…
> $ ADMC10        <dbl> 5, 6, 1, 6, 4, 6, 5, 2, 3, 6, 6, 6, 6, 5, 5, 5, 5, 6, 5…
> $ ADMC10hap     <dbl> 1, 9, 7, 5, 2, 7, 3, 3, 5, 7, 3, 4, 6, 5, 7, 3, 4, 5, 2…
> $ ADMC_mea      <dbl> 3.7, 4.1, 5.0, 4.4, 3.7, 3.5, 4.4, 3.4, 3.4, 3.5, 4.6, …
> $ ZADMC_mea     <dbl> -0.69119217, -0.06507407, 1.34369165, 0.40451450, -0.69…
> $ MeaADMChappy  <dbl> 1.9, 7.0, 7.2, 2.5, 2.8, 3.2, 3.3, 3.4, 3.4, 3.4, 3.4, …
> $ ZMeaADMChappy <dbl> -2.7878439, 2.5067266, 2.7143568, -2.1649532, -1.853507…
```

:::{.tip}

If your SPSS datafile has labels or other special features enabled then you can
[check this guide for details of how to use them](https://cran.r-project.org/web/packages/haven/vignettes/semantics.html).
You probably won't need to though.

:::

#### Task: Reading SPSS data {.exercise}

1. Load one of the other datasets from this paper:
   https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0209900#sec039

Optional extension task:

1. Plot a density graph of one of the variables in one of the datasets. Try adding colour to
   distinguish another categorical variable (e.g. gender).

2. Add some other comments to your code (using `#`) to describe what the code does.

3. Read this forum discussion on how to add good comments to your code:
   <https://www.reddit.com/r/rstats/comments/86cmj1/any_tips_on_best_practices_for_commenting_your/>

### Reading from Excel

There are two types of Excel documents, `.xls` and the newer `.xlsx` formats. You can read both with
the `readxl` package.

One important thing to note about Excel spreadsheets is that **each file can contain multiple
'sheets'**. In R terms, each Excel file can contain multiple dataframes. So we need to specify which
sheet we want to import.

I've included an example of an Excel file here: [Excel example](simple-excel-example.xlsx)

To use the example:

-   Download the file to your computer (use Firefox, and definitely not Edge)
-   Upload to RStudio, make sure the file extension is `xslx` or `xls`

Then:


```r
library(readxl)

# make sure the filename here matches yours
xldata <- read_excel('simple-excel-example.xlsx')
xldata
> # A tibble: 12 x 3
>    Participant Trial    RT
>          <dbl> <dbl> <dbl>
>  1           1     1    44
>  2           1     2    45
>  3           1     3    33
>  4           2     1    22
>  5           2     2    22
>  6           2     3    23
>  7           3     1    55
>  8           3     2    56
>  9           3     3    57
> 10           4     1    99
> 11           4     2    96
> 12           4     3  2001
```

**Explanation**: `read_excel()` has read in the FIRST sheet (called 'Experiment 1') from the Excel
file. To check this, open the file in Excel and see that there are actually two experiments included
in the single file.

---

If we wanted to load both experiments, we would need to write:


```r
expt1 <- read_excel('simple-excel-example.xlsx', sheet="Experiment 1")
expt2 <- read_excel('simple-excel-example.xlsx', sheet="Experiment 2")
```

**Explanation**: On each line we use `read_excel()` to load one of the sheets from the original file. The names of each sheet are shown in the Excel interface like this:

![Sheet labels in Excel](media/xl-sheets.png)



:::{.tip}

The names of the sheets in the code which says `sheet="<SHEETNAME>"` need to match the names of the sheets in Excel exactly.

:::



We can check the second file like this:


```r
expt2  %>% glimpse
> Observations: 12
> Variables: 3
> $ Participant <dbl> 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4
> $ Trial       <dbl> 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3
> $ RT          <dbl> 22, 32, 55, 22, 21, 11, 101, 111, 122, 200, 4000, 4000
```

#### Task: Read Excel data {.exercise}

1. Read both experiment 1 and 2 from the file [simple-excel-example.xlsx](simple-excel-example.xlsx)
2. Use the [Environment pane](#rstudio-environment-pane) to check the data against the data in the
   Excel file.

Optional extension tasks:

1. Plot the density of the RT variable in experiment 1.
2. Describe the plot
3. What pre-processing step might we want to use, before plotting (hint: in these experiments, most
   responses should happen within a second).


<div class='solution'><button class='solution-button'>Show answer</button>


Depending on the paradigm being used, we might want to filter very long RTs (e.g. over 1000ms):


```r
expt2  %>%
  filter(RT < 1000)  %>%
  ggplot(aes(RT)) + geom_density()
```

<img src="01-beginning_files/figure-html/unnamed-chunk-42-1.png" width="672" />


</div>

