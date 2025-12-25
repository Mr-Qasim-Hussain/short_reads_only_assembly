#!/bin/bash

set -e

SOURCE_READS="/home/qasim/03_wgs_assembly/hybrid_genome_assembly_guide_bkc/01_raw_reads/short_reads"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up short reads assembly project..."

# Create directories
mkdir -p "${PROJECT_DIR}/00_raw_reads"
mkdir -p "${PROJECT_DIR}/01_qc_before_processing"
mkdir -p "${PROJECT_DIR}/02_processed_reads"
mkdir -p "${PROJECT_DIR}/03_qc_after_processing"

echo "✓ Directories created"

# Copy short reads
echo "Copying short reads..."
cp "${SOURCE_READS}"/*.fastq.gz "${PROJECT_DIR}/00_raw_reads/" 2>/dev/null && echo "✓ Reads copied" || echo "⚠ No .fastq.gz files found"
mv "${PROJECT_DIR}/00_raw_reads/"*_1.fastq.gz "${PROJECT_DIR}/00_raw_reads/codanics_1.fastq.gz" 2>/dev/null || true
mv "${PROJECT_DIR}/00_raw_reads/"*_2.fastq.gz "${PROJECT_DIR}/00_raw_reads/codanics_2.fastq.gz" 2>/dev/null || true
echo "✓ Project setup complete!"
ls -la "${PROJECT_DIR}"

# Change to QC before processing directory
cd "${PROJECT_DIR}/01_qc_before_processing"
# activate conda environment for short read QC
eval "$(conda shell.bash hook)"
conda activate 01_short_read_qc
# expert use case
mkdir reports
fastqc -o reports --extract --svg -t 8 "${PROJECT_DIR}/00_raw_reads/"*.fastq.gz

# multiqc (to combining the all of the reports)
conda activate 02_multiqc
# run multiqc on fastqc files
# expert use case (check file paths)
multiqc -p -o reports "${PROJECT_DIR}/01_qc_before_processing/reports"