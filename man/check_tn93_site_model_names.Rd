% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_tn93_site_model.R
\name{check_tn93_site_model_names}
\alias{check_tn93_site_model_names}
\title{Check if the \code{tn93_site_model} has the list elements
of a valid \code{tn93_site_model} object.}
\usage{
check_tn93_site_model_names(tn93_site_model)
}
\arguments{
\item{tn93_site_model}{a TN93 site model,
as returned by \code{\link{create_tn93_site_model}}}
}
\value{
nothing
}
\description{
Calls \code{stop} if an element is missing
}
\seealso{
Use \link{create_tn93_site_model}
to create a valid \code{tn93_site_model}
}
\author{
Richèl J.C. Bilderbeek
}
