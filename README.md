# consensus
This GitHub page presents a simple workflow for generating consensus sequences from Oxford Nanopore sequencing short reads in **.fastq.gz** format.\
\ 
The pipeline starts with **.fastq.gz** short reads and aligns them against a reference sequence in FASTA format using Minimap2 and samtools to produce sorted/indexed **.bam** files.\ 
\
Afterwards, **.bam** files are variant called using FreeBayes to produce **.vcf** (variant call) files. Finally, **.vcf** files are zipped into **.vcf.gz** format and BCFtools is used to generate consensus sequences in FASTA format.

## Dependencies
The following libraries are required for consensus sequence generation (versions for the libraries were used based on what was installed on the Duke Computer Cluster/DCC, but others will likely also suffice).\
\
Minimap2/2.15: documentation and installation instructions [here](https://github.com/lh3/minimap2).\
BCFtools/1.4: installation instructions [here](https://samtools.github.io/bcftools/howtos/install.html), documentation [here](https://samtools.github.io/bcftools/bcftools.html).\
samtools/1.10: build instructions [here](https://github.com/samtools/samtools).\
htslib: build instructions [here](https://github.com/samtools/htslib). htslib is a required dependency for samtools, but sometimes needs to be loaded separately.\
FreeBayes: documentation and installation instructions [here](https://github.com/freebayes/freebayes).\
\
*For MCMF users with a DCC login*: all required modules are already installed on the DCC, and can be accessed with *module load <module name>*.

## Sample Data
This repository comes with .fastq.gz files generated from GridION Nanopore Sequencing for 7 barcoded blue crab (*Callinectes sapidus*) individuals. Data is available in the **/data** folder with fastq files within their respective directories. Samples with multiple **.fastq.gz** files are merged into one **.fastq.gz** file in the scripts provided.\
\
This repository contains 2 scripts which can be run from the command line using ./<script_name>.sh. Then run **./mapping.sh** first to create indexed BAM files. Subsequently, run **./variant.sh** to create VCF and FASTA files for each sample. All files should be generated in the **/out** folder. 

## Contact
For issues with the pipeline, create an issue on GitHub or email thomas.schultz [at] duke.edu or hs32 [at] duke.edu.
