
# generates a bar graph (with error bars) for a data frame 'df' with factors in columns named 'factors' and corresponding data in column 'response' (data is in 'melted' format)

library(ggplot2)

colnames(df) <- c("factors", "response", "se")
df$factors <- factor(df$factors, levels = df$factors)

#dodge <- position_dodge(width = 2)
limits <- aes(ymax = df$response + df$se,
              ymin = df$response - df$se)

ggplot(df, aes(x = factors, y = response)) +
  theme(panel.background = element_blank(),
        axis.text.x = element_text(face = "bold", color = "black", size = 32, angle = 0, hjust=0.5, margin=margin(-15,0,0,0)),
        axis.text.y = element_text(face = "bold", color = "black", size=32, margin=margin(0,10,0,0)),
        axis.title.y = element_text(color = "black", size = 52, vjust=3, margin=margin(0,35,0,0)),
        axis.ticks.x = element_line(color = "white", size=2),
        axis.ticks.y = element_line(color = "black", size=3),
        axis.ticks.length = unit(0.3, "cm"),
        axis.line.y = element_line(color = "black", size=3)) +
  geom_errorbar(limits, width = .3, size=2, color="black") +
  geom_bar(stat="identity", width = 0.7, fill="black") + 
  scale_x_discrete() +
  labs(x=NULL, y=expression(paste("Peak ",Delta,"F/F (%)")))


#For 3 groups Export to PNG with width = 1000, height = 700