% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/boosted_regression_forest.R
\name{predict.boosted_regression_forest}
\alias{predict.boosted_regression_forest}
\title{Predict with a boosted regression forest.}
\usage{
\method{predict}{boosted_regression_forest}(
  object,
  newdata = NULL,
  boost.predict.steps = NULL,
  num.threads = NULL,
  ...
)
}
\arguments{
\item{object}{The trained forest.}

\item{newdata}{Points at which predictions should be made. If NULL, makes out-of-bag
predictions on the training set instead (i.e., provides predictions at
Xi using only trees that did not use the i-th training example). Note
that this matrix should have the number of columns as the training
matrix, and that the columns must appear in the same order}

\item{boost.predict.steps}{Number of boosting iterations to use for prediction. If blank, uses the full number of
steps for the object given}

\item{num.threads}{the number of threads used in prediction}

\item{...}{Additional arguments (currently ignored).}
}
\value{
A vector of predictions.
}
\description{
Gets estimates of E[Y|X=x] using a trained regression forest.
}
\examples{
\donttest{
# Train a boosted regression forest.
n <- 50
p <- 10
X <- matrix(rnorm(n * p), n, p)
Y <- X[, 1] * rnorm(n)
r.boosted.forest <- boosted_regression_forest(X, Y)

# Predict using the forest.
X.test <- matrix(0, 101, p)
X.test[, 1] <- seq(-2, 2, length.out = 101)
r.pred <- predict(r.boosted.forest, X.test)

# Predict on out-of-bag training samples.
r.pred <- predict(r.boosted.forest)
}

}
