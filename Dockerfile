FROM continuumio/miniconda3:latest

WORKDIR /pipeline

# Install system dependencies
RUN apt-get update && apt-get install -y \
    bzip2 \
    ca-certificates \
    curl \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create conda environment with essential tools
RUN conda create -n viral-pipeline -y \
    -c bioconda \
    -c conda-forge \
    bwa samtools bcftools fastp fastqc multiqc && \
    conda clean --all -y

# Activate environment
ENV PATH /opt/conda/envs/viral-pipeline/bin:$PATH

# Install Nextflow
RUN curl -s https://get.nextflow.io | bash && \
    mv nextflow /usr/local/bin/ && \
    chmod +x /usr/local/bin/nextflow

# Copy pipeline files
COPY main.nf modules.nf nextflow.config ./
COPY reference/ ./reference/

# Set default command
CMD ["nextflow", "run", "main.nf", "-resume"]
