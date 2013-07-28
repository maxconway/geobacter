require(gplots)
require(sybil)
require(lpSolveAPI)

SYBIL_SETTINGS("SOLVER","lpSolveAPI")

mod <- readTSVmod(reactList='geo_m_react.tsv',remUnusedMetReact=FALSE)
obj_coef(mod)[match(c('biomass','EX_fe2(e)'),react_id(mod))] <- c(100,1)

t <- GDMO.M.chromosomes[order(GDMO.M.chromosomes$pos),grep(pattern='Gmet_.*',colnames(GDMO.M.chromosomes))]

showFluxes(met, mod, t, GDMO.M.reactions);
