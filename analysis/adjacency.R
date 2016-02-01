setwd('/users/cwillis/dev/uiucGSLIS/events/')
d <- read.csv("ap-matrix-400.out", header=F)
n <- 400
v <- d$V3
l <- as.character(d[1:n,]$V2)
m <- matrix(v, nrow=n, ncol=n, byrow=T)
m[which(m < 0.001)] <- 0


library(igraph)

g <- graph.adjacency(m, weighted=T, mode="undirected", diag=T)

#gc <- cluster_spinglass(g) need connected graph
gc <- cluster_louvain(g)
gc <- cluster_infomap(g, nb.trials=50)
gc <- cluster_fast_greedy(g)
#gc <- cluster_leading_eigen(g)
#gc <- cluster_optimal(g)
gc <- cluster_walktrap(g)
for (i in unique(membership(gc))) {
  print(l[which(membership(gc) == i)])
}

library(MCL)
m[which(m > 0)] <- 1
mc <- mcl(m, addLoops=T, allow1=T, inflation=4)
for (i in unique(mc$Cluster)) {
  print(l[which(mc$Cluster == i)])
}


