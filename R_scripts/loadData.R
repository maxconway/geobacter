# data loading
source('./data/getNames.R',local=TRUE)
source('./data/NameLookup.R',local=TRUE)
source('./data/getChromosomes.R',local=TRUE)
source('./data/BindChromosomes.R',local=TRUE)
# 
#load GDMO
loadGDMO <- function(){
	source('./data/import-GDMO.R',
				 local=TRUE,
				 chdir=TRUE)
	GDMO
}

#loadChromosomes
loadChromosomes <- function(data){
	pb <- txtProgressBar(max=length(data))
	lapply(data, function(x){
		setTxtProgressBar(pb, getTxtProgressBar(pb)+1)
		BindChromosomes(x)
	})
}

GDMO <- loadGDMO()
GDMOsubset <- GDMO[signif(GDMO$id) %in% signif(c(1348023624,1216065381)),]
chromosomes <- loadChromosomes(split(GDMOsubset,GDMOsubset$id))

