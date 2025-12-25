# QC Before Processing

Quality control reports for raw short reads before trimming and filtering.

## Output files
- `*.html` - FastQC HTML reports
- `*.zip` - FastQC detailed reports
- `multiqc_report.html` - Combined MultiQC report

## Usage
Run FastQC on raw reads:
```bash
conda activate 01_short_read_qc
fastqc ../00_raw_reads/*.fastq.gz -o ./
```

Then combine reports with MultiQC:
```bash
conda activate 02_multiqc
multiqc ./ -o ./
```

## Note
HTML and ZIP files are ignored by Git for large reports.
