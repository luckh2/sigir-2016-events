# Number of candidate events returning known-event URLs at depths 1-10:
x <- seq(1:10)
lda <- c(6,7,8,9,10,10,11,11,11,12)
nmf <- c(18,23,30,31,33,33,34,34,35,36)
plot (lda ~ x, type="l", xlab="Depth", ylab="Events", ylim=c(0,40))
lines (nmf ~ x, col="red")
t.test(lda, nmf)


#Number of unique known-event URLs returned by each system at depths 1-10:
lda <- c(6,9,12,12,13,13,14,16,17,20)
nmf <- c(12,12,15,22,22,24,26,27,28,28)
plot (lda ~ x, type="l", xlab="Depth", ylab="Unique Event URLs", ylim=c(0,40))
lines (nmf ~ x, col="red")
t.test(lda, nmf)


par(mfrow=c(1,2))
# Number of candidate events returning known-event URLs at depth 10, by candidate rank:
x <- rep(1:50)
lda <- c(1,2,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5)
nmf <- c(1,2,2,2,2,2,3,3,4,4,4,5,6,6,6,6,7,7,7,7,8,8,8,8,9,10,10,11,11,12,12,13,14,15,15,16,16,17,17,17,17,17,17,17,17,17,17,17,18,18)
plot(lda ~ x, type="l", xlab="Event rank", ylab="Events at depth 1", ylim=c(0,40))
lines(nmf ~ x, type="l", col="red")

lda <- c(1,2,3,3,3,4,5,5,5,6,7,7,7,7,7,7,7,7,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9)
nmf <- c(1,2,3,3,4,4,5,6,7,8,8,9,10,11,12,12,13,13,14,14,15,15,15,15,16,17,18,19,20,21,22,23,24,25,25,26,27,28,28,29,30,30,30,31,32,33,33,34,35,36)
plot(lda ~ x, type="l", xlab="Event rank", ylab="Events at depth 10", ylim=c(0,40))
lines(nmf ~ x, type="l", col="red")


