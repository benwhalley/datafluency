library(tidyverse)
library(magrittr)
names(gapminder::gapminder)

gapminder::gapminder %>% 
  filter(year==2002, gdpPercap<30000) %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, colour=continent)) + geom_point()
gapminder::gapminder %>% 
  filter(continent=="Asia") %>%
  ggplot(aes(lifeExp, gdpPercap)) +
  geom_point() +
  geom_smooth()

iris
iris %>% 
  ggplot(aes(x=Petal.Length, y=Petal.Width)) +
  geom_point() +
  geom_smooth()

gapminder::gapminder %>% 
  ggplot(aes(year, lifeExp, group=country)) +
  geom_smooth(se=FALSE) +
  facet_wrap(~continent) +
  facet_grid(continent~)

iris %>% 
  ggplot(aes(Sepal.Length, Petal.Length)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~Species)

iris %>% 
  ggplot(aes(Sepal.Length, Petal.Length, colour=Species)) +
  geom_smooth() +
  geom_point()

gapminder::gapminder %>% 
  filter(year==2002) %>% 
  ggplot(aes(gdpPercap, lifeExp, colour=continent)) +
  geom_point()

names(mtcars)

mtcars %>% 
  ggplot(aes(wt, mpg, colour=mpg)) +
  geom_point()

mtcars %>% 
  ggplot(aes(wt, mpg, colour=am)) +
  geom_point()

mtcars %>% 
  ggplot(aes(wt, mpg, colour=factor(am))) +
  geom_point()

mtcars %>% 
  ggplot(aes(wt, mpg, colour=cyl)) +
  geom_point()

mtcars %>% 
  ggplot(aes(wt, mpg)) +
  geom_point() +
  facet_wrap(~cyl)
  
expdata <- read_csv("https://gist.githubusercontent.com/benwhalley/f94baf447612e2434b181739dbba27df/raw/43df26022fff68f49918c795f27d7352dc0d3425/expdata.csv")

expdata %>% 
  ggplot(aes(x=stimuli, y=RT)) +
  geom_boxplot()

expdata %>% 
  ggplot(aes(Condition, RT)) +
  stat_summary()

expdata %>% 
  ggplot(aes(Condition, RT)) +
  stat_summary() +
  geom_boxplot()

mtcars %>% ggplot(aes(wt, mpg)) +
  geom_point() +
  xlab("weight(1000s of lbs)") +
  ylab("Fuel economy (miles per gallon)")

mtcars %>% 
  ggplot(aes(wt, mpg, colour=factor(cyl))) +
  geom_point()

mtcars %>% 
  ggplot(aes(wt, mpg, colour=factor(cyl))) +
  geom_point() +
  labs(color="Cylinders")

rlang::last_error()

cps2 <- read_csv("/home/hewright/cps2.csv")

median_income <- cps2 %>% summarise(median(income)) %>% pull(1)

cps2 %>% 
  filter(income < 150000) %>% 
  ggplot(aes(income, y=..scaled..)) +
  geom_density() +
  geom_vline(xintercept = median_income, colour="red")

cps2 %>% 
  filter(income < 150000) %>% 
  ggplot(aes(income, y=..scaled..)) +
  geom_density() +
  geom_vline(xintercept = mean(var, na.rm = TRUE))

cps2 %>% 
  filter(income < 150000) %>% 
  ggplot(aes(income, y=..scaled..)) +
  geom_density() +
  geom_vline(xintercept = 75000, colour = "blue")

myfunkyplot <- mtcars %>% 
  ggplot(aes(wt, mpg, colour=factor(cyl))) +
  geom_point()

ggsave('myfunkyplot.pdf', myfunkyplot, width = 8, height = 4)
  


