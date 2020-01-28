#' Creates the \code{tracelog} section of the \code{logger} section
#' of a BEAST2 XML parameter file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_tracelog_xml <- function(# nolint keep long function name, as it extends the 'create_beast2_input' name
  input_filename,
  inference_model
) {
  # Do not be smart yet
  site_models <- list(inference_model$site_model)
  clock_models <- list(inference_model$clock_model)
  tree_priors <- list(inference_model$tree_prior)
  mrca_priors <- list(inference_model$mrca_prior)
  tipdates_filename <- inference_model$tipdates_filename

  text <- NULL

  text <- c(text, "<log idref=\"posterior\"/>") # nolint this is no absolute path
  text <- c(text, "<log idref=\"likelihood\"/>") # nolint this is no absolute path
  text <- c(text, "<log idref=\"prior\"/>") # nolint this is no absolute path
  text <- c(text, beautier::tree_models_to_xml_tracelog(site_models))

  site_models_xml <- beautier::site_models_to_xml_tracelog(site_models)
  if (!is.null(site_models_xml)) {
    text <- c(text, site_models_xml)
  }

  clock_models_xml <- beautier::clock_models_to_xml_tracelog(
    clock_models = clock_models,
    mrca_priors = mrca_priors
  )
  if (!is.null(clock_models_xml)) {
    text <- c(text, clock_models_xml)
  }

  text <- c(text, beautier::tree_priors_to_xml_tracelog(tree_priors))
  text <- c(
    text,
    beautier::mrca_priors_to_xml_tracelog(
      clock_models = clock_models,
      mrca_priors = mrca_priors,
      tipdates_filename = tipdates_filename
    )
  )

  text <- beautier::indent(text)

  top_line <- paste0(
    "<logger ",
    "id=\"tracelog\" "
  )
  if (is.na(inference_model$mcmc$tracelog$filename)) {
    # Alignment IDs
    ids <- beautier::get_alignment_id(
      input_filename,
      capitalize_first_char_id =
        inference_model$beauti_options$capitalize_first_char_id
    )
    filename <- utils::head(ids, n = 1)
    top_line <- paste0(
      top_line,
      "fileName=\"", filename, ".log\" "
    )
  } else {
    testit::assert(!is.na(inference_model$mcmc$tracelog$filename))
    top_line <- paste0(
      top_line,
      "fileName=\"", inference_model$mcmc$tracelog$filename, "\" "
    )
  }
  top_line <- paste0(
    top_line,
    "logEvery=\"", inference_model$mcmc$tracelog$log_every, "\" ",
    "model=\"@posterior\""
  )
  if (inference_model$mcmc$tracelog$mode != "autodetect") {
    top_line <- paste0(
      top_line,
      " mode=\"", inference_model$mcmc$tracelog$mode, "\""
    )
  }
  if (inference_model$mcmc$tracelog$sanitise_headers == TRUE) {
    top_line <- paste0(
      top_line,
      " sanitiseHeaders=\"true\""
    )
  }
  if (inference_model$mcmc$tracelog$sort != "none") {
    top_line <- paste0(
      top_line,
      " sort=\"", inference_model$mcmc$tracelog$sort, "\""
    )
  }
  top_line <- paste0(top_line, ">")

  text <- c(top_line, text)
  c(text, "</logger>")
}