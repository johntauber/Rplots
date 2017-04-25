library(ggplot2)
library(dplyr)
library(gridExtra)
library(reshape2)
library(scales)
library(ggthemes)


#imported data with stringAsFactors=FALSE

#changed row names to first column of df
rownames(df) <- df$X 

#deleted first column of df
df <- df[,-1]

#changed column names to desired
colnames(df) <- c("Sucrose", "Fructose", "HxA", "OcA")

#changed data.frame to matrix so that melt(x) could be used to generate correct format for heatmap
df.m <- as.matrix(df)

#melted df.m
mdf.m <- melt(df.m)

#now it is ready to plot!


# for generating heatmap with continuous scale
ggplot(data = mdf.m, aes(x=Var1, y=Var2, fill=value)) +
  geom_tile(color="white", size=0.1) +
  scale_fill_gradient2(low="darkblue", high="red", midpoint = 1) +
  coord_flip()

#for generating heatmap with discrete scale

#categorize variables into discrete ranges with seq()
df$value1 <- cut(df$value, breaks = seq(0, 3, by = 0.4))

#cateogrize variables into discrete ranges manually
mgRdf.m$valuef <- cut(mgRdf.m$value, breaks = c(-Inf, 0.4, 0.8, 1.2, 1.6, 2, Inf))

ggplot(df, aes(Var1, Var2, fill=value1)) +
      geom_tile(color="grey50") +
      scale_fill_manual(values = c("white", "darkblue", "blue", "lightblue", "green")) +
      coord_flip()

ggplot(mgRdf.m, aes(Var1, Var2, fill=value2)) +
  geom_tile(color="white", size=0.1) +
  scale_fill_brewer(name = "Rel. PER", palette = "PRGn") +
  coord_flip() +
  labs(x="Tastant", y="Gal4", title="Normalized PER for UAS-TNT x GRN-Gal4") +
  theme_classic(base_size = 12, base_family="Helvetica")

ggplot(mgRdf.m, aes(Var1, Var2, fill=valuef)) +
  geom_tile(color="white", size=0.1) +
  scale_color_manual(name = "Rel. PER", values = c("(-Inf,0.4]" = "darkblue", "(0.4,0.8]" = "blue", "(0.8,1.2]" = "grey", "(1.2-1.6]" = "red", "(1.6-2]" = "darkred", "(2-Inf]" = "black")) +
  coord_flip() +
  labs(x="Tastant", y="Gal4", title="Normalized PER for UAS-TNT x GRN-Gal4") +
  theme_classic(base_size = 12, base_family="Helvetica")


#IT WORKS
ggplot(miRdf.m, aes(Var1, Var2, fill=valuef)) +
  geom_tile(color="white", size=0.1) +
  scale_fill_manual(name = "Rel. PER", values = c("darkblue","blue", "lightblue", "red", "darkred", "black")) +
  coord_flip() +
  labs(x="Tastant", y="Gal4", title="Normalized PER for UAS-TNT x GRN-Gal4") +
  theme_classic(base_size = 12, base_family="Helvetica")






