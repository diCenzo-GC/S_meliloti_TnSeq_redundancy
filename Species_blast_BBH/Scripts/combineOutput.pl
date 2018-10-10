#!/usr/bin/perl
use File::Find;
use Cwd;
use 5.010;

# Set the variables to be used in the script
$pwd = cwd(); # present working directory
$parent = "$pwd/intermediaryFiles/Matches/"; # location of the forward results from the blast analyses
$test = "";

# Script I took from the internet for running the analysis on all files found in the specified folder
find( \&search_all_folder, $parent );
sub search_all_folder {
	chomp $_;
	return if $_ eq '.' or $_ eq '..';
	&read_files ($_) if (-f);
	system("cp $temporary2 BBH_output.csv");
}

# script to combine the files
sub read_files {
	my ($filename) = @_; # set a variable equal to the name of the current file
	$species = $filename;
	$species =~ s/.txt//;
	$species =~ s/Rm1021vs//;
	unless($filename eq '.DS_S.txt' or $filename eq '.DS_Store') {
		$temporary1 = $parent;
		$temporary1 .= "temp1_$filename";
		$temporary2 = $parent;
		$temporary2 .= "temp2_$filename";
		open($fh,'<',$filename);
		open($temp1,'>',$temporary1);
		say $temp1 ("Locus,$species");
		while(<$fh>) {
			print $temp1 ("$_");
		}
		close($fh);
		close($temp1);
		if($test ne "") {
			system("join -t ',' $temporary1 $test > $temporary2");
		}
		else {
			$temporary2 = $temporary1;
		}
		$test = $temporary2;
	}
}
