
library(ggplot2)
troops <- read.table("C:\\Users\\Ravi\\Documents\\DataVisualization\\ggplot2-minard-gallery\\troops.txt", header=T)
cities <- read.table("C:\\Users\\Ravi\\Documents\\DataVisualization\\ggplot2-minard-gallery\\cities.txt", header=T)
temps <- read.table("C:\\Users\\Ravi\\Documents\\DataVisualization\\ggplot2-minard-gallery\\temps.txt", header=T)
temps$date <- as.Date(strptime(temps$date,"%d%b%Y"))

library(ggplot2)

library(grid)
xlim <- scale_x_continuous(limits = c(24, 39))

par(mfrow=c(2,1))

march <- ggplot(cities, aes(x = long, y = lat)) + 
  geom_path(
    aes(size = survivors, colour = direction, group = group), 
    data=troops
  ) +
  geom_point() +
  geom_text(aes(label = city), hjust=0, vjust=1, size=4) +
  scale_size(range = c(1, 10)) +
  scale_colour_manual(values = c("darkgoldenrod3","lemonchiffon3")) + 
  theme(legend.position="bottom") +
  theme(legend.background = element_rect(fill="ivory2", size=0.5, linetype="solid")) +
  theme(legend.title = element_text(colour="gray27", size=10, face="bold"))
xlim 


march



ggplot(temps, aes(long, temp)) + geom_line() + geom_text(aes(label = paste(day, month)), vjust=1) + xlim
tmp1 <- qplot(long, temp, data=temps, geom="line") + 
  geom_text(aes(label = paste(day, month)), vjust=1) + xlim + theme_minimal() + theme(axis.title.x = element_blank())
tmp1
grid.newpage()
view <- pushViewport(viewport(layout = grid.layout(2, 1)))
print(march, vp = viewport(layout.pos.row = 1, layout.pos.col=1))
print(tmp1, vp = viewport(layout.pos.row = 2, layout.pos.col=1))

