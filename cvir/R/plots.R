#' Plot I-CVI values
#'
#' @param data A dataframe or matrix with items in rows and experts in columns.
#' @param threshold A numeric value for the CVI threshold (default 0.78).
#' @return A ggplot2 bar plot of I-CVI values.
#' @import ggplot2
#' @export
plot_icvi <- function(data, threshold = 0.78) {
  icvi_scores <- calc_icvi(data)
  item_names <- rownames(data)
  if (is.null(item_names)) {
    item_names <- paste0("Item ", 1:nrow(data))
  }
  
  df <- data.frame(
    Item = factor(item_names, levels = item_names),
    I_CVI = icvi_scores
  )
  
  ggplot(df, aes(x = Item, y = I_CVI)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    geom_hline(yintercept = threshold, linetype = "dashed", color = "red") +
    ylim(0, 1) +
    labs(title = "Item-Level Content Validity Index (I-CVI)",
         subtitle = paste("Threshold line at", threshold),
         x = "Item",
         y = "I-CVI Score") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

#' Plot Ratings Heatmap
#'
#' @param data A dataframe or matrix with items in rows and experts in columns.
#' @return A ggplot2 tile plot of ratings.
#' @import ggplot2
#' @export
plot_ratings <- function(data) {
  item_names <- rownames(data)
  if (is.null(item_names)) {
    item_names <- paste0("Item ", 1:nrow(data))
  }
  
  expert_names <- colnames(data)
  if (is.null(expert_names)) {
    expert_names <- paste0("Expert ", 1:ncol(data))
  }
  
  # Convert to long format for ggplot2
  df <- data.frame(
    Item = rep(factor(item_names, levels = rev(item_names)), ncol(data)),
    Expert = rep(factor(expert_names, levels = expert_names), each = nrow(data)),
    Rating = as.vector(as.matrix(data))
  )
  
  ggplot(df, aes(x = Expert, y = Item, fill = factor(Rating))) +
    geom_tile(color = "white") +
    scale_fill_brewer(palette = "RdYlGn", direction = 1, name = "Rating") +
    labs(title = "Expert Ratings Heatmap",
         x = "Expert",
         y = "Item") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}
