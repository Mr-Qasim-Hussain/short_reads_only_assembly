# Short Reads Only Assembly Project

## Project Setup

This project organizes short-read sequencing data for genome assembly with quality control checkpoints.

### Directory Structure

    .
    ├── 00_raw_reads/              # Raw short reads
    ├── 01_qc_before_processing/   # QC results before processing
    ├── 02_processed_reads/        # Processed reads
    └── 03_qc_after_processing/    # QC after processing

## Usage

1. Copy the short reads `.fastq.gz` files from the source directory to the `00_raw_reads` directory.
2. Run the quality control checks on the raw reads.
3. Process the reads as required for the assembly.
4. Perform quality control checks after processing to ensure data quality.

## Notes

- Ensure that all necessary tools and dependencies are installed before running the pipeline.
- Modify the configuration files as needed to match the specifics of your data and desired analysis parameters.