library(grid)

pngs <- list.files('/home/elyse/sig_genes_models/', pattern = 'CAU', full.names=F)
print(pngs)

merge.png.pdf <- function(pdfFile, pngFiles, deletePngFiles=FALSE) {

#### Package Install ####
pngPackageExists <- require ("png")

if ( !pngPackageExists ) {
install.packages ("png")
library ("png")

}
#########################

pdf(pdfFile)

n <- length(pngFiles)

for( i in 1:n) {

pngFile <- pngFiles[i]

pngRaster <- readPNG(pngFile)

grid.raster(pngRaster, width=unit(0.7, "npc"), height= unit(0.7, "npc"))

if (i < n) plot.new()
}

dev.off()

if (deletePngFiles) {

unlink(pngFiles)
}

}

merge.png.pdf('CAU_locusCompare.pdf', pngs)
