#!/bin/bash
## **One of the most important thing is that the mem-per-cpu * ntasks-per-node should be less than 100,000 in midway3. However, it should be as close as possible, especially running clumpify.sh**
## Usually caslake have lots of nodes have ~60GB mem, if the required mem <= 60GB per node, the job will run successfully. 
#SBATCH --job-name=snakemake
#SBATCH --output=out.snake
#SBATCH --error=err.snake
#SBATCH --account=pi-xxxxx
#SBATCH --time=36:00:00
#SBATCH --partition=caslake
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=6
#SBATCH --mem-per-cpu=10000
cd ~/
module load samtools
snakemake --core 24 --rerun-incomplete
