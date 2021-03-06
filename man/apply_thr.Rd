% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Quality_checking.R
\name{apply_thr}
\alias{apply_thr}
\title{Apply Thresholds}
\usage{
apply_thr(x, thr, name_out, flag = c("higher", "outside", "between", "lower"))
}
\arguments{
\item{x}{A numeric atomic type with \code{NULL} \code{\link{dim}}ensions.}

\item{thr}{A numeric vector with 2 non-missing values.}

\item{name_out}{A character string providing \code{varnames} attribute value
of the output.}

\item{flag}{A character string. Selects one of the available flagging
approaches. Can be abbreviated. See 'Details'.}
}
\value{
An integer vector with the same length as \code{x}. Its
  \code{varnames} and \code{units} attributes are set to  \code{name_out} and
  \code{"-"} values, respectively.
}
\description{
Values of \code{x} are checked against two specified thresholds to obtain
their quality control (QC) flags.
}
\details{
This function is called by \code{\link{extract_QC}} but can be useful on its
own when filtering values of variable according to the 0 - 2 QC flag scheme.

Obtained QC flags are assigned in the range 0 - 2 according to these rules:

For \code{flag = "higher"} \itemize{ \item If \code{x <= thr[1]}, QC flag =
0. \item If \code{x > thr[1] & x <= thr[2]}, QC flag = 1. \item If \code{x >
thr[2]}, QC flag = 2.}

For \code{flag = "outside"} \itemize{ \item If \code{x >= thr[1] & x <=
thr[2]}, QC flag = 0. \item If \code{x < thr[1] | x > thr[2]}, QC flag = 2.}

For \code{flag = "between"} \itemize{ \item If \code{x <= thr[1] | x >=
thr[2]}, QC flag = 0. \item If \code{x > thr[1] & x < thr[2]}, QC flag = 2.
}

For \code{flag = "lower"} \itemize{ \item If \code{x >= thr[1]}, QC flag = 0.
\item If \code{x < thr[1] & x >= thr[2]}, QC flag = 1. \item If \code{x <
thr[2]}, QC flag = 2.}
}
\examples{
apply_thr(1:10, c(3, 6), "example")
set.seed(1)
xx <- data.frame(var = rnorm(20, mean = 1, sd = 2))
xx$higher <- apply_thr(xx$var, c(0, 1), "higher", flag = "higher")
xx$outside <- apply_thr(xx$var, c(-1, 1), "outside", flag = "outside")
xx$between <- apply_thr(xx$var, c(-1, 1), "between", flag = "between")
xx$lower <- apply_thr(xx$var, c(0, -1), "lower", flag = "lower")
xx
str(xx)
}
\seealso{
\code{\link{extract_QC}}.
}
