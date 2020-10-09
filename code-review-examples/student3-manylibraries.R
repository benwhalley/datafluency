library(tidyverse)

gapminder::gapminder %>%
  filter(year==2002)  %>%
  ggplot(aes(x=gdpPercap, 
             y=lifeExp, 
             size=pop, 
             color=continent)) + 
  geom_point()

names(gapminder::gapminder)

filter(BLANK==BLANK)

gapminder::gapminder %>%
  filter(continent=="Asia") %>%
  ggplot(aes(lifeExp, gdpPercap)) +
  geom_point() +
  geom_smooth()


library(tidyverse)

cpsdata %>% 
  ggplot(aes(x=education, 
             y=income, 
             color=sex )) + 
  geom_point()

library(tidyverse)
cpsdata %>% 
  ggplot (aes(x=native, 
              y=income)) +
  geom_point() +
  geom_smooth()

cpsdata %>% 
  ggplot (aes(x=income, 
              y=education)) +
  geom_point() +
  geom_smooth()

cpsdata %>% 
  ggplot (aes(x=income, 
              y=native)) +
  geom_point() +
  geom_smooth()  

library(tidyverse)

cpsdata %>% 
  ggplot (aes(x=education, 
              y=native,
              color=sex)) +
  geom_point() +
  geom_smooth()

library(tidyverse)

mtcars

mtcars %>% 
  ggplot (aes(mpg, carb)) +
  geom_point()+
  geom_smooth()

iris

iris %>% 
  ggplot(aes(Sepal.Length, Petal.Length, color=Petal.Width, size=Sepal.Width)) +
  geom_point()+
  geom_smooth()
  