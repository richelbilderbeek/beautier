% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gamma_distr_to_xml.R
\name{gamma_distr_to_xml}
\alias{gamma_distr_to_xml}
\title{Internal function}
\usage{
gamma_distr_to_xml(gamma_distr, beauti_options = create_beauti_options())
}
\arguments{
\item{gamma_distr}{a gamma distribution,
as created by \code{\link{create_gamma_distr}})}

\item{beauti_options}{one BEAUti options object,
as returned by \code{\link{create_beauti_options}}}
}
\value{
the distribution as XML text
}
\description{
Converts a gamma distribution to XML
}
\author{
Richèl J.C. Bilderbeek
}
