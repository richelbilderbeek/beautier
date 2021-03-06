#' Check if the argument is one boolean
#' @param x the argument to be tested to be boolean
#' @examples
#' # TRUE
#' is_one_bool(TRUE)
#' is_one_bool(FALSE)
#'
#' # FALSE
#' is_one_bool(NULL)
#' is_one_bool(NA)
#' is_one_bool(c())
#' is_one_bool("nonsense")
#' is_one_bool(is_one_bool)
#' is_one_bool(c(TRUE, FALSE))
#' @author Richèl J.C. Bilderbeek
#' @export
is_one_bool <- function(x) {
  assertive::is_if_condition(x)
}
