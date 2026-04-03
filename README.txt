#get sync file and cmh sites from cds3
cp /cds3/kreiner/2024_onfield_pools/sync/excluded_max_filtered.sync /scratch/midway2/espolston/
cp /cds3/kreiner/dcgm_filteredvcf/dcgm_sig.bed

#intersect poolseq and bed file
module load python/anaconda-2022.05
#conda create -n poolseq grenedalf
conda activate poolseq

#bed file has to be in same order as sync file
makebed.R

#have to sort files lexicographically
sort -k1,1 -k2,2n dcgm_sig.bed > dcgm_sig.sorted.bed

#sync file wont sort and mid doesnt have header- which is rozenn using and how??

#CHECK THAT BED IS RIGHT POSitions - is it 1 or 0 based????

bedtools or awk for filtering


#run in sbatch script https://github.com/lczech/grenedalf/wiki 
grenedalf sync --sync-path excluded_max_filtered.sync --filter-region-bed dcgm_sig.sorted.bed --file-prefix onfield2024_cmh --allow-file-overwriting

#run pca
