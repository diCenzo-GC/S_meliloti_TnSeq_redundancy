# ensure the main directory contains a file titled 'genomeList.csv'.  The fist column must contain the accession part of the file name (e.g. GCF_001027285.1_ASM102728v1), and the second column must contain the name of the species/genome (e.g. Sinorhizobium_meliloti_1021).  But don't make the csv with Excel because it will not work - use gedit.

# make the necessary directories
#printf "*** Analysis started ***\n"
#printf "*** Preparing directories ***\n"
#mkdir Proteomes
#mkdir BlastDBs
#mkdir BlastOutput
#mkdir BlastOutput/Forward
#mkdir BlastOutput/Reverse
#mkdir FeatureTables
#mkdir intermediaryFiles
#mkdir outputFiles
#mkdir tempProteomes
#mkdir ProteomesNCBI
#printf "*** All directories prepared ***\n"

# perform the Blast-BBH analysis
#printf "*** Starting Blast-BBH analysis ***\n"
#printf "*** Preparing proteomes ***\n"
#perl Scripts/downloadGenomes.pl genomeList.csv # download the proteomes of interest
#perl Scripts/switchProteinNames.pl # change the names of the proteins in the fasta files
#printf "*** All proteomes prepared ***\n"
#printf "*** Preparing blast searches ***\n"
#perl Scripts/performBlastAnalysis.pl genomeList.csv # make blast databases and perform the blast searches in both directions.  The file needs to be updated for the correct starting genome as necessary.
#printf "*** Blast searches complete ***\n"
printf "*** Parsing blast output ***\n"
perl Scripts/getQueryProteins.pl Proteomes/Sinorhizobium_meliloti_Rm1021.fasta > intermediaryFiles/queryProteins.txt # get a list of the meliloti proteins
perl Scripts/identifyBBH.pl # parse the output of the blast searches to identify the blast-BBHs
mv BlastOutput/Forward/Matches/ intermediaryFiles/ # move the results directory
printf "*** Blast parsing complete ***\n"
printf "*** Blast-BBH analysis completed ***\n"

# switch the annotations and prepare output file
printf "*** Combining the Blast-BBH results into a single file ***\n"
perl Scripts/combineOutput.pl # combine the results into a single file.  The file needs to be updated for the correct starting genome as necessary.
rm intermediaryFiles/Matches/temp*.txt # remove temporary files from the previous script
mv intermediaryFiles/Matches/BBH_output.csv outputFiles/ # move the combined file to the output directory
printf "*** Blast-BBH results combined into a single file ***\n"

# clean up the folder by moving directories to the intermediaryFiles directory
printf "*** Cleaning up the main directory ***\n"
mv Proteomes/ intermediaryFiles/Proteomes
mv BlastDBs/ intermediaryFiles/BlastDBs
mv BlastOutput/ intermediaryFiles/BlastOutput
mv FeatureTables/ intermediaryFiles/FeatureTables
mv tempProteomes/ intermediaryFiles/tempProteomes
mv ProteomesNCBI/ intermediaryFiles/ProteomesNCBI
printf "*** Directory cleaned up ***\n"
printf "*** Analysis completed ***\n"

# note: I had to shorten a gene for the BBH with fredii because the gene was too long
