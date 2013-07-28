#currently just use results.Rnw
data(GDMO)
source('./data/getNames.R',local=TRUE)
source('./data/NameLookup.R',local=TRUE)
source('./data/getChromosomes.R',local=TRUE)
source('./data/BindChromosomes.R',local=TRUE)
source('./data/natural.R')

GDMO.S=GDMO[GDMO$strain=='sulfurreducens' 
						& (
							(GDMO$pop==500 & GDMO$generation==500)
							|(GDMO$pop==1000 & GDMO$generation==250)
						), ]
GDMO.S.chromosomes<-BindChromosomes(GDMO.S)
pc<-princomp(GDMO.S.chromosomes[,c('maxsyn','minsyn','biomass')])
GDMO.S.chromosomes$pos<-pc$scores[,1]
GDMO.S.reactions=read.delim('./data/geo_s_react.txt',)

GDMO.M=GDMO[GDMO$strain=='metallireducens' 
						& (
							(GDMO$pop==500 & GDMO$generation==500)
							|(GDMO$pop==1000 & GDMO$generation==250)
						), ]
GDMO.M.chromosomes<-BindChromosomes(GDMO.M)
pc<-princomp(GDMO.M.chromosomes[,c('maxsyn','minsyn','biomass')])
GDMO.M.chromosomes$pos<-pc$scores[,1]
GDMO.M.reactions=read.delim('./data/geo_m_react.txt',)