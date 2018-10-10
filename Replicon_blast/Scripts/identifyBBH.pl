#!/usr/bin/perl
use File::Find;
use Cwd;
use 5.010;

# Set the variables to be used in the script
$pwd = cwd(); # present working directory
$parent = "$pwd/BlastOutput/Forward/"; # location of the forward results from the blast analyses
$previous = "XXXXXXXXXXXXX"; # set random variable to start, will be used for comparison later
$proteins = 'intermediaryFiles/queryProteins.txt';

# Prepare an array with the complete set of starting proteins
open($prot,'<',$proteins); # open this file
while(<$prot>) { # while reading the file, do this
	chomp; # remove the new line character from the line
	push(@genes,$_); # put the line into an array
}
close($prot); # close the file

# Script I took from the internet for running the analysis on all files found in the specified folder
find( \&search_all_folder, $parent );
sub search_all_folder {
	chomp $_;
	return if $_ eq '.' or $_ eq '..';
	&read_files ($_) if (-f);
}

# Identify the blast BBHs
sub read_files {
	my ($filename) = @_; # set a variable equal to the name of the current file
	@genes2 = @genes; # copy the array
	system(mkdir Matches); # make a directory in the BlastOutput/Forward folder called Matches
	$output2 = substr($filename,0,-4); # make a variable containing the file name minus the extension (.faa)
	$output2 .= '.txt'; # add a new extension (.txt) to the file name in the variable
	$output = 'Matches/'; # create a variable referring to the new directory Matches
	$output .= $output2; # prepares a final variable for making a new file in the new directory
	unless($filename eq '.DS_Store') { # perform the following analysis for any file unless the file is called .DS_Stores, which will be skipped
		$file1 = substr($filename, 0, -4); # create a new variable with the file name minus the extension
		$file2 = $file1._2; # add '_2' to the end of the variable
		$file3 = "$file2.txt"; # now add '.txt' to the end of the variable
		$reverse = "$pwd/BlastOutput/Reverse/$file3"; # make a variable to the file in variable $file3 in the indicated directory
		open($out,'>',$output); # create and open the new file to be able to write to the file
		open($fh, '<', $filename); # open the file containing the forward results for the current blast-BBH analysis pair
		while(<$fh>) { # while reading the input file, do the following
			@test = split("\t",$_);
			unless(@test[0] eq $previous) { # process the line only if the query is not the same as on the previous line
				if(@test[0] eq @genes2[0]) { # if the query is the current gene of interest, do the following
					@first = split("\t",$_); # split the line based on tabs
						if(@first[2] > 30) { # if the hit has at least 30% identity, do the following
							$length = @first[3] / @first[6]; # calculate the length of the alignment	
							if($length > 0.6) { # do the following if the length of the alignment is greater than 60% of the query protein
								open($rev, '<', $reverse); # open the file with the reverse blast results
								while(<$rev>) { # do the following for each line in the reverse blast results file
									@testB = split("\t",$_);
									if(@testB[1] eq @test[0] and @testB[0] eq @test[1]) { # if the hit protein was the query protein in the forward blast search, do the following
										@second = split("\t",$_);  # split the line into an array as described before
										if(@second[0] eq @first[1] and @second[1] eq @first[0]) { # it BBHs, do the following
											$test = 1; # set a test variable to 1 to indicate the presence of a BBH
											$identity = @second[2]; # record the percent identity
										}
									}
								}
								if($test == 1) {
									if($identity > 30) {
										$length2 = @second[3] / $second[6]; # calculate the length of the alignment
										if($length2 > 0.6) { # do the following if the length is over 60% of the protein
											say $out ("@genes2[0],@first[1]"); # print the query protein name and the hit protein name
										}
										else { # if the alignment is not over 60%, do this
											say $out ("@genes2[0],noHit"); # say the query protein name and indicate there was no hit
										}
									}
									else { # if the percent identity is not over 30%, do this
										say $out ("@genes2[0],noHit"); # say the query protein name and indicate there was no hit
									}
									$test = 0;
								}
								else { # if there is no bidirectional best hit, do this
									say $out ("@genes2[0],noHit"); # say the query protein name and indicate there was no hit
								}
							}
							else { # if the alignment is not over 60%, do this
								say $out ("@genes2[0],noHit"); # say the query protein name and indicate there was no hit
							}
						}
						else { # if the hit does not have 30% identity in the forward direction, do this
							say $out ("@genes2[0],noHit"); # say the query protein name and indicate there was no hit
						}
					$previous = @genes2[0]; # set variable for comparison if the query is the same
					shift(@genes2); # remove the current gene from the array
				}
				else { # if the query is not the current gene of interest, do this
					say $out ("@genes2[0],noHit"); # print the gene of interest and indicate there was no hit
					shift(@genes2); # remove the current gene from the array
					redo; # repeat the loop for the current line until the query is the first gene of the array
				}
			}
		}
	}
}
