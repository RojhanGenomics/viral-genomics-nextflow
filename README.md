# Viral Genomics Nextflow Pipeline

[![Nextflow](https://img.shields.io/badge/Nextflow-%E2%89%A521.0-brightgreen)](https://nextflow.io/)
[![DSL2](https://img.shields.io/badge/DSL2-Enabled-blue)](https://www.nextflow.io/docs/latest/dsl2.html)
[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue)](https://github.com/RojhanGenomics/viral-genomics-nextflow)

A reproducible **Nextflow DSL2** pipeline for viral whole genome sequencing analysis.

## Pipeline Workflow
Raw FASTQ → fastp (QC+Trim) → FastQC → BWA-MEM → Samtools → BCFtools → Consensus Genome
text## Features
- Paired-end Illumina data support
- Automated quality control and trimming
- High-quality variant calling (SNPs)
- Consensus sequence generation
- Fully containerizable (Docker ready)
- Modular and reusable design

## Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/RojhanGenomics/viral-genomics-nextflow.git
cd viral-genomics-nextflow

# 2. Run the pipeline
nextflow run main.nf -resume -with-report -with-trace -with-timeline
Results (SRR1553428 - Ebola virus)

Coverage: 100%
Mean Depth: ~3,834×
Variants: 561 high-quality SNPs
Consensus: Successfully generated

Technologies

Nextflow DSL2
fastp, FastQC, BWA, Samtools, BCFtools

Project Structure
text├── main.nf
├── modules.nf
├── nextflow.config
├── README.md
├── samples.csv
└── reference/

Developed a complete, reproducible viral WGS analysis pipeline using Nextflow. Demonstrates skills in workflow management, containerization, and bioinformatics best practices — ideal for scalable genomic data analysis in research or clinical settings.
text
