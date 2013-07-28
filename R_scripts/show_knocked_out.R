t <- GDMO.M.chromosomes[order(GDMO.M.chromosomes$pos),grep(pattern='Gmet_.*',colnames(GDMO.M.chromosomes))]
ShowKnockedOut(met,t,GDMO.M.reactions)