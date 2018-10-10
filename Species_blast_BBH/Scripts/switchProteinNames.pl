#!usr/bin/perl
use 5.010;

# prepare variables
$genomesFile = 'genomeList.csv';
$switchAnnotation = 'Scripts/switchAnnotation.py';
$switchAnnotationNew = 'Scripts/switchAnnotation2.py';

# prepare the necessary array to perform the analyses
open($genomes,'<',$genomesFile);
while(<$genomes>) {
	chomp;
	@genomeLine = split(',',$_);
	$strains = @genomeLine[1];
	push(@strainNames,$strains);
}
close($genomes);

foreach $strain (@strainNames) {
	# Prepare the file paths
	$featureFile = "FeatureTables/$strain";
	$featureFile .= ".txt";
	$featureFileAccession = "tempProteomes/$strain";
	$featureFileAccession .= "_accession.txt";
	$featureFileName = "tempProteomes/$strain";
	$featureFileName .= "_geneName.txt";
	$proteomeFile = "ProteomesNCBI/$strain";
	$proteomeFile .= ".fasta";
	$proteomeFileNew = "tempProteomes/$strain";
	$proteomeFileNew .= ".fasta";
	# Shorten the fasta headers
	open($proteome,'<',$proteomeFile);
	open($proteomeNew,'>',$proteomeFileNew);
	while(<$proteome>) {
		if(/>/) {
			@proteomeLine = split('\ ',$_);
			say $proteomeNew ("@proteomeLine[0]");
		}
		else {
			print $proteomeNew ("$_");
		}
	}
	close($proteome);
	close($proteomeNew);
	# Prepare the files for switching annotations
	open($features,'<',$featureFile);
	open($AccessionFeatures,'>',$featureFileAccession);
	open($NameFeatures,'>',$featureFileName);
	while(<$features>) {
		if(/CDS/) {
			@featureLine = split("\t",$_);
			if(@featureLine[10] ne "") {
				if(@featureLine[14] ne "") {
					say $AccessionFeatures (">@featureLine[10]");
					say $NameFeatures (">@featureLine[14]");
				}
				else {
					say $AccessionFeatures (">@featureLine[10]");
					say $NameFeatures (">@featureLine[16]");
				}
			}
		}
	}
	close($features);
	close($AccessionFeatures);
	close($NameFeatures);
	# Prepare the switchAnnotation script
	open($switch,'<',$switchAnnotation);
	open($switchNew,'>',$switchAnnotationNew);
	while(<$switch>) {
		$_ =~ s/accessions/$strain/g;
		$_ =~ s/geneNames/$strain/g;
		$_ =~ s/NCBI_names/$strain/g;
		$_ =~ s/modified_names/$strain/g;
		print $switchNew ("$_");
	}
	# Switch the annotations
	system("python Scripts/switchAnnotation2.py");
}

























