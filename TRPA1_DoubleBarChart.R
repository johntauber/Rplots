# Good Instructions on http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/


library(ggplot2)


colnames(bar2) <- c("temp", "line", "per")
bar2$line <- factor(bar2$line, levels = unique(bar2$line))
bar2$temp <- as.character(bar2$temp)

ggplot(bar2, aes(x=line, y=per, fill=temp)) +
  theme(panel.background = element_blank(),
        axis.text.x = element_text(face = "bold", color = "black", size = 22, angle = 0, hjust=0.5, margin=margin(-15,0,0,0)),
        axis.text.y = element_text(face = "bold", color = "black", size=32, margin=margin(0,10,0,0)),
        axis.title.y = element_text(color = "black", size = 53, vjust=3, margin=margin(0,35,0,0)),
        axis.ticks.x = element_line(color = "white", size=1.5),
        axis.ticks.y = element_line(color = "black", size=3),
        axis.ticks.length = unit(0.3, "cm"),
        axis.line.y = element_line(color = "black", size=3),
        legend.key.size = unit(1.5, "cm"),
        legend.title = element_text(colour="white", size=10, face="bold"),
        legend.text = element_text(size=30, face="bold")) +
  geom_bar(position=position_dodge(width=0.91), width = .85 , stat="identity") +
  coord_cartesian(ylim = c(-0, 100)) +
  labs(x=NULL, y="% responders") +
  scale_fill_manual(values=c("darkgrey", "black")) 


#For 2 groups of 2 export to 1200 x 700 png 