# Viral Genomics Nextflow Pipeline

[![Nextflow](https://img.shields.io/badge/Nextflow-21%2B-brightgreen)](https://nextflow.io/)
[![DSL2](https://img.shields.io/badge/DSL2-Enabled-blue)](https://www.nextflow.io/docs/latest/dsl2.html)
![GitHub repo size](https://img.shields.io/github/repo-size/RojhanGenomics/viral-genomics-nextflow)

A reproducible **Nextflow** pipeline for viral whole-genome sequencing analysis.

## Pipeline Overview
Raw FASTQ → fastp (QC + Trimming) → FastQC → BWA-MEM → Samtools (sort/index) → BCFtools (mpileup + call) → Consensus Sequence

## Features
- Paired-end Illumina data support
- Automatic quality control and trimming
- Variant calling with quality filtering
- Consensus genome generation
- Modular DSL2 design
- Reproducible & portable

## Quick Start

```bash
# Clone repository
git clone https://github.com/RojhanGenomics/viral-genomics-nextflow.git
cd viral-genomics-nextflow

# Prepare reference index (if not done)
bwa index reference/GCF_000848505.1_ViralProj14703_genomic.fna

# Run pipeline
nextflow run main.nf -resume -with-report -with-trace -with-timeline
Results (Example: SRR1553428 - Ebola virus)

Coverage: 100%
Average Depth: ~3,834×
Variants: 561 high-quality SNPs
Consensus sequence: Generated

Technologies

Nextflow DSL2
fastp, FastQC, BWA, Samtools, BCFtools

Project Structure
viral-genomics-nextflow/
├── main.nf
├── modules.nf
├── nextflow.config
├── README.md
├── samples.csv
├── reference/
└── results/          # generated after run
Developed a fully reproducible viral WGS pipeline using Nextflow, suitable for high-throughput genomic analysis in clinical and research settings.
