PCA_tm <- function(dds, groups=c("condition", "celltype"), trans_func=vst){
  # a convenience function for PCA-plotting - rather specific to this course
  # Usage: dds %>% PCA_tm(c("condition","celltype"), trans_func = rlog)
  
  # Define color and shape variables - set to NULL if not used
  color_var <- if( length(groups) > 0) { sym(groups[1]) } else { NULL }
  shape_var <- if( length(groups) > 1) { sym(groups[2]) } else { NULL }
  
  # transformation | PCA 
  PCA <- dds %>% trans_func %>% plotPCA(intgroup=groups, returnData=TRUE)
  # get percentage explained variation per PC
  percentVar <- round(100 * attr(PCA, "percentVar"), 1)
  
  ggplot(PCA, aes(x=PC1, y=PC2, color={{color_var}}, shape={{shape_var}})) +
    geom_point(size=3, alpha=0.5) +
    xlab(paste0("PC1: ",percentVar[1])) +
    ylab(paste0("PC2: ",percentVar[2]))
  
}

var_mu_plot <- function(dds,title="variance-vs-mean"){ 
  # input: DESeqDataSet
  # output: ggplot with simple estimates for mean (x) and variance (y)
  #         plotted as density plot for many genes
  means <- dds %>% counts %>% rowMeans()
  vars <- dds %>% counts %>% rowVars(useNames = TRUE)
  data.frame(mean=means,variance=vars) %>% 
    ggplot(aes(x=mean, y=variance)) + 
    # geom_point(alpha=0.25) + 
    # replace points by tile/density plot 
    stat_density2d(aes(fill = after_stat(count)), geom = "tile", n=50, contour=F) +
    scale_fill_continuous(low = "white", high = "dodgerblue3") + 
    # add Poisson line
    geom_abline(intercept = 0, slope = 1, color="red") +
    scale_x_log10() + 
    scale_y_log10() +
    ggtitle(title)
}

plotDispErr <- function(dds){
  # plot the relative error of the dispersion estimate (estimate)
  # against the baseMean
  # this is used in situations where the ture dispersion (trueDisp)
  # is known and part of the mcols(dds) object - i.e for simulated data
  dds %>% mcols %>% data.frame %>% 
    mutate(rel_error_disp=(dispersion-trueDisp)/trueDisp) %>%
    ggplot(aes(x=baseMean, y=rel_error_disp)) + 
    geom_point(color="dodgerblue", alpha=0.4, size=0.3) + 
    geom_abline(intercept = 0, slope = 0, color="red") +
    ylim(-2,10) +
    scale_x_log10()  +
    ylab("relative disp. error")
}

plotDisp <- function(dds){
  # this is a simple alternative to DESeq::plotDispEst()
  # primarily to generate a ggplot version
  dds %>% mcols %>% data.frame %>% 
    mutate(shrink=factor(dispOutlier)) %>%
    ggplot(aes(x=baseMean, y=dispGeneEst)) + 
    geom_point(color="black", alpha=0.4, size=0.3) +
    geom_point(aes(x=baseMean, y=dispersion, size=shrink), color="dodgerblue", alpha=0.4, show.legend = FALSE) +
    geom_line(aes(x=baseMean, y=dispFit), linewidth=1, color="red") +
    scale_x_log10()  +
    scale_y_log10() +
    scale_size_manual(values=c(0.8,1.5,0) , guide = "none") +
    ylab("dispersion")
}


coeflist_to_ggplot <- function(dss, geneid, int=TRUE) {
  # Get coefficients and subset for the wanted gene in a df
  tdf <- coef(dds) %>%
    as.data.frame %>%
    dplyr::filter(row.names(dds) == geneid)
  if (int==TRUE){
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
  return(tdf %>% pivot_longer(colnames(tdf)))
}

