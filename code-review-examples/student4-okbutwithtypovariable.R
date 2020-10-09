library(tidyverse)
#Recreate the Rosling plot
gapminder::gapminder %>%
  filter(year==2002) %>%
  ggplot(aes(x=gdpPercap,
             y=lifeExp,
             size=pop,
             color=continent)) +
  geom_point()

#Using multiple layers
gapminder::gapminder %>%
  filter(continent=="Asia") %>%
  ggplot(aes(lifeExp, gdpPercap)) +
  geom_point() +
  geom_smooth() 

#Task 1
cpsdata <- read_csv("http://www.willslab.org.uk/cps2.csv")
cpsdata %>%
  ggplot(aes(x=income,
             y=education)) +
  geom_point()
#NTS:Plot looked weird, trying again
cpsdata %>%
  ggplot(aes(x=education,
             y=income)) +
  geom_point()
#task 1, step 3: add colour NTS:wasn't sure if it was the cps/gapminder graph. Did cps. 
cpsdata %>%
  ggplot(aes(x=education,
             y=income,
             color=sex)) +
  geom_point()

#Facets
gapminder::gapminder %>%
  ggplot(aes(year, lifeExp, group=country)) +
  geom_smooth(se=FALSE)
gapminder::gapminder %>%
  ggplot(aes(year, lifeExp, colour=continent, group=country)) +
  geom_smooth(se=FALSE)
gapminder::gapminder %>%
  ggplot(aes(year, lifeExp, group=country)) +
  geom_smooth(se=FALSE) +
  facet_wrap(contine)
gapminder::gapminder %>%
  ggplot(aes(year, lifeExp, group=country)) +
  geom_smooth(se=FALSE) +
  facet_wrap(~continent)

#Task:Use facetting
iris %>%
  ggplot(aes(Sepal.Length, Petal.Length, group=Species)) +
  geom_smooth(se=FALSE) +
  facet_wrap(~setosa, versicolor,virginica)
#NTS:FAILED this next graph will not be the right,it's a test
iris %>%
  ggplot(aes(Sepal.Length, Petal.Length)) +
  geom_smooth(se=FALSE) +
  facet_wrap(~Species)
#Attempt 3 - completed first step
iris %>%
  ggplot(aes(Sepal.Length, Petal.Length)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~Species)
#adding colour to distinguish species, removing facets
iris %>%
  ggplot(aes(Sepal.Length, Petal.Length, color=Species)) +
  geom_point() +
  geom_smooth()
#Task step 3
iris %>%
  ggplot(aes(Sepal.Length, Petal.Length)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(Species~.)
#Task step 4
gapminder::gapminder %>%
  ggplot(aes(year, lifeExp, group=country)) +
  geom_smooth(se=FALSE) +
  facet_grid(~continent)

#Scales
gapminder::gapminder %>%
  filter(year==2002) %>%
  ggplot(aes(gdpPercap, lifeExp, colour=continent)) +
  geom_point()
mtcars %>%
  ggplot(aes(wt, mpg, color=hp)) +
  geom_point()
mtcars %>%
  ggplot(aes_(wt, mpg, color=am)) +
  geom_point()
mtcars %>%
  ggplot(aes(wt, mpg, color=factor(am))) +
  geom_point()

#mtcars task
mtcars %>%
  ggplot(aes(wt, mpg, color=cyl)) +
  geom_point()
mtcars %>%
  ggplot(aes(wt, mpg, cyl)) +
  geom_point()
mtcars %>%
  ggplot(aes(wt, mpg)) +
  facet_wrap(~cyl)

#Comparing categories
expdata %>%
  ggplot(aes(x=stimuli, y=RT)) + geom_boxplot()
cpsdata <- read_csv("https://gist.githubusercontent.com/benwhalley/f94baf447612e2434b181739dbba27df/raw/43df26022fff68f49918c795f27d7352dc0d3425/expdata.csv")
expdata %>%
  ggplot(aes(x=stimuli, y=RT)) + geom_boxplot()
expdata <- read_csv("https://gist.githubusercontent.com/benwhalley/f94baf447612e2434b181739dbba27df/raw/43df26022fff68f49918c795f27d7352dc0d3425/expdata.csv")
expdata %>%
  ggplot(aes(x=stimuli, y=RT)) + geom_boxplot()
#NTS:ERRORS ABOVE third time worked,1st time didn't load expdata, 2nd time told R that data was called cpsdata
expdata %>%
  ggplot(aes(x=stimuli, y=RT)) +
  geom_boxplot() +
  facet_wrap (~Condition)

#Other data summary layers
expdata %>%
  ggplot(aes(Condition, RT)) + stat_summary()

#Spit and Polish
mtcars %>% ggplot(aes(wt, mpg)) +
  geom_point() +
  xlab("Weight (1000s of lbs)") +
  ylab("Fuel economy (miles per gallon)")
#Task:try adding   axis labels to one of your existing plots.
gapminder::gapminder %>%
  filter(year==2002) %>%
  ggplot(aes(x=gdpPercap,
             y=lifeExp,
             size=pop,
             color=continent)) +
  geom_point()
gapminder::gapminder %>%
  filter(year==2002) %>%
  ggplot(aes(x=gdpPercap,
             y=lifeExp,
             size=pop,
             color=continent)) +
  geom_point() +
  xlab("Log GDP Per Capita") +
  ylab("Life Expectancy (years)")
