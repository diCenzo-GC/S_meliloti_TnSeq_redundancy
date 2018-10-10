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

# prepare list of accessions that are needed
open($in,'<',$input);
open($out,'>',$output);
while(<$in>) {
	unless(/Locus/) {
		$_ =~ s/,/\n/g;
		say $out ("$_");
	}
}
close($in);
close($out);
system("sort $output -o $output");
open($out2,'<',$output);
open($out3,'>',$output2);
while(<$out2>) {
	if(/[0-9]/) {
		@line = split(',',$_);
		$current = @line[0];
		if($current ne $previous) {
			print $out3 ("$_");
		}
		$previous = $current;
	}
}


