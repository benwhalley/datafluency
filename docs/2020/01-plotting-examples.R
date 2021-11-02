library(tidyverse)
setwd("~/dev/datafluency/")
ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
ggsave('examples/diamonds1.png', width=4, height=3)


ggplot(diamonds %>% sample_n(4000), aes(x=carat, y=price, color=color)) + geom_point(alpha=.5) 
ggsave('examples/diamonds2.png', width=4, height=3)


ggplot(diamonds %>% filter(carat<2.5) %>% sample_n(4000), aes(x=carat, y=price, color=color)) + geom_point(alpha=.3)  + geom_smooth(method="gam", se=F)  
ggsave('examples/diamonds3.png', width=4, height=3)







gapminder::gapminder %>% 
  ggplot(aes(x=lifeExp, y=gdpPercap)) +
  geom_point(alpha=.1) +
  geom_smooth(se=F, color="red") + 
  facet_wrap(~continent)  +
  theme_minimal() + 
  xlab("Life expectancy") + ylab("GDP Per Capita")

ggsave('examples/everything.png', width=3, height=3)





gapminder::gapminder %>% 
  ggplot(aes(x=lifeExp, y=gdpPercap)) +
  geom_point(alpha=.1) +
  geom_smooth(se=F, color="red") + 
  facet_wrap(~continent)  +
  scale_y_log10() +
  theme_minimal() + 
  xlab("Life expectancy") + ylab("log(GDP Per Capita)")

ggsave('examples/everything-log.png', width=3, height=3)






gapminder::gapminder %>% 
  ggplot(aes(x=lifeExp, y=gdpPercap)) +
  geom_point(alpha=.1) +
  geom_smooth(se=F, color="red") + 
  facet_wrap(~continent, ncol=5)  +
  theme_minimal() + 
  coord_cartesian(xlim=c(0,80), ylim=c(0, 30000)) +
  xlab("Life expectancy") + ylab("GDP Per Capita")

ggsave('examples/everything-crop.png', width=6, height=1.5)







gapminder::gapminder %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp)) +
  geom_point(alpha=.1) +
  geom_smooth(se=F, color="red") + 
  facet_wrap(~continent)  +
  theme_minimal() + 
  coord_cartesian(ylim=c(0,80), xlim=c(0, 30000)) +
  ylab("Life expectancy") + xlab("GDP Per Capita")

ggsave('examples/everything.png', width=5, height=4)





theme_set(theme_minimal())
gapminder::gapminder %>% 
  ggplot(aes(x=year, y=lifeExp)) +
  geom_point(alpha=.2, position=position_jitter()) +
  geom_smooth(se=F, color="red") + 
  facet_wrap(~continent, ncol=5)  +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = -90, vjust = 0.5, hjust=1)) +
  scale_x_continuous(breaks = c(1967,1997)) + 
  xlab("") + ylab("Life expectancy")

ggsave('examples/everything.png', width=6, height=3)



gapminder::gapminder %>% 
  ggplot(aes(x=year, y=lifeExp)) +
  geom_point() +
  geom_smooth() + 
  facet_wrap(~continent)

ggsave('examples/everything-default.png', width=6, height=3)




