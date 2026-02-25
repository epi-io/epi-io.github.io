#' Calculate Item-Content Validity Index (I-CVI)
#'
#' @param data A dataframe or matrix with items in rows and experts in columns.
#' @return A numeric vector of I-CVI values for each item.
#' @export
calc_icvi <- function(data) {
  apply(data, 1, function(item_ratings) {
    sum(item_ratings >= 3) / length(item_ratings)
  })
}

#' Calculate Scale-Content Validity Index/Average (S-CVI/Ave)
#'
#' @param data A dataframe or matrix with items in rows and experts in columns.
#' @return A single numeric value representing S-CVI/Ave.
#' @export
calc_scvi_ave <- function(data) {
  mean(calc_icvi(data))
}

#' Calculate Scale-Content Validity Index/Universal Agreement (S-CVI/UA)
#'
#' @param data A dataframe or matrix with items in rows and experts in columns.
#' @return A single numeric value representing S-CVI/UA.
#' @export
calc_scvi_ua <- function(data) {
  icvi_scores <- calc_icvi(data)
  sum(icvi_scores == 1) / length(icvi_scores)
}

#' Calculate Modified Kappa Statistic
#'
#' @param data A dataframe or matrix with items in rows and experts in columns.
#' @return A numeric vector of the modified kappa statistic for each item.
#' @export
calc_kappa <- function(data) {
  icvi <- calc_icvi(data)
  # Probability of chance agreement
  pc <- (factorial(ncol(data)) / (2 * factorial(ncol(data) - 2))) * 0.5^ncol(data)
  (icvi - pc) / (1 - pc)
}

#' CVI Summary
#'
#' @param data A dataframe or matrix with items in rows and experts in columns.
#' @return A list containing I-CVI, S-CVI/Ave, S-CVI/UA, and Kappa.
#' @export
cvi_summary <- function(data) {
  list(
    icvi = calc_icvi(data),
    scvi_ave = calc_scvi_ave(data),
    scvi_ua = calc_scvi_ua(data),
    kappa = calc_kappa(data)
  )
}
