#!/bin/bash
#SBATCH -N 1
#SBATCH -n 12
#SBATCH --time=1-00:00:00
#SBATCH --mem=16GB
#SBATCH --err="logs/prepare.out"
#SBATCH --output="logs/prepare.out"
#SBATCH --job-name="prepare"

source /content/DeepDFA/DDFA/activate.sh

# Start singularity instance
python /content/DeepDFA/DDFA/sastvd/scripts/prepare.py --dataset bigvul --global_workers 12 $@
