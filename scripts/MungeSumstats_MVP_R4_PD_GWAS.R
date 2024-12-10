library(MungeSumstats)
setwd("/home/cbb575_jy752/Final_project/MungeSumstats/MVP_PD")
getwd()
GWAS_Sumstats_Path <- "/home/cbb575_jy752/Final_project/MungeSumstats/MVP_PD/MVP_R4.1000G_AGR.Phe_332.EUR.GIA.dbGaP.txt.gz"
reformatted <-
  MungeSumstats::format_sumstats(path=GWAS_Sumstats_Path,
                                 ref_genome="GRCh38",
                                 save_path="/home/cbb575_jy752/Final_project/MungeSumstats/MVP_PD/munged_sumstats/munged_MVP_R4_PD_GWASsumstats.tsv.gz",
                                 log_mungesumstats_msgs = TRUE,
                                 log_folder = "/home/cbb575_jy752/Final_project/MungeSumstats/MVP_PD/munged_sumstats")
