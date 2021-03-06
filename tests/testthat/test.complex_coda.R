context("complex coda")

x <- matrix(runif(30),  10, 3)
x <- miniclo(x)

test_that("exchangability of representations", {
  x.ilr <- ilr(x)
  V <- create_default_ilr_base(ncol(x))
  Sigma <- cov(x.ilr)

  Sigma.clr <- ilrvar2clrvar(Sigma, V)

  expect_equal(Sigma, clrvar2ilrvar(Sigma.clr, V))
  expect_equal(clrvar2varmat(Sigma.clr), ilrvar2varmat(Sigma, V))
  expect_equal(Sigma.clr, alrvar2clrvar(clrvar2alrvar(Sigma.clr, 3), 3))
  expect_equal(ilrvar2alrvar(Sigma, V, 3), clrvar2alrvar(Sigma.clr, 3))
})
