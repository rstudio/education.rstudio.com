set.seed(12345)
library(tidyverse)
mtcars %>% 
  rownames_to_column(var = "model") %>% 
  ggplot() +
  aes(x = wt * 1000) +
  aes(y = factor(cyl)) +
  ggthemes::theme_solarized() +
  geom_boxplot(fill = "snow2") +
  geom_jitter(height = .2, alpha = .8,
              color = "plum3", size = 3) +
  labs(y = "Number of Cylinders") + 
  labs(x = "Weight in pounds") +
  labs(title = "How do number of cylinders and model weight relate?") +
  labs(subtitle = "Motor Trend US magazine's comparison of thirty-two 1973-74 models") +
  theme(plot.title.position = "plot") +
  geom_label(data = tibble(x = 1), # one row dataframe
             fill = "grey85", x = 4600, 
             y = 1.2, # cylinder is a factor w 3 levels
             label = "These observations aren't part of the 'whiskers' of the Tukey boxplot. Outliers are observations further than 1.5 IQR from the nearer of the upper and lower hinge" %>% 
               str_wrap(25)) +
  geom_curve(data = tibble(x = 1),
             curvature = -.2, 
             arrow = arrow(length = 
                             unit(0.1, 
                                  "inches")),
             x = 4550, xend = 5150,
             y = 1.85, yend = 2.8,
             )
