# Graphical representation of argument by 'Grace et al. (2012) Science 355' that a random bivariate sample from a log-normal dist will appear hump-shaped in linear space

library(quantreg)

# generate log-normal dist for two variables
norm = rlnorm(2000, mean = log(15), sd = log(2))
norm2 = rlnorm(2000, mean = log(15), sd = log(2))

# par(mfrow = c(1,2))
# hist(norm, breaks = 20)
# hist(norm2, breaks = 20)

normtest = data.frame(norm, norm2)
colnames(normtest) = c("squid", "chum")

plot(squid ~ chum, data = normtest)

#linear regression(quadratic)
modtest = lm(squid ~ poly(chum, 2), data = normtest)

#quantile regression (95th percentile)
modtestrq = rq(squid ~ poly(chum, 2), data = normtest, tau = 0.95)

I1 = order(normtest$chum)
lines(normtest$chum[I1], modtest$fit[I1], lty = 1)
lines(normtest$chum[I1], modtestrq$fit[I1], lty = 2)

summary(modtest)

