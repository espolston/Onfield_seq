bed <- read.table("/Users/libbypolston/Desktop/UChicago/Kreiner_lab/Coding/Rotation_Winter2025/Results/dcgm_sig.bed")

order <- c("Scaffold_2",
           "Scaffold_3",
           "Scaffold_5",
           "Scaffold_11",
           "Scaffold_6",
           "Scaffold_4",
           "Scaffold_8",
           "Scaffold_12",
           "Scaffold_7",
           "Scaffold_10",
           "Scaffold_1",
           "Scaffold_13",
           "Scaffold_9",
           "Scaffold_16",
           "Scaffold_15",
           "Scaffold_14")

bed_sort <- bed %>% subset(V1 == order[1])

for(i in 2:16){
  bed_sort <- add_row(bed_sort, bed %>% subset(V1 == order[i]))  
}

write.table(bed_sort, file = "/Users/libbypolston/Desktop/UChicago/Kreiner_lab/Coding/Onfield_sampling/dcgm_sig_ordered.bed", col.names = F, row.names = F, quote = F)
