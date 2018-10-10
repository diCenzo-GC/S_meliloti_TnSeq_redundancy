%% Load S. meliloti the models
sinoWT = readCbModel('iGD1575b.xml');
sinoWT2 = readCbModel('iGD1575c.xml');

fprintf("*** S. meliloti models Loaded ***\n");

%% Set medium

% Turn off all exchange reactions
EXlist = {'EX_cpd00156_e0';'EX_cpd11583_e0';'EX_cpd01242_e0';'EX_cpd00254_e0';'EX_cpd15603_e0';'EX_cpd00067_e0';'EX_cpd11576_e0';'EX_cpd00098_e0';'EX_cpd10516_e0';'EX_cpd00137_e0';'EX_cpd08023_e0';'EX_cpd00205_e0';'EX_cpd00034_e0';'EX_cpd00009_e0';'EX_cpd15606_e0';'EX_cpd00048_e0';'EX_cpd00039_e0';'EX_cpd00106_e0';'EX_cpd00264_e0';'EX_cpd00030_e0';'EX_cpd09878_e0';'EX_cpd00129_e0';'EX_cpd00080_e0';'EX_cpd00119_e0';'EX_cpd01017_e0';'EX_cpd11586_e0';'EX_cpd00060_e0';'EX_cpd00309_e0';'EX_cpd11589_e0';'EX_cpd11578_e0';'EX_cpd15302_c0';'EX_cpd00268_e0';'EX_cpd11584_e0';'EX_cpd15604_e0';'EX_cpd00105_e0';'EX_cpd00041_e0';'EX_cpd11593_e0';'EX_cpd00027_e0';'EX_cpd00001_e0';'EX_cpd00222_e0';'EX_cpd01329_e0';'EX_cpd00210_e0';'EX_cpd11587_e0';'EX_cpd00322_e0';'EX_cpd00971_e0';'EX_cpd00013_e0';'EX_cpd00224_e0';'EX_cpd00540_e0';'EX_cpd00107_e0';'EX_cpd00226_e0';'EX_cpd00036_e0';'EX_cpd03725_e0';'EX_cpd10515_e0';'EX_cpd03343_e0';'EX_cpd03048_e0';'EX_cpd00099_e0';'EX_cpd00104_e0';'EX_cpd11592_e0';'EX_cpd00012_e0';'EX_cpd11579_e0';'EX_cpd11580_e0';'EX_cpd11581_e0';'EX_cpd01012_e0';'EX_cpd01262_e0';'EX_cpd00063_e0';'EX_cpd00307_e0';'EX_cpd01914_e0';'EX_cpd00395_e0';'EX_cpd00531_e0';'EX_cpd03724_e0';'EX_cpd11596_e0';'EX_cpd11585_e0';'EX_cpd11575_e0';'EX_cpd00305_e0';'EX_cpd00209_e0';'EX_cpd11591_e0';'EX_cpd00033_e0';'EX_cpd00092_e0';'EX_cpd00064_e0';'EX_cpd00051_e0';'EX_cpd00154_e0';'EX_cpd00058_e0';'EX_cpd04097_e0';'EX_cpd00149_e0';'EX_cpd00179_e0';'EX_cpd15605_e0';'EX_cpd00073_e0';'EX_cpd00118_e0';'EX_cpd11582_e0';'EX_cpd00637_e0';'EX_cpd11588_e0';'EX_cpd01092_e0';'EX_cpd00023_e0';'EX_cpd00075_e0';'EX_cpd00011_e0';'EX_cpd00007_e0';'EX_cpd11416_c0';'EX_cpd15378_e0';'EX_cpd00147_e0';'EX_cpd00121_e0';'EX_cpd11574_e0';'EX_cpd00392_e0';'EX_cpd00366_e0';'EX_cpd00417_e0';'EX_cpd00567_e0';'EX_cpd03727_e0';'EX_cpd15137_e0';'EX_cpd00396_e0';'EX_cpd00308_e0';'EX_cpd02233_e0';'EX_cpd07061_e0';'EX_cpd00122_e0';'EX_cpd00609_e0';'EX_cpd00108_e0';'EX_cpd00117_e0';'EX_cpd00794_e0';'EX_cpd00138_e0';'EX_cpd01171_e0';'EX_cpd00550_e0';'EX_cpd00588_e0';'EX_cpd00100_e0';'EX_cpd00751_e0';'EX_cpd00164_e0';'EX_cpd00159_e0';'EX_cpd00047_e0';'EX_cpd00314_e0';'EX_cpd00079_e0';'EX_cpd02143_e0';'EX_cpd13391_e0';'EX_cpd00082_e0';'EX_cpd00029_e0';'EX_cpd03198_e0';'EX_cpd00184_e0';'EX_cpd00132_e0';'EX_cpd00320_e0';'EX_cpd02351_e0';'EX_cpd00453_e0';'EX_cpd00024_e0';'EX_cpd00094_e0';'EX_cpd02274_e0';'EX_cpd00208_e0';'EX_cpd04349_e0';'EX_cpd00076_e0';'EX_cpd00249_e0';'EX_cpd00053_e0';'EX_cpd00432_e0';'EX_cpd00089_e0';'EX_cpd00072_e0';'EX_cpd13392_e0';'EX_cpd03561_e0';'EX_cpd11603_e0';'EX_cpd00438_e0';'EX_cpd00182_e0';'EX_cpd00611_e0';'EX_cpd00141_e0';'EX_cpd01246_e0';'EX_cpd00139_e0';'EX_cpd00040_e0';'EX_cpd00158_e0';'EX_cpd00246_e0';'EX_cpd00054_e0';'EX_cpd00161_e0';'EX_cpd00035_e0';'EX_cpd00142_e0';'EX_cpd00492_e0';'EX_cpd00386_e0';'EX_cpd00130_e0';'EX_cpd00489_e0';'EX_cpd00374_e0';'EX_cpd03884_e0';'EX_cpd01067_e0';'EX_cpd00020_e0';'EX_cpd00280_e0';'EX_cpd03161_e0';'EX_cpd00162_e0';'EX_cpd11717_e0';'EX_cpd11594_e0';'EX_cpd11879_e0';'EX_cpd00155_e0';'EX_cpd11602_e0';'EX_cpd11748_e0';'EX_cpd11685_e0';'EX_cpd11601_e0';'EX_cpd00832_e0';'EX_cpd00232_e0';'EX_cpd01055_e0';'EX_cpd05240_e0';'EX_cpd00185_e0';'EX_cpd01307_e0';'EX_cpd03696_e0';'EX_cpd00750_e0';'EX_cpd05158_e0';'EX_cpd09457_e0';'EX_cpd05161_e0';'EX_cpd16821_e0';'EX_cpd01200_e0';'EX_cpd00382_e0';'EX_cpd01030_e0';'EX_cpd00212_e0';'EX_cpd01133_e0';'EX_cpd00589_e0';'EX_cpd00306_e0';'EX_cpd00281_e0';'EX_cpd00339_e0';'EX_cpd00211_e0';'EX_cpd01107_e0';'EX_cpd01113_e0';'EX_cpd01502_e0';'EX_cpd00607_e0';'EX_cpd00276_e0';'EX_cpd00599_e0';'EX_cpd00136_e0';'EX_cpd00797_e0';'EX_cpd00728_e0';'EX_cpd03737_e0';'EX_cpd00380_e0';'EX_cpd00180_e0';'EX_cpd01363_e0';'EX_cpd00248_e0';'EX_cpd05192_e0';'EX_cpd00666_e0';'EX_cpd03734_e0';'EX_cpd00477_e0';'EX_cpd00227_e0';'EX_cpd00066_e0';'EX_cpd01293_e0';'EX_cpd10719_e0';'EX_cpd00266_e0';'EX_cpd01799_e0';'EX_cpd02599_e0';'EX_cpd00157_e0';'EX_cpd01947_e0';'EX_cpd00361_e0';'EX_cpd00851_e0';'EX_cpd02175_e0';'EX_cpd00737_e0';'EX_cpd03963_e0';'EX_cpd00084_e0';'EX_cpd00065_e0';'EX_cpd00069_e0';'EX_cpd01308_e0';'EX_cpd00186_e0';'EX_cpd00549_e0';'EX_cpd03840_e0';'EX_cpd00274_e0';'EX_cpd00165_e0';'EX_cpd00187_e0';'EX_cpd00591_e0';'EX_cpd00152_e0';'EX_cpd00312_e0';'EX_cpd00378_e0';'EX_cpd01524_e0';'EX_cpd02241_e0';'EX_cpd00128_e0';'EX_cpd00367_e0';'EX_cpd00207_e0';'EX_cpd00311_e0';'EX_cpd00151_e0';'EX_cpd01217_e0';'EX_cpd00300_e0';'EX_cpd01573_e0';'EX_cpd01588_e0';'EX_cpd11590_e0';'EX_cpd00919_e0';'EX_cpd00635_e0';'EX_cpd00528_e0';'EX_cpdFixed_e0';'EX_cpd11640_e0';'EX_cpd01024_e0';'EX_cpd00197_e0'};
sinoWT = changeRxnBounds(sinoWT,EXlist,0,'l');
sinoWT2 = changeRxnBounds(sinoWT2,EXlist,0,'l');

% Define M9-sucrose
minimalMedium = { 'EX_cpd00305_e0', 'EX_cpd00013_e0', 'EX_cpd00001_e0', 'EX_cpd00007_e0', 'EX_cpd00009_e0', 'EX_cpd00011_e0', 'EX_cpd00030_e0', 'EX_cpd00034_e0', 'EX_cpd00048_e0', 'EX_cpd00058_e0', 'EX_cpd00063_e0', 'EX_cpd00067_e0', 'EX_cpd00099_e0', 'EX_cpd00104_e0', 'EX_cpd00149_e0', 'EX_cpd00205_e0', 'EX_cpd00254_e0', 'EX_cpd00971_e0', 'EX_cpd10515_e0', 'EX_cpd10516_e0', 'EX_cpd00305_e0' };
sinoWT = changeRxnBounds(sinoWT, minimalMedium, -10, 'l');
sinoWT = changeRxnBounds(sinoWT, 'EX_cpd00076_e0', -1 , 'l');
sinoWT2 = changeRxnBounds(sinoWT2, minimalMedium, -10, 'l');
sinoWT2 = changeRxnBounds(sinoWT2, 'EX_cpd00076_e0', -1 , 'l');

% Prevent growth with CO2 as a sole carbon source
sinoWT = changeRxnBounds(sinoWT,'rxn01111_c0',0,'b');
sinoWT2 = changeRxnBounds(sinoWT2,'rxn01111_c0',0,'b');

fprintf("*** Media set ***\n");

%% Delete pSymA and pSymB

% Identify pSymA and pSymB genes
genes = sinoWT2.genes;
pSymA = num2cell(strmatch('sma',genes));
pSymB = num2cell(strmatch('smb',genes));
pSymAB = [pSymA;pSymB];
pSymABgenes = {length(pSymAB)};
for n = 1:length(pSymAB)
    pSymABgenes{n,1} = genes{pSymAB{n,1}};
end

% Delete the pSymA and pSymB genes and remove the associated reactions
[sinoDeleted,hasEffect,constrRxnNames,deletedGenes] = deleteModelGenes(sinoWT2,pSymABgenes);
sinoAB = removeRxns(sinoDeleted, constrRxnNames);

fprintf("*** pSymAB deleted ***\n");

%% Single gene deletion analyses of chromosomal genes

% Identify the chromosomal genes
chromosome = num2cell(strmatch('smc',genes));
chromosomeGenes = {length(chromosome)};
for n = 1:length(chromosome)
    chromosomeGenes{n,1} = genes{chromosome{n,1}};
end

% Perform single gene deletion analyses
[grRatioAB,grRateKOAB,grRateWTAB,delRxnsAB,hasEffectAB] = singleGeneDeletion(sinoAB,'MOMA',chromosomeGenes);
[grRatioWT,grRateKOWt,grRateWTWT,delRxnsWT,hasEffectWT] = singleGeneDeletion(sinoWT,'MOMA',chromosomeGenes);

% Create an output table
outputSingleGeneDeletion = cell(length(grRatioAB)+1,3);
outputSingleGeneDeletion{1,1} = 'Genes';
outputSingleGeneDeletion{1,2} = 'WildType';
outputSingleGeneDeletion{1,3} = 'dpSymAB';
grRatioWT = num2cell(grRatioWT);
grRatioAB = num2cell(grRatioAB);
for n = 1:length(grRatioAB)
    outputSingleGeneDeletion{n+1,1} = chromosomeGenes{n,1};
    outputSingleGeneDeletion{n+1,2} = round(grRatioWT{n,1},3);
    outputSingleGeneDeletion{n+1,3} = round(grRatioAB{n,1},3);
end

fprintf("*** Single chromosomal gene deletion complete ***\n");

%% Single chromosome reaction deletion analyses

% Identify reactions dependent on the chromosome
[sinoDeleted,hasEffect,chromosomeDependentRxns,deletedGenes] = deleteModelGenes(sinoAB,chromosomeGenes);

% Set output variables
outputSingleRxnDeletion = cell(length(chromosomeDependentRxns),3);
outputSingleRxnDeletion{1,1} = 'Reactions';
outputSingleRxnDeletion{1,2} = 'WildType';
outputSingleRxnDeletion{1,3} = 'dpSymAB';

% Delete the reactions
for n = 1:length(chromosomeDependentRxns)
    testWT = sinoWT;
    testAB = sinoAB;
    testWT = removeRxns(testWT,chromosomeDependentRxns{n,1});
    testAB = removeRxns(testAB,chromosomeDependentRxns{n,1});
    WTsolution = optimizeCbModel(testWT,'max');
    ABsolution = optimizeCbModel(testAB,'max');
    outputSingleRxnDeletion{n+1,1} = chromosomeDependentRxns{n,1};
    outputSingleRxnDeletion{n+1,2} = round(WTsolution.f,3);
    outputSingleRxnDeletion{n+1,3} = round(ABsolution.f,3);
end

fprintf("*** Single chromosome reaction deletion complete ***\n");

%% Chromosome double deletion analysis
%
% This section that is commented out was superseded by the folowing
% complete genome double gene deletion analysis
% 
% % Get gene list of non-essential chromosomal genes in the wild type
% m = 0;
% for n = 1:length(chromosomeGenes)
%     if outputSingleGeneDeletion{n+1,2} > 0.1
%         m = m+1;
%         nonEssentialChromosome{m,1} = outputSingleGeneDeletion{n+1,1};
%     end
% end
% 
% % Single gene deletion analyses
% [grRatioWT3,grRateKOWT3,grRateWTWT3,delRxnsWT3,hasEffectWT3] = singleGeneDeletion(sinoWT,'MOMA',nonEssentialChromosome);
% 
% % Perform double gene deletion of non-essential genes
% [grRatioDble,grRateKODbl,grRateWTDbl] = doubleGeneDeletion(sinoWT,'MOMA',nonEssentialChromosome,nonEssentialChromosome);
% 
% % Pull out just the synthetic gene pairs
% outputDoubleGeneDeletion{1,1} = 'Gene 1';
% outputDoubleGeneDeletion{1,2} = 'Gene 2';
% outputDoubleGeneDeletion{1,3} = 'Growth Ratio 1';
% outputDoubleGeneDeletion{1,4} = 'Growth Ratio 2';
% outputDoubleGeneDeletion{1,5} = 'Double Growth Ratio';
% grRatioDble = num2cell(grRatioDble);
% grRatioWT3 = num2cell(grRatioWT3);
% x = 0;
% for n = 1:length(nonEssentialChromosome)
%    for m = 1:length(nonEssentialChromosome)
%        if grRatioDble{m,n} / (grRatioWT3{n,1} * grRatioWT3{m,1}) < 0.9
%            x = x+1;
%            outputDoubleGeneDeletion{x+1,1} = nonEssentialChromosome{m,1};
%            outputDoubleGeneDeletion{x+1,2} = nonEssentialChromosome{n,1};
%            outputDoubleGeneDeletion{x+1,3} = round(grRatioWT3{m,1},3);
%            outputDoubleGeneDeletion{x+1,4} = round(grRatioWT3{n,1},3);
%            outputDoubleGeneDeletion{x+1,5} = round(grRatioDble{m,n},3);
%        end
%    end
% end
% 
% fprintf("*** Double chromosome gene deletion complete ***\n");
% 
% %% Chromosome versus pSymAB double deletion analysis
% 
% % Single gene deletion analyses
% [grRatioWT2,grRateKOWT2,grRateWTWT2,delRxnsWT2,hasEffectWT2] = singleGeneDeletion(sinoWT2,'MOMA',nonEssentialChromosome);
% [grRatioAB2,grRateKOAB2,grRateWTAB2,delRxnsAB2,hasEffectAB2] = singleGeneDeletion(sinoWT2,'MOMA',pSymABgenes);
% 
% % Perform double gene deletion analysis
% [grRatioDbleAB,grRateKODblAB,grRateWTDblAB] = doubleGeneDeletion(sinoWT2,'MOMA',nonEssentialChromosome2,pSymABgenes2);
% 
% % Pull out just the synthetic gene pairs
% x = 0;
% outputChrVsABDblDeletion{1,1} = 'Chromosome Gene';
% outputChrVsABDblDeletion{1,2} = 'pSymAB Genes';
% outputChrVsABDblDeletion{1,3} = 'Growth Ratio Chr';
% outputChrVsABDblDeletion{1,4} = 'Growth Ratio AB';
% outputChrVsABDblDeletion{1,5} = 'Double Growth Ratio';
% grRatioWT2 = num2cell(grRatioWT2);
% grRatioAB2 = num2cell(grRatioAB2);
% grRatioDbleAB = num2cell(grRatioDbleAB);
% for n = 1:length(nonEssentialChromosome)
%    for m = 1:length(pSymABgenes)
%        if grRatioDbleAB{n,m} / (grRatioWT2{n,1} * grRatioAB2{m,1}) < 0.9
%            x = x+1;
%            outputChrVsABDblDeletion{x+1,1} = nonEssentialChromosome{n,1};
%            outputChrVsABDblDeletion{x+1,2} = pSymABgenes{m,1};
%            outputChrVsABDblDeletion{x+1,3} = round(grRatioWT2{n,1},3);
%            outputChrVsABDblDeletion{x+1,4} = round(grRatioAB2{m,1},3);
%            outputChrVsABDblDeletion{x+1,5} = round(grRatioDbleAB{n,m},3);
%        end
%    end
% end
% 
% fprintf("*** Chromosome_pSymAB double gene deletion complete ***\n");

%% Genome double deletion analysis

% Single gene deletion analyses
[grRatioWT4,grRateKOWT4,grRateWTWT4,delRxnsWT4,hasEffectWT4] = singleGeneDeletion(sinoWT,'MOMA');

% Get gene list of non-essential genes in the wild type
genesAll = sinoWT.genes;
grRatioWT4 = num2cell(grRatioWT4);
m = 0;
for n = 1:length(genesAll)
    if grRatioWT4{n,1} > 0.1
        m = m+1;
        nonEssentialGenes{m,1} = genesAll{n,1};
    end
end

% Perform single gene deletion of non-essential genes
[grRatioWT5,grRateKOWT5,grRateWTWT5,delRxnsWT5,hasEffectWT5] = singleGeneDeletion(sinoWT,'MOMA',nonEssentialGenes);
grRatioWT5 = num2cell(grRatioWT5);

% Perform double gene deletion of non-essential genes
[grRatioDbleAll,grRateKODblAll,grRateWTDblAll] = doubleGeneDeletion(sinoWT,'MOMA',nonEssentialGenes,nonEssentialGenes);

% Pull out just the synthetic gene pairs
outputDoubleGeneDeletionAll{1,1} = 'Gene 1';
outputDoubleGeneDeletionAll{1,2} = 'Gene 2';
outputDoubleGeneDeletionAll{1,3} = 'Growth Ratio 1';
outputDoubleGeneDeletionAll{1,4} = 'Growth Ratio 2';
outputDoubleGeneDeletionAll{1,5} = 'Double Growth Ratio';
grRatioDbleAll = num2cell(grRatioDbleAll);
x = 0;
for n = 1:length(nonEssentialGenes)
   for m = 1:length(nonEssentialGenes)
       if grRatioDbleAll{m,n} / (grRatioWT5{n,1} * grRatioWT5{m,1}) < 0.9
           x = x+1;
           outputDoubleGeneDeletionAll{x+1,1} = nonEssentialGenes{m,1};
           outputDoubleGeneDeletionAll{x+1,2} = nonEssentialGenes{n,1};
           outputDoubleGeneDeletionAll{x+1,3} = round(grRatioWT5{m,1},3);
           outputDoubleGeneDeletionAll{x+1,4} = round(grRatioWT5{n,1},3);
           outputDoubleGeneDeletionAll{x+1,5} = round(grRatioDbleAll{m,n},3);
       end
   end
end

fprintf("*** Double gene deletion complete ***\n");

%% Chromosome double reaction deletion

% Identify non-essential chromosome reactions
m = 0;
for n = 1:length(chromosomeDependentRxns)
    if outputSingleRxnDeletion{n+1,2} > 0.1
        m = m+1;
        nonEssentialChromosomeRxns{m,1} = outputSingleRxnDeletion{n+1,1};
        nonEssentialChromosomeRxns{m,2} = outputSingleRxnDeletion{n+1,2};
    end
end

% Get wild type growth rate
wildTypeResult = optimizeCbModel(sinoWT,'max');

% Set  variables
DoubleRxnDeletion = cell(length(nonEssentialChromosomeRxns),5);
DoubleRxnDeletion{1,1} = 'Reaction 1';
DoubleRxnDeletion{1,2} = 'Reaction 2';
DoubleRxnDeletion{1,3} = 'Phenotype 1';
DoubleRxnDeletion{1,4} = 'Phenotype 2';
DoubleRxnDeletion{1,5} = 'Double phenotype';

% Delete the reactions
x=1;
for n = 1:length(nonEssentialChromosomeRxns)
    testWT = sinoWT;
    testModel1 = removeRxns(testWT,nonEssentialChromosomeRxns{n,1});
    for m = 1:length(nonEssentialChromosomeRxns)
        if n ~= m
            x = x+1;
            testModel2 = removeRxns(testModel1,nonEssentialChromosomeRxns{m,1});
            DblSolution = optimizeCbModel(testModel2,'max');
            value1 = nonEssentialChromosomeRxns{n,2} / wildTypeResult.f;
            value2 = nonEssentialChromosomeRxns{m,2} / wildTypeResult.f;
            value3 = DblSolution.f / wildTypeResult.f;
            DoubleRxnDeletion{x,1} = nonEssentialChromosomeRxns{n,1};
            DoubleRxnDeletion{x,2} = nonEssentialChromosomeRxns{m,1};
            DoubleRxnDeletion{x,3} = round(value1,3);
            DoubleRxnDeletion{x,4} = round(value2,3);
            DoubleRxnDeletion{x,5} = round(value3,3);
        end
    end
end

% Pull out only those with a phenotype
x=1;
outputDoubleRxnDeletion{1,1} = 'Reaction 1';
outputDoubleRxnDeletion{1,2} = 'Reaction 2';
outputDoubleRxnDeletion{1,3} = 'Phenotype 1';
outputDoubleRxnDeletion{1,4} = 'Phenotype 2';
outputDoubleRxnDeletion{1,5} = 'Double phenotype';
for n = 1:(length(DoubleRxnDeletion)-1)
    if DoubleRxnDeletion{n+1,5} / (DoubleRxnDeletion{n+1,3} * DoubleRxnDeletion{n+1,4}) < 0.9
        x = x+1;
        outputDoubleRxnDeletion{x,1} = DoubleRxnDeletion{n+1,1};
        outputDoubleRxnDeletion{x,2} = DoubleRxnDeletion{n+1,2};
        outputDoubleRxnDeletion{x,3} = DoubleRxnDeletion{n+1,3};
        outputDoubleRxnDeletion{x,4} = DoubleRxnDeletion{n+1,4};
        outputDoubleRxnDeletion{x,5} = DoubleRxnDeletion{n+1,5};
    end
end

fprintf("*** Double chromosome reaction deletion complete ***\n");

%% Test the R. leguminosarum model

% Load and test the model
model = readCbModel('Rhizobium_leguminosarum_reannotated_model.xml');
solution1 = optimizeCbModel(model,'max');

% Turn off all exchange reactions
EXlist = {'EX_cpd15606_e0';'EX_cpd15605_e0';'EX_cpd15604_e0';'EX_cpd15603_e0';'EX_cpd15561_e0';'EX_cpd15560_e0';'EX_cpd15378_e0';'EX_cpd15302_c0';'EX_cpd11596_e0';'EX_cpd11593_e0';'EX_cpd11592_e0';'EX_cpd11591_e0';'EX_cpd11590_e0';'EX_cpd11589_e0';'EX_cpd11588_e0';'EX_cpd11587_e0';'EX_cpd11586_e0';'EX_cpd11585_e0';'EX_cpd11584_e0';'EX_cpd11583_e0';'EX_cpd11582_e0';'EX_cpd11581_e0';'EX_cpd11580_e0';'EX_cpd11579_e0';'EX_cpd11578_e0';'EX_cpd11576_e0';'EX_cpd11575_e0';'EX_cpd11416_c0';'EX_cpd10516_e0';'EX_cpd09878_e0';'EX_cpd08023_e0';'EX_cpd04097_e0';'EX_cpd03725_e0';'EX_cpd03724_e0';'EX_cpd03696_e0';'EX_cpd03343_e0';'EX_cpd03048_e0';'EX_cpd01914_e0';'EX_cpd01329_e0';'EX_cpd01262_e0';'EX_cpd01242_e0';'EX_cpd01171_e0';'EX_cpd01030_e0';'EX_cpd01017_e0';'EX_cpd01012_e0';'EX_cpd00971_e0';'EX_cpd00794_e0';'EX_cpd00637_e0';'EX_cpd00588_e0';'EX_cpd00540_e0';'EX_cpd00531_e0';'EX_cpd00395_e0';'EX_cpd00322_e0';'EX_cpd00314_e0';'EX_cpd00305_e0';'EX_cpd00276_e0';'EX_cpd00268_e0';'EX_cpd00264_e0';'EX_cpd00254_e0';'EX_cpd00224_e0';'EX_cpd00210_e0';'EX_cpd00209_e0';'EX_cpd00208_e0';'EX_cpd00205_e0';'EX_cpd00179_e0';'EX_cpd00162_e0';'EX_cpd00156_e0';'EX_cpd00154_e0';'EX_cpd00149_e0';'EX_cpd00138_e0';'EX_cpd00137_e0';'EX_cpd00130_e0';'EX_cpd00129_e0';'EX_cpd00122_e0';'EX_cpd00119_e0';'EX_cpd00118_e0';'EX_cpd00107_e0';'EX_cpd00106_e0';'EX_cpd00105_e0';'EX_cpd00104_e0';'EX_cpd00099_e0';'EX_cpd00082_e0';'EX_cpd00080_e0';'EX_cpd00076_e0';'EX_cpd00075_e0';'EX_cpd00067_e0';'EX_cpd00063_e0';'EX_cpd00060_e0';'EX_cpd00058_e0';'EX_cpd00053_e0';'EX_cpd00048_e0';'EX_cpd00041_e0';'EX_cpd00039_e0';'EX_cpd00036_e0';'EX_cpd00034_e0';'EX_cpd00030_e0';'EX_cpd00027_e0';'EX_cpd00023_e0';'EX_cpd00013_e0';'EX_cpd00012_e0';'EX_cpd00011_e0';'EX_cpd00009_e0';'EX_cpd00007_e0';'EX_cpd00001_e0'};
model = changeRxnBounds(model,EXlist,0,'l');
solution2 = optimizeCbModel(model,'max');

% Define M9-sucrose
minimalMedium = { 'EX_cpd00305_e0', 'EX_cpd00013_e0', 'EX_cpd00001_e0', 'EX_cpd00007_e0', 'EX_cpd00009_e0', 'EX_cpd00011_e0', 'EX_cpd00030_e0', 'EX_cpd00034_e0', 'EX_cpd00048_e0', 'EX_cpd00058_e0', 'EX_cpd00063_e0', 'EX_cpd00067_e0', 'EX_cpd00099_e0', 'EX_cpd00104_e0', 'EX_cpd00149_e0', 'EX_cpd00205_e0', 'EX_cpd00254_e0', 'EX_cpd00971_e0', 'EX_cpd10515_e0', 'EX_cpd10516_e0', 'EX_cpd00305_e0' };
model = changeRxnBounds(model, minimalMedium, -10, 'l');
model = changeRxnBounds(model, 'EX_cpd00076_e0', -1 , 'l');
solution3 = optimizeCbModel(model,'max');

% Perform single gene deletion analysis
[grRatioRl,grRateKORl,grRateWTRl,delRxnsRl,hasEffectRl] = singleGeneDeletion(model,'FBA');
genes = model.genes;
grRatioRl = num2cell(grRatioRl);
outputRlGeneDeletion = horzcat(genes, grRatioRl);

%% Save the data

% Save all data
save('allWorkspace.mat');

% Save just output files
clearvars -except output*
save('outputVariables.mat');
