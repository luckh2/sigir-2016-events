setwd('/Users/cwillis/dev/uiucGSLIS/sigir-2016/results')

lda <- read.csv("rr-lda.out", header=F)
nmf <- read.csv("rr-nmf.out", header=F)

t.test(lda$V1, nmf$V1, alternative="two.sided")

mean(lda$V1)
mean(nmf$V1)
