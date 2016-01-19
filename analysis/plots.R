setwd("/Users/cwillis/dev/uiucGSLIS/sigir-2016/plots")

par(mfrow=c(1,1))
pdf("events_at_depth.pdf")
# Number of candidate events returning known-event URLs at depths 1-10:
x <- seq(1:10)
lda <- c(6,7,8,9,10,10,11,11,11,12)
nmf <- c(18,23,30,31,33,33,34,34,35,36)
plot (lda ~ x, type="l", lty=2, lwd=2, xlab="URL Depth", ylab="Candidate events with known-event URLs", ylim=c(0,40))
lines (nmf ~ x, lty=1, lwd=2, col="red")
legend("bottomright", c("TMINMF", "LDA"), col = c("red", "black"), lwd=2, lty=c(1,2),bty="n")
t.test(lda, nmf)
dev.off()


#Number of unique known-event URLs returned by each system at depths 1-10:
pdf("unique_urls_at_depth.pdf")
lda <- c(6,9,12,12,13,13,14,16,17,20)
nmf <- c(12,12,15,22,22,24,26,27,28,28)
plot (lda ~ x, type="l", lty=2, lwd=2, xlab="URL Depth", ylab="Unique Event URLs", ylim=c(0,40))
lines (nmf ~ x, lty=1, lwd=2, col="red")
legend("bottomright", c("TMINMF", "LDA"), col = c("red", "black"), lwd=2, lty=c(1,2),bty="n")
t.test(lda, nmf)
dev.off()


pdf("events_at_rank_1.pdf")
# Number of candidate events returning known-event URLs at depth 10, by candidate rank:
x <- rep(1:50)
lda <- c(1,2,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5)
nmf <- c(1,2,2,2,2,2,3,3,4,4,4,5,6,6,6,6,7,7,7,7,8,8,8,8,9,10,10,11,11,12,12,13,14,15,15,16,16,17,17,17,17,17,17,17,17,17,17,17,18,18)
plot(lda ~ x, type="l", lwd=2, lty=2, xlab="Candidate event rank", ylab="Known-events at depth 1", ylim=c(0,40))
lines(nmf ~ x, type="l", lwd=2, lty=1, col="red")
legend("bottomright", c("TMINMF", "LDA"), col = c("red", "black"), lwd=2, lty=c(1,2),bty="n")
dev.off()

pdf("events_at_rank_10.pdf")
lda <- c(1,2,3,3,3,4,5,5,5,6,7,7,7,7,7,7,7,7,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9)
nmf <- c(1,2,3,3,4,4,5,6,7,8,8,9,10,11,12,12,13,13,14,14,15,15,15,15,16,17,18,19,20,21,22,23,24,25,25,26,27,28,28,29,30,30,30,31,32,33,33,34,35,36)
plot(lda ~ x, type="l", lwd=2, lty=2, xlab="Candidate event rank", ylab="Known-events at depth 10", ylim=c(0,40))
lines(nmf ~ x, type="l", lwd=2, lty=1, col="red")
legend("bottomright", c("TMINMF", "LDA"), col = c("red", "black"), lwd=2, lty=c(1,2),bty="n")
dev.off()



