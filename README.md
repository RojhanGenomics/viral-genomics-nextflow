
# Viral Genomics Nextflow Pipeline

A reproducible Nextflow pipeline for viral whole genome sequencing analysis (tested on Ebola virus data).

## Pipeline Overview

```
FASTQ → fastp (trimming + QC) → FastQC → BWA-MEM → Samtools (sort + index) → BCFtools (variant calling) → Consensus Sequence
```

## Features
- Quality control and adapter trimming with **fastp**
- Alignment with **BWA-MEM**
- Variant calling and filtering with **BCFtools**
- Consensus genome generation
- Automatic HTML reports
- Fully modular and reproducible (DSL2)

## Technologies
- **Nextflow** (DSL2)
- fastp, FastQC, BWA, Samtools, BCFtools

## Quick Start

```bash
# Run the pipeline
nextflow run main.nf -resume -with-report -with-trace -with-timeline
```

## Output Structure

```
results/
├── fastp/
├── fastqc/
├── alignment/          # .sam, .sorted.bam, .bai
├── variants/           # .vcf.gz
├── consensus/          # SRR1553428.consensus.fasta
└── reports/
```

## Results (SRR1553428 - Ebola)
- **Coverage**: 100%
- **Average Depth**: ~3834×
- **Variants**: 561 SNPs
- **Consensus**: Generated successfully

## For Resume
> Developed a reproducible viral genomics workflow using **Nextflow** for processing Illumina paired-end NGS data (trimming, alignment, variant calling, and consensus generation).

```


