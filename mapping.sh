#!/bin/bash

# Load necessary modules
module load Minimap2/2.15
module load bcftools/1.4
module load samtools/1.10


# This script takes as input fastq files in .fastq.gz format and converts them into 
# sorted .bam files against a reference genome/gene sequence.


for ((i=1; i<=7; i++))
do
    barcode=$(printf "%02d" $i)  # Pad the barcode number with leading zeros if needed
	
	# Concatenate all .fastq files if necessary
	cat data/barcode${barcode}/*.fastq.gz > data/barcode${barcode}/barcode${barcode}.fastq.gz


    # Run Minimap2 to align reads
    minimap2 -a data/co1_crab.fasta data/barcode${barcode}/barcode${barcode}.fastq.gz > out/barcode${barcode}/barcode${barcode}.sam 

    # Convert SAM to BAM
    samtools view -S -b out/barcode${barcode}/barcode${barcode}.sam > out/barcode${barcode}/barcode${barcode}.bam

    # Sort BAM
    samtools sort out/barcode${barcode}/barcode${barcode}.bam > out/barcode${barcode}/barcode${barcode}.sorted.bam

    # Index sorted BAM
    samtools index out/barcode${barcode}/barcode${barcode}.sorted.bam
    
done
