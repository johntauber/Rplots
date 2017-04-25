# Good Instructions on http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/


library(ggplot2)
library(reshape2)

# Using a df with uas (TNT and impTNT), taste (s, f, h, o), per and se
# set taste as factor if not already, and set levels 

bar2$taste <- factor(bar2$taste, levels = c("Sucrose", "Fructose", "HxA", "OcA"))

ggplot(bar2, aes(x=taste, y=per, fill=uas)) +
  theme(panel.background = element_blank(),
        axis.text.x = element_text(face = "bold", color = "black", size = 26, angle = 0, hjust=0.5),
        axis.text.y = element_text(color = "black", size=24),
        axis.title.y = element_text(face = "bold", color = "black", size = 34, vjust=3),
        axis.ticks.x = element_line(color = "black", size=1.5),
        axis.ticks.y = element_line(color = "black", size=2),
        axis.ticks.length = unit(0.3, "cm"),
        axis.line.y = element_line(color = "black", size=3),
        legend.key.size = unit(1.5, "cm"),
        legend.title = element_text(colour="white", size=10, face="bold"),
        legend.text = element_text(size=20, face="bold")) +
  geom_errorbar(aes(ymin=per-se, ymax=per+se), width =.4, size=1.5, position=position_dodge(width = 0.9)) +
  geom_bar(position="dodge", stat="identity") +
coord_cartesian(ylim = c(-0, 100)) +
labs(x=NULL, y="PER (%)") +
scale_fill_manual(values=c("darkgrey", "steelblue")) 
  