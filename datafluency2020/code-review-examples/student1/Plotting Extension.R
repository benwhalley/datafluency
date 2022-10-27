cps2data %>% 
  filter(income>500) %>% 
  ggplot(aes(income, colour=sex, y=..scaled..)) +
  geom_density() +
  scale_x_log10()
gapminder::gapminder %>% 
  filter(year==2002) %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp)) +
  geom_point()
gapminder::gapminder %>% 
  filter(year==2002) %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp)) +
  geom_point() +
  scale_x_log10()
rt_times <- read_csv("journal_pone_0189598_subset.csv")
rt_times %>% 
  ggplot(aes(x=age_years, y=rt_hand_dominant, colour=factor(gender))) +
  geom_point() +
  geom_smooth() +
  scale_y_log10() +
  scale_x_continuous(breaks = c(0,25,50,75,100)) +
  xlab("Age") +
  ylab("Reaction Times with Dominant Hand") +
  labs(colour="Gender")
mystery <- read_csv("mystery.csv")
mystery %>% 
  ggplot(aes(x=x,y=y)) +
  geom_point() + 
  facet_grid(~group)
berkley <- read_csv("berkley.csv")
berkley %>% 
  ggplot(aes(x=year,y=percent.admitted, colour=gender)) +
  geom_point() +
  geom_smooth(se=F) +
  facet_wrap(~department)
berkley %>% 
  stat_summary(mean(n.applicants))
berkley %>% group_by(year) %>% summarise(mean(n.applicants))
