#!/bin/bash

#SBATCH --job-name=Pol
#SBATCH -o ~/stdout/Pol.%j.out
#SBATCH -e ~/stderr/Pol.%j.err
#SBATCH -D ~/Assemblies/Pol

#SBATCH --mail-type=ALL
#SBATCH --mail-user=123@abc.de

#SBATCH --partition=begendiv,main
##SBATCH -w b001
#SBATCH --qos=standard
#SBATCH --cpus-per-task=24
#SBATCH --mem-per-cpu=2G
#SBATCH --time=24:00:00

module load GCC/8.3.0
module load GCCcore/8.3.0
module load Perl/5.30.0-GCCcore-8.3.0
module load Boost/1.71.0-gompic-2019b

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=~/Software/bwa-0.7.17:$PATH

bash ~/Software/MaSuRCA-3.4.2/bin/polca.sh -a ~/Assemblies/MaS/CA/final.genome.scf.fasta -r '~/ILLUMINA_demit.1.fq.gz ~/ILLUMINA_demit.2.fq.gz' -t 24 -m 2G
