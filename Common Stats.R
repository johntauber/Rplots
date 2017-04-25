#boxplot for initial visualization

ggplot(Gr64fPeak, aes(x = taste, y = response)) +
  geom_boxplot(fill = "grey80", colour = "blue") +
  scale_x_discrete() + xlab("taste") +
  ylab("response")


# Analysis of Variance with Tukey post-hoc comparison 

 aov <- aov(response ~ taste, data=Gr64fPeak)
 
 TukeyHSD(aov)
 
# Pairwise t-test with Bonferroni correction 
 
 pairwise.t.test(Gr64fPeak$response, Gr64fPeak$taste, p.adj = "bonf")