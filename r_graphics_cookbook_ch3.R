library(gcookbook)

# lets lighten things up a bit and use a different fill colour:
ggplot(pg_mean, aes(x=group, y=weight)) + 
  geom_bar(stat='identity', fill='lightblue', colour='black')