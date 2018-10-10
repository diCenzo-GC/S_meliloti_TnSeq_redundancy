#!usr/bin/perl
use 5.010;

while(<>) {
	if(/>/) {
		$_ =~ s/>//;
		@header = split("\ ",$_);
		say(@header[0]);
	}
}
