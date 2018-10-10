#!usr/bin/perl
use 5.010;

while(<>) {
	chomp;
	@line = split(',',$_);
	$accession = @line[0];
	$strain = @line[1];
	push(@genomes,$accession);
	push(@strainNames,$strain);
}

foreach $library (@strainNames) {
	$name = $library;
	$name .= ".fasta";
	system("makeblastdb -in Proteomes/$name -out BlastDBs/$library -title $library -dbtype 'prot'");
}

foreach $library (@strainNames) {
	$name = $library;
	$name .= ".fasta";
	$library2 = $library;
	$library2 .= "_2";
	system("blastp -query Proteomes/Sinorhizobium_meliloti_Rm1021.fasta -db BlastDBs/$library -out BlastOutput/Forward/Rm1021vs$library.txt -culling_limit 1 -outfmt '6 qseqid sseqid pident length mismatch gapopen qlen qstart qend slen sstart send bitscore evalue' -num_threads 4");
	system("blastp -query Proteomes/$name -db BlastDBs/Sinorhizobium_meliloti_Rm1021 -out BlastOutput/Reverse/Rm1021vs$library2.txt -culling_limit 1 -outfmt '6 qseqid sseqid pident length mismatch gapopen qlen qstart qend slen sstart send bitscore evalue' -num_threads 4");
}

