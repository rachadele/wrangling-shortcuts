library(sceasy)

args <- commandArgs(trailingOnly = TRUE)

# Check if a file path is provided as a command-line argument
if (length(args) < 1) {
  stop("Please provide a file path as a command-line argument.")
}

# Extract the file path from the command-line argument
file_path <- args[1]

seurat_obj <- readRDS(file_path)
sceasy::convertFormat(seurat_obj, from='seurat', to='anndata', transfer_layers='counts', outFile='out.h5ad', drop_single_values=FALSE)
