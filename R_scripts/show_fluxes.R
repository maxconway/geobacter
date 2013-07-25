require(gplots)
require(sybil)
require(lpSolveAPI)

SYBIL_SETTINGS("SOLVER","lpSolveAPI")

normalize <- function(x){
	result <- sign(x) * log10(abs(x));
	result[is.nan(result)] <- 0;
	return(result);
}

mod <- readTSVmod(reactList='geo_m_react.tsv',remUnusedMetReact=FALSE)
obj_coef(mod)[match(c('biomass','EX_fe2(e)'),react_id(mod))] <- c(100,1)

setNodeColorRule(met,
								 node.attribute.name='flux',
								 control.points=c(-2,0,2),
								 colors=col2hex(c('black','red','white','green','black')),
								 mode='interpolate'
)

t <- GDMO.M.chromosomes[order(GDMO.M.chromosomes$pos),grep(pattern='Gmet_.*',colnames(GDMO.M.chromosomes))]
changed <- T
for(i in 1:nrow(t)){
	chrom<-t[i,]
	sol <- optimizeProb(object=mod,gene=names(chrom)[chrom==T])
	fluxes <- as.vector(fluxes(sol))
	if(i>1){
		changed <- old != fluxes
	}
	old <- fluxes
	setNodeAttributesDirect(met,'flux','numeric',as.character(GDMO.M.reactions[,'abbreviation'])[changed],normalize(fluxes)[changed])
	redraw(met)
	msg(met,paste('timestep',i))
}