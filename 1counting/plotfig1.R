library(ggplot2)
library(scales)
library(dplyr)

this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

errors <- read.csv('pubweeklyerrorbars.csv')
hathi <- read.csv('authorratios.csv')

p <- ggplot() + 
  geom_errorbar(data=errors, mapping=aes(x=year, ymin=low, ymax=high), width=5, size=1, color="black") + 
  geom_point(data=errors, mapping=aes(x=year, y=mean), size=4, shape=21, fill="white") +
  geom_point(data = hathi, mapping = aes(x = year, y = authratio), shape = 18, size = 2, alpha = 0.5) + 
  ylab('') +
  scale_y_continuous(labels = percent, limits = c(0, 0.8)) +
  xlab('') + theme(text = element_text(size = 15)) +
  ggtitle('Percentage of fiction by women in HathiTrust (points)\nand Publishers Weekly (error bars)') +
  xlim(1800, 2007) + 
  theme_bw() +
  theme(text = element_text(size = 16, family = "Avenir Next Medium"), 
        panel.border = element_blank(),
        axis.line = element_line(color = 'black'),
        plot.title = element_text(margin = margin(b = 14), size = 16, lineheight = 1.1))

tiff("fig1.tiff", height = 6, width = 9, units = 'in', res=400)
plot(p)
dev.off()
plot(p)