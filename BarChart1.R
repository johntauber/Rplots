
# generates a bar graph (with error bars) for a data frame 'df' with factors in columns named 'factors' and corresponding data in column 'response' (data is in 'melted' format)

library(ggplot2)


dodge <- position_dodge(width = 0.9)
limits <- aes(ymax = df$response + df$se,
              ymin = df$response - df$se)

ggplot(df, aes(x = factors, y = response)) +
  theme(panel.background = element_blank(),
        axis.text.x = element_text(face = "bold", color = "black", size = 26, angle = 0, hjust=0.5),
        axis.text.y = element_text(color = "black", size=24),
        axis.title.y = element_text(face = "bold", color = "black", size = 34, vjust=3),
        axis.ticks.x = element_line(color = "black", size=2),
        axis.ticks.y = element_line(color = "black", size=2),
        axis.ticks.length = unit(0.3, "cm"),
        axis.line.y = element_line(color = "black", size=3)) +
  geom_errorbar(limits, position = dodge, width = .3, size=2, color="black") +
  geom_bar(stat="identity", position = dodge, width = 0.6, fill="black") +  
  labs(x=NULL, y=expression(paste("Peak ",Delta,"F/F")))