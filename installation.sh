echo "Setting up conda environments for short read quality control..."
# initialize conda
eval "$(conda shell.bash hook)"
# remove existing environments if they exist
conda env remove -n 01_short_read_qc -y
conda env remove -n 02_multiqc -y
# conda env
# 01_fastqc and fastp
conda create -n 01_short_read_qc -y
conda activate 01_short_read_qc

# fastqc for short reads (100-300 illumina)
# for quality check

conda install bioconda::fastqc -y

# for quality check and trimming

conda install bioconda::fastp -y

# using fastqc
# create a folder named raw sequences

mkdir raw_data
cd raw_data


# multiqc (to combining the all of the reports)

conda create -n 02_multiqc -y
conda activate 02_multiqc
conda install bioconda::multiqc

# Git initialization and push to GitHub
echo "Initializing Git repository..."
cd /home/qasim/03_wgs_assembly/short_reads_only_assembly
git init
git add .
git commit -m "Initial commit: Project setup with conda environments for short read QC"
git branch -M main

# Push to GitHub (uncomment and update with your repository URL)
# git remote add origin https://github.com/Mr-Qasim-Hussain/short_reads_only_assembly.git
# git push -u origin main

echo "Git repository initialized. Uncomment the git remote and push commands to push to GitHub."
echo "Make sure you have created the repository on GitHub first."

# install spades for short read assembly
echo "Setting up conda environment for SPAdes genome assembly..."
conda env remove -n 03_spades_assembly -y
conda create -n 03_spades_assembly -y
conda activate 03_spades_assembly
conda install -c bioconda spades -y
# check installation
spades.py --version