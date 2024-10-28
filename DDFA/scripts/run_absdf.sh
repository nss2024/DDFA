#!/bin/bash
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem 16G
#SBATCH --time=1-00:00:00
#SBATCH --output=logs/dbize.log
#SBATCH --error=logs/dbize.log
#SBATCH --job-name="dbize"

source /content/DeepDFA/DDFA/activate.sh

python /content/DeepDFA/DDFA/sastvd/scripts/dbize_absdf.py $@
