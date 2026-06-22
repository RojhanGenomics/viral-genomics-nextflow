#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { FASTP; FASTQC_TRIMMED; BWA_MEM; SAMTOOLS_SORT; SAMTOOLS_INDEX; BCFTOOLS_CALL; CONSENSUS; REPORT } from './modules.nf'

workflow {

    samples_ch = Channel
        .fromPath(params.samples)
        .splitCsv(header: true)
        .map { row ->
            tuple(
                row.sample,
                file(row.fastq_1, checkIfExists: true),
                file(row.fastq_2, checkIfExists: true)
            )
        }

    ref_ch       = Channel.value(file(params.reference))
    ref_index_ch = Channel.value( collectBwaIndex(params.reference) )

    trimmed_ch = FASTP(samples_ch)
    FASTQC_TRIMMED(trimmed_ch)

    aligned_ch = BWA_MEM(trimmed_ch, ref_index_ch)

    sorted_ch  = SAMTOOLS_SORT(aligned_ch)
    indexed_ch = SAMTOOLS_INDEX(sorted_ch)

    variants_ch = BCFTOOLS_CALL(indexed_ch, ref_ch)
    CONSENSUS(variants_ch, ref_ch)

    REPORT()
}

def collectBwaIndex(ref_path) {
    def base = file(ref_path)
    return [
        base,
        file("${base}.amb"),
        file("${base}.ann"),
        file("${base}.bwt"),
        file("${base}.pac"),
        file("${base}.sa"),
        file("${base}.fai")
    ]
}
