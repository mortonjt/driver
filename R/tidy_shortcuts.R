#' Shortcut for summarize variable with quantiles and mean
#'
#' @param data tidy data frame
#' @param var variable name (unquoted) to be summarised
#' @param ... other expressions to pass to summarise
#'
#' @return data.frame
#' @export
#' @details Notation: \code{pX} refers to the \code{X}\% quantile
#' @import dplyr
#' @importFrom stats quantile
#' @importFrom rlang quos quo UQ
#' @examples
#' d <- data.frame("a"=sample(1:10, 50, TRUE),
#'                 "b"=rnorm(50))
#'
#' # Summarize posterior for b over grouping of a and also calcuate
#' # minmum of b (in addition to normal statistics returned)
#' d <- dplyr::group_by(d, a)
#' summarise_posterior(d, b, mean.b = mean(b), min=min(b))
summarise_posterior <- function(data, var, ...){
  qvar <- enquo(var)
  qs <- quos(...)


  data %>%
    summarise(p2.5 = quantile(!!qvar, prob=0.025),
              p25 = quantile(!!qvar, prob=0.25),
              p50 = quantile(!!qvar, prob=0.5),
              mean = mean(!!qvar),
              p75 = quantile(!!qvar, prob=0.75),
              p97.5 = quantile(!!qvar, prob=0.975),
              !!!qs)
}

