#boxplot for initial visualization

ggplot(Gr64fPeak, aes(x = taste, y = response)) +
  geom_boxplot(fill = "grey80", colour = "blue") +
  scale_x_discrete() + xlab("taste") +
  ylab("response")

#T-Test for two normally distrubted samples
t.test(x,y)

#Mann-Whitney U-Test / Wilcoxon Rank-Sum Test (same test has two names)

wilcox.test(x,y)


# Analysis of Variance with Tukey post-hoc comparison 

 aov <- aov(response ~ taste, data=Gr64fPeak)
 
 TukeyHSD(aov)
 
# Pairwise t-test with Bonferroni correction 
 
 pairwise.t.test(Gr64fPeak$response, Gr64fPeak$taste, p.adj = "bonf")
 
 library(PMCMR)
 
 data$groups <- factor(data$groups, levels = unique(data$groups))
 
 posthoc.kruskal.dunn.test(x=data, g=groups, p.adjust.method="bonferroni") #needs to be in 'melted' form and data must be factors