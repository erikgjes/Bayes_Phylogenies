# Bayes_Phylogenies
Data and code associated with book chapter on Bayesian Phylogenies in Archaeology

The data and code provided in this repository is associated with the analysis performed in 
"Contributions of Bayesian Phylogenetics to Exploring Patterns of Macroevolution in 
Archaeological Data" written by Erik Gjesfjeld and Peter Jordan. This chapter was submitted 
to the "Handbook of Evolutionary Research in Archaeology" edited by Anna Prentiss and published
by Springer Press. Please do not cite any of the data or code contained in the repository
without first consulting the primary author (Erik Gjesfjeld).  

The primary data sources used in the analysis include the following files:

plains_houses_rev.csv - This data was compiled by Erik Gjesfjeld (Gjesfjeld 2003) and contains
characters and characters states for 40 house features from archaeological sites throughout the
Great Plains of North America. A key for the characters and character states can found in the
chapter text.  

plains_house_dates.csv - This data is a series of dates used to time-cailbrate the MCCT tree. These
dates were compiled using a variey of sources that can be found in the book chapter. If radiocarbon dates
associated with each site (or even each house feature) could be found these dates were used. Otherwise,
the age range for the cultural period the house / site is often assigned to was used. This is admittedly an 
imprecise way to provide tip dates, but was one of the only options available.  

plains_houses_lifespans.txt - This data also derives from the series of dates described above. The format
of the file is that the clade is equal to the cultural tradition (1-Central Plains, 2-Middle Missouri, 
3-Coalesecent). The species number is specific to each site, ts is the earliest age associated with the site,
te is the latest age associaed with site. Age ranges are given in time before present (present = 0). 

BEAST2 Analysis
BEAST2 was the preferred software for constructing the phylogenetic trees used in this research. The analysis
can be replicated in BEAST2 by using the XML control file provided here. The control file provided is for the
time calibrated tree with tip dates provided in Figure 3. The naming of the XML file provides the different choices
made by the analyst (Erik Gjesfjeld) and described in the chapter text. The XML file was produced using the BEAUTi 
associated with BEAST2. 

plains_houses - the raw data used in the analysis
Mk - Markov model
4 - Number of gamma rate categories
strict - Clock model used
Sky - Prior used (Bayesian Skyline Prior)
subs - substition rate was also logged by the MCMC
50 - Number of trees used in the posterior distribution (50,000)
Calib - Nodes for cultural traditions were calibrated on age
BP_TipDates - Tip Dates were provided in BP ages

Tree Files
Files with the .trees or .tre suffix are trees that are results from the BEAST2 analysis. Files that
have the MCCT.trees suffix are a single maximum clade credibility tree that were produced using 
TreeAnnotator associated with BEAST2. Tree files like these can be viewed in programs such as FigTree
directly. 

PyRate Analysis
The analysis of origination and extinction rates was performed using the PyRate program developed by
Daniele Silvestro and collagues (Silvestro et al. 2014). A tutorial on using PyRate with cultural
evolutionary data can be found at github.com/erikgjes/PyRate_Cultural_Evolution. Raw data for this analysis
is found in the plains_houses_lifespans.txt file, marginal rate estimates from the analysis are found in the
plains_houses_0_BD_marginal_rates_RTT.r file which can be loaded into R and plotted.  

R code for Figures
Code for figures 9.1, 9.2, 9.3 and 9.4 are provided as separate R files. These largely contain code for 
graphing and plotting using the results contained in the above files.  


Any questions, comments or constructive criticism about the analysis performed here should be directed 
to the primary authour (Erik Gjesfjeld) at erik.gjesfjeld@gmail.com.  
