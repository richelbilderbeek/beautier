% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parameter_to_xml.R
\name{parameter_to_xml_lambda}
\alias{parameter_to_xml_lambda}
\title{Internal function}
\usage{
parameter_to_xml_lambda(parameter, beauti_options = create_beauti_options())
}
\arguments{
\item{parameter}{a lambda parameter,
a numeric value.
For advanced usage, use the structure
as created by \code{\link{create_lambda_param}})}

\item{beauti_options}{one BEAUti options object,
as returned by \code{\link{create_beauti_options}}}
}
\value{
the parameter as XML text
}
\description{
Converts a lambda parameter to XML
}
\author{
Richèl J.C. Bilderbeek
}
