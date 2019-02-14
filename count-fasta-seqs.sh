#!/bin/sh

# PURPOSE: This script will count the number of sequence files you have in any given fasta files
#
# SYNTAX:  Type the following on your command line, assuming this script is in your path/current directory
# 	   sh count-fasta-seqs.sh <paths to fasta files of interest>
#
#          If you wanted to count the number of sequences for every fasta file in your 
#          current directory, you could run:
# 	   sh count-fasta-seqs.sh *.fasta
#
# How this script should behave:
#
# INPUT:   Paths to one or more fasta sequence files
#
# OUTPUT:  For each file, it should write a line with the number of sequences
#          in the file, a space, and then the file NAME (NOT the path!), and a
#          final line with the total number of sequences across all files.
#
# EXAMPLE: In the same directory as this script, you should find an example
#          fasta file named 'example-seqs1.fasta', which contains:
#
#          >RMB3263_Cyrtodactylus_philippinicus_Negros
#          CGGGCCCATACCCCGAAAATGTTGGTATAAACCCCTTCCTATACTAATAAACCCCATTATTTGATCACTATTACTAAC
#
#          >CWL052_Cyrtodactylus_philippinicus_Negros
#          CGGGCCCATACCCCGAAAATGTTGGTATAAACCCCTTCCTATACTAATAAACCCCATTATTTGATCACTATTACTAAC
#
#          If you run this script on this fasta file, you want to get the
#          following output:
#
#          $ sh count-fasta-seqs.sh example-seqs1.fasta
#          2 example-seqs1.fasta
#          2
#
#          There should be another example fasta file named
#          'example-seqs2.fasta', which contains:
#
#          >RMB7155_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#
#          >RMB7156_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#
#          >RMB7163_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#
#          If you run this script on BOTH fasta files, you want to get the
#          following output:
#
#          $ sh count-fasta-seqs.sh example-seqs1.fasta example-seqs2.fasta
#          2 example-seqs1.fasta
#          3 example-seqs2.fasta
#          5

# Searches for files included in the command line and prints the total sequences and filename to the output
total=0                                #Initializes the variable 'total' & sets equal to zero (0)

for file in "$@"
do
        num=`grep '>' $file | wc -l`   #Takes fasta assigned from the command line by user, searches for the header line character ">" and pipes to wc for counting; This is stored in variable "num"
       	filename=`basename $file`      #Takes the filename for each fasta file and assigns it to the variable "filename"

	echo $num $filename            #Prints the number of sequences in a particular file followed by the respective filename
	total=`expr $total + $num`     #Adds the number of sequences in a particular file to 'total'
done

echo $total                            #Prints the total number of sequences across all of the given fasta files
