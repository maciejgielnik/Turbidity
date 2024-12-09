library("ggplot2")
source("file_loader.r")
dir.create("output")

filenumber()
filenames(1)
loaded <- fileloader(1)

maindir <- getwd()
df <- data.frame(loaded[,1])


for (i in (1:11) ) {
  print(i)
  
  df[, 2] <- loaded[, i*2]
  df[, 3] <- loaded[, (i*2 + 1)]
  colnames(df) <- c("FT", "protein", "error")

  general_plot <- ggplot(df, aes(x = FT, y = protein))  + theme_bw() + 
    geom_pointrange(shape=1, aes(ymin=protein-error, ymax=protein+error)) +
    xlab("Freeze thaw cycles") + ylab("OD 340 nm") + ggtitle(colnames(loaded)[i*2]) +
    theme(plot.title = element_text(hjust = 0.5)) + xlim(0,6) + 
    scale_y_continuous(breaks=c(0, 0.2, 0.4), limits = c(-0.05, 0.5) ) 
  
  
  
  setwd("output")
  ggsave(paste(colnames(loaded)[i*2], ".jpeg",sep=""), general_plot)
  setwd(maindir)
    
}













