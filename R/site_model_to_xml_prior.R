#' Converts a site model to XML,
#'   used in the \code{prior} section
#' @param site_model a site model,
#'   as created by \code{\link{create_site_model}})
#' @return the site model as XML text
#' @author Richel J.C. Bilderbeek
site_model_to_xml_prior <- function(
  site_model
) {
  testit::assert(beautier::is_site_model(site_model))
  id <- site_model$id
  testit::assert(beautier::is_id(id))

  text <- NULL
  if (is_hky_site_model(site_model)) {
    text <- c(text, paste0("<prior ",
      "id=\"KappaPrior.s:", id, "\" ",
      "name=\"distribution\" x=\"@kappa.s:", id, "\">"))
    text <- c(text,
      beautier::indent(
        beautier::distr_to_xml(site_model$kappa_prior),
        n_spaces = 4
      )
    )
    text <- c(text, paste0("</prior>"))
  } else if (is_tn93_site_model(site_model)) {
    text <- c(text, paste0("<prior id=\"kappa1Prior.s:", id, "\" ",
      "name=\"distribution\" x=\"@kappa1.s:", id, "\">"))
    text <- c(text,
      beautier::indent(
        beautier::distr_to_xml(site_model$kappa_1_prior),
        n_spaces = 4
      )
    )
    text <- c(text, paste0("</prior>"))
    text <- c(text, paste0("<prior id=\"kappa2Prior.s:", id, "\" ",
      "name=\"distribution\" x=\"@kappa2.s:", id, "\">"))
    text <- c(text,
      beautier::indent(
        beautier::distr_to_xml(site_model$kappa_2_prior),
        n_spaces = 4
      )
    )
    text <- c(text, paste0("</prior>"))
  } else if (is_gtr_site_model(site_model)) {
    text <- c(text, paste0("<prior id=\"RateACPrior.s:", id, "\" ",
      "name=\"distribution\" x=\"@rateAC.s:", id, "\">"))
    text <- c(text, beautier::indent(
      beautier::distr_to_xml(site_model$rate_ac_prior_distr), n_spaces = 4))
    text <- c(text, paste0("</prior>"))
    text <- c(text, paste0("<prior id=\"RateAGPrior.s:", id, "\" ",
      "name=\"distribution\" x=\"@rateAG.s:", id, "\">"))
    text <- c(text, beautier::indent(
      beautier::distr_to_xml(site_model$rate_ag_prior_distr), n_spaces = 4))
    text <- c(text, paste0("</prior>"))
    text <- c(text, paste0("<prior id=\"RateATPrior.s:", id, "\" ",
      "name=\"distribution\" x=\"@rateAT.s:", id, "\">"))
    text <- c(text, beautier::indent(
      beautier::distr_to_xml(site_model$rate_at_prior_distr), n_spaces = 4))
    text <- c(text, paste0("</prior>"))
    text <- c(text, paste0("<prior id=\"RateCGPrior.s:", id, "\" ",
      "name=\"distribution\" x=\"@rateCG.s:", id, "\">"))
    text <- c(text, beautier::indent(
      beautier::distr_to_xml(site_model$rate_cg_prior_distr), n_spaces = 4))
    text <- c(text, paste0("</prior>"))
    text <- c(text, paste0("<prior id=\"RateGTPrior.s:", id, "\" ",
      "name=\"distribution\" x=\"@rateGT.s:", id, "\">"))
    text <- c(text, beautier::indent(
      beautier::distr_to_xml(site_model$rate_gt_prior_distr), n_spaces = 4))
    text <- c(text, paste0("</prior>"))
  }

  text
}