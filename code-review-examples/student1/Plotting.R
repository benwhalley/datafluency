
gapminder::gapminder
gapminder::gapminder %>% 
  filter(gdpPercap<60000) %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp,size=pop,colour=continent)) + 
  geom_point()
gapminder::gapminder %>% 
  filter(continent=='Asia') %>% 
  ggplot(aes(x=lifeExp,y=gdpPercap)) +
  geom_point() +
  geom_smooth()
iris %>% ggplot(aes(x=Petal.Length, y=Petal.Width, group=Species)) +
  geom_point() +
  geom_smooth()
gapminder::gapminder %>% ggplot(aes(year, lifeExp, group=country)) +
  geom_smooth(se=FALSE) +
  facet_wrap(continent~)
iris %>% ggplot(aes(x=Sepal.Length,y=Petal.Length)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(Species~)
iris %>% ggplot(aes(x=Sepal.Length,y=Petal.Length,colour=Species)) +
  geom_point() +
  geom_smooth()
gapminder::gapminder %>% 
  filter(year==2002) %>% 
  ggplot(aes(gdpPercap,lifeExp,colour=continent)) +
  geom_point()
mtcars %>% 
  ggplot(aes(wt,mpg,colour=hp)) +
  geom_point()
mtcars %>% 
  ggplot(aes(wt,mpg,colour=factor(am))) +
  geom_point()
mtcars %>% 
  ggplot(aes(wt,mpg,colour=factor(cyl))) +
  geom_point()
mtcars %>% 
  ggplot(aes(wt,mpg)) +
  geom_point() +
  facet_wrap(~cyl)
expdata %>% 
  ggplot(aes(x=stimuli,y=RT)) +
  geom_boxplot() +
  facet_wrap(~Condition)
expdata <- read_csv("http://gist.githubusercontent.com/benwhalley/f94baf447612e2434b181739dbba27df/raw/43df26022fff68f49918c795f27d7352dc0d3425/expdata.csv")
expdata
expdata %>% 
  ggplot(aes(x=stimuli,y=RT)) +
  stat_summary() +
  facet_wrap(~Condition)
expdata %>% 
  ggplot(aes(x=stimuli,y=RT)) +
  stat_summary() +
  geom_boxplot() +
  facet_wrap(~Condition)
cps2data <- read_csv("cps2.csv")
median_income <- cps2data %>% summarise(median(income)) %>% pull(1)
cps2data %>% 
  filter(income<150000) %>% 
  ggplot(aes(income, y=..scaled..)) +
  geom_density() +
  geom_vline(xintercept = median_income, colour="red")
