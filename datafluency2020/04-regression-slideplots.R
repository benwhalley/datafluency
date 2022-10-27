studyhabits <- read_csv('https://benwhalley.github.io/rmip/data/studyhabitsandgrades.csv')
set.seed(1234)
ss <- studyhabits %>%
  sample_n(10)

a <- ss %>%
  ggplot(aes(work_hours, grade)) + geom_point() + geom_smooth(se=F,  method="lm", formula = y~poly(x,5))

b <- ss %>%
  ggplot(aes(work_hours, grade)) + geom_point() + geom_smooth(se=F, method="lm", formula = y~poly(x,2))

c <- ss %>%
  ggplot(aes(work_hours, grade)) + geom_point() + geom_smooth(method="lm", se=F)

comb <- plot_grid(c,b,a,
                  labels = c("Straight", "Curved", "Very curvy"),
                  ncol = 3, nrow = 1)

ggsave('media/curveexamples.png', width=5, height=2.5)
comb





dd <- gapminder::gapminder %>% filter(gdpPercap<60000)

(p1 <- dd %>% 
  ggplot(aes(lifeExp, gdpPercap)) + 
  geom_point(alpha=.2, size=.8) + scale_y_log10())

(p2 <- dd %>% 
  ggplot(aes(lifeExp, gdpPercap)) + 
  geom_smooth() + scale_y_log10())


(p3 <- dd %>% 
  ggplot(aes(lifeExp, gdpPercap)) + 
  geom_point(alpha=.2, size=.8) +
  geom_smooth() + scale_y_log10())


ggsave('media/maptool1.png', width=3, height=2, p1)
ggsave('media/maptool2.png', width=3, height=2, p2)
ggsave('media/maptool3.png', width=3, height=2, p3)
