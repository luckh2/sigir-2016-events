setwd("/Users/cwillis/dev/uiucGSLIS/sigir-2016/plots")

par(mfrow=c(1,1))
pdf("events_at_depth.pdf")
# Number of unique known-event URls at each depth
x <- seq(1:10)
lda <- c(7,13,15,16,17,19,21,22,22,24)
nmf <- c(27,30,37,37,39,41,42,44,44,44)
plot (lda ~ x, type="l", lty=2, lwd=2, xlab="URL Depth", ylab="Number of unique known-event URLs", ylim=c(0,50))
lines (nmf ~ x, lty=1, lwd=2, col="red")
legend("bottomright", c("TMINMF", "LDA"), col = c("red", "black"), lwd=2, lty=c(1,2),bty="n")
dev.off()

par(mfrow=c(1,1))
pdf("prop_at_depth.pdf")
x <- seq(1:10)
lda <- c(0.1400,0.1300, 0.1014, 0.0816, 0.0697, 0.0653, 0.0619, 0.0571, 0.0509, 0.0502)
nmf <- c(0.6585, 0.4054, 0.3274, 0.2517, 0.2097, 0.1830, 0.1585, 0.1438, 0.1279, 0.1146)
plot (lda ~ x, type="l", lty=2, lwd=2, xlab="URL Depth", ylab="Proportion of true events", ylim=c(0,0.8))
lines (nmf ~ x, lty=1, lwd=2, col="red")
legend("topright", c("TMINMF", "LDA"), col = c("red", "black"), lwd=2, lty=c(1,2),bty="n")
dev.off()


