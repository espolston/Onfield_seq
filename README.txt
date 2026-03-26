#get sync file and cmh sites from cds3
cp /cds3/kreiner/2024_onfield_pools/sync/excluded_max_filtered.sync /scratch/midway2/espolston/
cp /cds3/kreiner/dcgm_filteredvcf/dcgm_sig.bed

#intersect poolseq and bed file
module load python/anaconda-2022.05
#conda create -n poolseq grenedalf
conda activate poolseq

#run in sbatch script https://github.com/lczech/grenedalf/wiki 
grenedalf sync --sync-path excluded_max_filtered.sync --filter-region-bed dcgm_sig.bed --file-prefix onfield2024_cmh

#run pca
