% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mrca_priors_to_xml_tracelog.R
\name{mrca_priors_to_xml_tracelog}
\alias{mrca_priors_to_xml_tracelog}
\title{Creates the MRCA priors' XML for the tracelog section}
\usage{
mrca_priors_to_xml_tracelog(clock_models, mrca_priors, tipdates_filename = NA)
}
\arguments{
\item{clock_models}{a list of one or more clock models,
as returned by \code{\link{create_clock_model}}}

\item{mrca_priors}{a list of one or more Most Recent Common Ancestor priors,
as returned by \code{\link{create_mrca_prior}}}

\item{tipdates_filename}{name of the file containing the tip dates.
This file is assumed to have two columns, separated by a tab.
The first column contains the taxa names, the second column contains
the date.}
}
\value{
lines of XML text
}
\description{
Creates the MRCA priors' XML for the tracelog section.
}
\details{
\code{
  <logger id="tracelog" ...>
   # Here
  </logger>
}
}
\seealso{
the complete tracelog section is created
  by \code{\link{create_tracelog_xml}}
}
\author{
Richèl J.C. Bilderbeek
}
