library(tidyverse)

gapminder::gapminder %>%
  filter(year==2002) %>%
  ggplot(aes(gdpPercap, lifeExp, size=pop, color=continent)) +
  geom_point() +
  scale_x_log10()

iris 

iris %>%
  filter(Species==versicolor) %>%
  ggplot(aes(x=Sepal.Length, y=Petal.Length, size=Sepal.Width, color=Petal.Width)) +
  geom_point() +
  geom_smooth() +
  scale_x_log10()
