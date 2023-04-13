coeflist_to_ggplot <- function(dss, geneid) {
  # Get coefficients and subset for the wanted gene in a df
  tdf <- coef(dds) %>%
    as.data.frame %>%
    dplyr::filter(row.names(dds) == geneid)
  # extract intercept and keep for later
  icept <- tdf$Intercept
  # Sum up all columns with intercept
  tdf <- tdf + icept
  # Restore initial intercept value
  tdf$Intercept <- icept
  # melt
  tdf <- tdf %>% pivot_longer( colnames(tdf))
  return(tdf)
}