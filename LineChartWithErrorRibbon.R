# creates a line graph for measurement ('response', y-axis) during time series ('time_labels', x-axis) and displays shaded error region (std_err)

library(ggplot2)


colnames(df) <- c("response", "std_err", "time_labels") #depending on sequence in data frame

ggplot(df, aes(x=time_labels, y=response)) +
  theme(panel.background = element_blank(),
        axis.text.x = element_text(face = "bold", color = "black", size = 20, angle = 0, hjust=0.5),
        axis.text.y = element_text(color = "black", size=18),
        axis.title.y = element_text(face = "bold", color = "black", size = 34, vjust=3),
        axis.ticks.x = element_line(color = "black", size=2),
        axis.ticks.y = element_line(color = "black", size=2),
        axis.ticks.length = unit(0.3, "cm"),
        axis.line.y = element_line(color = "white", size=2)) +

  geom_line(color="darkblue", size=2.2) +
  geom_ribbon(aes(ymax = response + std_err, ymin = response - std_err), fill = "darkblue", alpha = 0.2) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black")) +
  coord_cartesian(ylim = c(-10, 80)) 

