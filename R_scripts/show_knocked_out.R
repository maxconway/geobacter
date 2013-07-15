setNodeColorRule(met,
								 node.attribute.name='knockout',
								 control.points=c('TRUE','FALSE'),
								 colors=c('red','white'),
								 mode='lookup'
								 )

t <- GDMO.M.chromosomes[order(GDMO.M.chromosomes$pos),grep(pattern='Gmet_.*',colnames(GDMO.M.chromosomes))]
for(i in 1:nrow(t)){
	chrom<-t[i,]
	kos <- GDMO.M.reactions[GDMO.M.reactions$GeneAssociation %in% names(chrom)[chrom==T],c('Abbreviation')]
	setNodeAttributesDirect(met,'knockout','string',as.character(GDMO.M.reactions[,'Abbreviation']),as.character(GDMO.M.reactions$GeneAssociation %in% names(chrom)[chrom==T]))
	redraw(met)
	msg(met,paste('timestep',i))
}