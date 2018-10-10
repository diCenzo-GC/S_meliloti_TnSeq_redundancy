#!usr/bin/perl
use 5.010;

# prepare the necessary arrays to download all genomes
while(<>) {
	chomp;
	@line = split(',',$_);
	$accession = @line[0];
	$strain = @line[1];
	push(@genomes,$accession);
	push(@strainNames,$strain);
}

foreach $genome (@genomes) {
	$genome1 = substr($genome,0,3);
	$genome1 .= "/";
	$genome1 .= substr($genome,4,3);
	$genome1 .= "/";
	$genome1 .= substr($genome,7,3);
	$genome1 .= "/";
	$genome1 .= substr($genome,10,3);
	$genome2 = $genome;
	$genome2 .=  "_protein.faa.gz";
	$genome3 = $genome;
	$genome3 .= "_feature_table.txt.gz";
	system("wget --quiet ftp://ftp.ncbi.nlm.nih.gov/genomes/all/$genome1/$genome/$genome2");
	system("wget --quiet ftp://ftp.ncbi.nlm.nih.gov/genomes/all/$genome1/$genome/$genome3");
}

system("gunzip *.gz");

foreach $gen (@genomes) {
	$genome4 = $gen;
	$genome4 .=  "_protein.faa";
	$name = @strainNames[0];
	$name .= ".fasta";
	$genome5 = $gen;
	$genome5 .= "_feature_table.txt";
	$name2 = @strainNames[0];
	$name2 .= ".txt";
	system("mv $genome4 ProteomesNCBI/$name");
	system("mv $genome5 FeatureTables/$name2");
	shift(@strainNames);
}
