#!usr/bin/perl
use 5.010;

# prepare the necessary variables
$accession = 'intermediaryFiles/accessions.txt'; # for storing the list of accessions
$gene = 'intermediaryFiles/geneNames.txt'; # for storing the list of gene names
$input = 'outputFiles/BBH_output.txt';
$output = 'intermediaryFiles/BBH_accessionList_unsorted.txt';
$output2 = 'intermediaryFiles/BBH_accessionList_sorted.txt';
$featureTable = 'intermediaryFiles/combinedFeatureTables.txt';
$parsedFeatures = 'intermediaryFiles/parsedFeatures.txt';
$current = "";
$previous = "";

# do stuff
$total = 0;
open($accessions,'<',$output2);
while(<$accessions>) {
	chomp;
	if(/[0-9]/) {
		push(@accessions,$_);
		$total++;
	}
}
close($accessions);

# parse the combined feature table
open($parsed,'>',$parsedFeatures);
open($features,'<',$featureTable);
while(<$features>) { # while reading the combined feature tables file, do the following
	if(/CDS/) { # if the line is an entry for a coding region, do the following
		@line = split("\t",$_); # split the line based on tabs
		say $parsed ("@line[10],@line[16]"); # print the accession and the gene name to a new file
	}
}
close($parsed);
close($features);
system("sort $parsedFeatures -o $parsedFeatures");

# get just the data of interest
open($acc,'>',$accession); # open the file
open($gen,'>',$gene); # open the file
open($features2,'<',$parsedFeatures);
while(<$features2>) {
	if(/@accessions[0]/) {
		chomp;
		@line = split(',',$_);
		say $acc ("@line[0]"); # print the accession to the accession file
		say $gen ("@line[1]"); # print the gene name to the gene name file
		shift(@accessions);
		if(@accessions[0] eq "") {
			last;
		}
	}
}		
close($acc); # close the file
close($gen); # close the file
