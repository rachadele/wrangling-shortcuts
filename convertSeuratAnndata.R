
library(sceasy)

args <- commandArgs(trailingOnly = TRUE)

# Extract the file path from the command-line argument
file_path <- args[1]

seurat_obj <- readRDS(file_path)
sceasy::convertFormat(seurat_obj, from='seurat', to='anndata', transfer_layers='counts', outFile='out.h5ad', drop_single_values=FALSE)
