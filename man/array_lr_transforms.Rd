% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/array_coda.R
\name{array_lr_transforms}
\alias{array_lr_transforms}
\alias{glr_array}
\alias{glrInv_array}
\alias{alr_array}
\alias{alrInv_array}
\alias{ilr_array}
\alias{ilrInv_array}
\alias{clr_array}
\alias{clrInv_array}
\title{Log-Ratios Transforms for Arrays}
\usage{
glr_array(x, V, parts, dimname = colnames(V))

glrInv_array(y, V, coords, dimname = rownames(V))

alr_array(x, d = dim(x)[parts], parts)

alrInv_array(y, d = dim(y)[coords] + 1, coords)

ilr_array(x, V = NULL, parts)

ilrInv_array(y, V = NULL, coords)

clr_array(x, parts)

clrInv_array(y, coords)
}
\arguments{
\item{x}{multidimensional array in simplex}

\item{V}{transformation matrix (defines transform)}

\item{parts}{index of dimension of \code{x} that represents parts (e.g., compositional variables)}

\item{dimname}{character vector of dimension name for resulting dimension after transformation}

\item{y}{multidimensional array in transformed space}

\item{coords}{index of dimension of \code{x} that represents coords (e.g., transformed variables)}

\item{d}{for ALR, which component (integer position) to take as reference
(default is ncol(x)) for alrInv corresponds to column position in untransformed
matrix.}
}
\value{
array
}
\description{
Extension of \code{\link{base_lr_transforms}} to arrays over arbitrary
margins.
}
\details{
accelerated for parts OR coords == 1
}
\examples{
a <- array(1:100, dim=c(10, 5, 2))
a <- miniclo_array(a, parts=2)
clr_array(a, parts=2)
}
