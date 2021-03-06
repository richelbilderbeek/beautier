% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tree_models_to_xml_tracelog.R
\name{tree_models_to_xml_tracelog}
\alias{tree_models_to_xml_tracelog}
\title{Creates the tree models' XML for the tracelog section}
\usage{
tree_models_to_xml_tracelog(site_models)
}
\arguments{
\item{site_models}{one or more site models,
as returned by \code{\link{create_site_model}}}
}
\value{
lines of XML text
}
\description{
Creates the tree models' XML for the tracelog section
}
\note{
use site_models just because it contains all IDs
}
\examples{
# <logger id="tracelog" ...>
#'   # Here
# </logger>
}
\seealso{
the complete tracelog section is created
  by \code{\link{create_tracelog_xml}}
}
\author{
Richèl J.C. Bilderbeek
}
