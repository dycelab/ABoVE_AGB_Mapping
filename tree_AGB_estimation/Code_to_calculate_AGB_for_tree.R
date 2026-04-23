

#### step 1: set work directory and read tree level data  ####
work_dir = ''
setwd(work_dir)


tree_dta = read.csv('example_tree_dbh_height_data.csv')
tree_dta$dbh[tree_dta$dbh<0] = NaN
tree_dta$height[tree_dta$height<0] = NaN
tree_dta = tree_dta[!is.na(tree_dta$dbh),]
dim(tree_dta)

## column species_gs is the species code which can be recoginzed by CTAE(old version, new version called ‘CanadaForestAllometry’) package to calculate AGB by species
head(tree_dta)

#### step 2: for species without a specific allometry, use allometry from similar species   ####
tree_dta$Code = tree_dta$species_gs
tree_dta$Code[tree_dta$Code=='ALNU.SPP'] = 'BETU.PAP'
tree_dta$Code[tree_dta$Code=='FAGU.SPP'] = 'FAGU.GRA'
tree_dta$Code[tree_dta$Code=='ACER.SPI'] = 'ACER.SAH'
tree_dta$Code[tree_dta$Code=='ACER.PEN'] = 'ACER.SAH'
tree_dta$Code[tree_dta$Code=='PRUN.PEN'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='PICE.ABI'] = 'PICE.GLA'
tree_dta$Code[tree_dta$Code=='SALI.SPP'] = 'POPU.BAL'
tree_dta$Code[tree_dta$Code=='LARI.SPP'] = 'LARI.LAR'
tree_dta$Code[tree_dta$Code=='AMEL.SPP'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='SORB.SPP'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='PRUN.VIR'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='ILEX.MUC'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='CRAT.SPP'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='MALU.SPP'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='QUER.SPP'] = 'QUER.RUB'
tree_dta$Code[tree_dta$Code=='ULMU.SPP'] = 'ULMU.AME'
tree_dta$Code[tree_dta$Code=='PINU.SYL'] = 'PINU.RES'
tree_dta$Code[tree_dta$Code=='JUGL.CIN'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='GLED.TRI'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='NEMO.MUC'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='ALNU.CRI'] = 'ALNU.RUB'
tree_dta$Code[tree_dta$Code=='ALNU.INC'] = 'ALNU.RUB'
tree_dta$Code[tree_dta$Code=='CORN.STO'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='SORB.AME'] = 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='SALI.BEB']= 'POPU.BAL'
tree_dta$Code[tree_dta$Code=='PICE.SPP']= 'PICE.SIT'
tree_dta$Code[tree_dta$Code=='BETU.NEO']= 'BETU.ALL'
tree_dta$Code[tree_dta$Code=='BETU.WIN']= 'BETU.ALL'
tree_dta$Code[tree_dta$Code=='POPU.SPP']= 'POPU.BAL'
tree_dta$Code[tree_dta$Code=='GENC.SPP']=  'UNKN.SWD'
tree_dta$Code[tree_dta$Code=='GENH.SPP']=  'UNKN.HWD'
tree_dta$Code[tree_dta$Code=='BETU.SPP']= 'BETU.PAP'
tree_dta$Code[tree_dta$Code=='BETU.OCC']= 'BETU.PAP'
tree_dta$Code[tree_dta$Code=='PICE.LUT']= 'PICE.SIT'
tree_dta$Code[tree_dta$Code=='TSUG.MER']= 'TSUG.HET'
tree_dta$Code[tree_dta$Code=='PINU.ALB']=  'PINU.CON'
tree_dta$Code[tree_dta$Code=='CHAM.NOO']=  'THUJ.PLI'
tree_dta$Code[tree_dta$Code=='TSUG.SPP']=  'TSUG.HET'
tree_dta$Code[tree_dta$Code=='PINU.MON']= 'PINU.STR'
tree_dta$Code[tree_dta$Code=='TAXU.BRE']= 'TSUG.HET'
tree_dta$Code[tree_dta$Code=='JUNI.SCO']= 'JUNI.VIR'
tree_dta$Code[tree_dta$Code=='PINU.PON']= 'PINU.CON'
tree_dta$Code[tree_dta$Code=='LARI.OCC']= 'LARI.LAR'
tree_dta$Code[tree_dta$Code=='LARI.LYA']= 'LARI.LAR'
tree_dta$Code[tree_dta$Code=='JUNI.SPP']= 'JUNI.VIR'
tree_dta$Code[tree_dta$Code=='ARBU.MEN']= 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='ABIE.GRA']= 'ABIE.AMA'
tree_dta$Code[tree_dta$Code=='PRUN.SPP']= 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='ACER.MAC']= 'ACER.SAC'
tree_dta$Code[tree_dta$Code=='SALI.SCO']= 'POPU.BAL'
tree_dta$Code[tree_dta$species_g=='SALI']= 'POPU.BAL'
tree_dta$Code[tree_dta$Code=='BETU.PUM']= 'BETU.PAP'
tree_dta$Code[tree_dta$Code=='CORY.COR']= 'UNKN.SPP'
tree_dta$Code[tree_dta$Code=='ACER.NEG']= 'ACER.SAC'
tree_dta$Code[tree_dta$Code=='ALNU.RUG']= 'ALNU.RUB'
tree_dta$Code[tree_dta$Code=='QUER.MAC']= 'QUER.ALB'
tree_dta$Code[tree_dta$Code=='AMEL.ALN']= 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='VIBU.SPP']= 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='ACER.SPP']= 'ACER.SAH'
tree_dta$Code[tree_dta$Code=='BETU.GLA']= 'BETU.PAP'
tree_dta$Code[tree_dta$Code=='ABIE.PIN']= 'ABIE.BAL'
tree_dta$Code[tree_dta$Code=='AMEL.LAE']= 'PRUN.SER'
tree_dta$Code[tree_dta$species_g=='AMEL']= 'PRUN.SER'
tree_dta$Code[tree_dta$species_g=='SHEP']= 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='ALNU.VIR']= 'ALNU.RUB'
tree_dta$Code[tree_dta$species_g=='SORB']= 'PRUN.SER'
tree_dta$Code[tree_dta$species_g=='CARY']= 'CARY.SPP'
tree_dta$Code[tree_dta$species_g=='RHAM']= 'PRUN.SER'
tree_dta$Code[tree_dta$species_g=='CARP']= 'FAGU.GRA'
tree_dta$Code[tree_dta$species_g=='CRAT']= 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='ACER.FRE']= 'ACER.RUB'
tree_dta$Code[tree_dta$species_g=='JUGL']= 'FRAX.NIG'
tree_dta$Code[tree_dta$species_g=='ULMU']= 'ULMU.AME'
tree_dta$Code[tree_dta$species_g=='POPU']= 'POPU.BAL'
tree_dta$Code[tree_dta$species_g=='LEDU']= 'UNKN.SPP'
tree_dta$Code[tree_dta$species_g=='TAXU']= 'TSUG.HET'
tree_dta$Code[tree_dta$species_g=='VIBU']= 'PRUN.SER'
tree_dta$Code[tree_dta$species_g=='SAMB']= 'PRUN.SER'
tree_dta$Code[tree_dta$species_g=='LONI']= 'UNKN.SPP'
tree_dta$Code[tree_dta$Code=='BETU.NAN']= 'BETU.ALL'
tree_dta$Code[tree_dta$Code=='ACER.CIR']= 'ACER.RUB'
tree_dta$Code[tree_dta$Code=='PINU.FLE']= 'PINU.CON'
tree_dta$Code[tree_dta$Code=='ABIE.PRO']= 'ABIE.LAS'
tree_dta$Code[tree_dta$species_g=='PRUN']= 'PRUN.SER'
tree_dta$Code[tree_dta$species_g=='MALU']= 'PRUN.SER'
tree_dta$Code[tree_dta$species_g=='MALU']= 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='QUER.ROB']= 'QUER.ALB'
tree_dta$Code[tree_dta$Code=='PINU.NIG']= 'PINU.RES'
tree_dta$Code[tree_dta$species_g=='CORN']= 'PRUN.SER'
tree_dta$Code[tree_dta$species_g=='LARI']= 'LARI.LAR'
tree_dta$Code[tree_dta$Code=='ABIE.BIF']= 'ABIE.LAS'
tree_dta$Code[tree_dta$Code=='QUER.SHU']= 'QUER.RUB'
tree_dta$Code[tree_dta$Code=='ACER.NIG']= 'ACER.SAC'
tree_dta$Code[tree_dta$species_g=='LIRI']= 'POPU.BAL'
tree_dta$Code[tree_dta$Code=='QUER.VEL']= 'QUER.RUB'
tree_dta$Code[tree_dta$species_g=='SASS']= 'TILI.AME'
tree_dta$Code[tree_dta$Code=='QUER.BIC']= 'QUER.ALB'
tree_dta$Code[tree_dta$species_g=='CELT']= 'PRUN.SER'
tree_dta$Code[tree_dta$Code=='QUER.MUE']= 'QUER.ALB'
tree_dta$Code[tree_dta$species_g=='MAGN']= 'POPU.BAL'
tree_dta$Code[tree_dta$species_g=='TILI']= 'TILI.AME'
tree_dta$Code[tree_dta$Code=='PINU.RIG']= 'PINU.BAN'
tree_dta$Code[tree_dta$Code=='PINU.SPP']= 'PINU.BAN'
tree_dta$Code[tree_dta$Code=='QUER.PAL']= 'QUER.RUB'
tree_dta$Code[tree_dta$species_g=='ROBI']= 'PRUN.SER'
tree_dta$Code[tree_dta$species_g=='CAST']= 'QUER.ALB'
tree_dta$Code[tree_dta$Code=='BETU.PEN']= 'BETU.PAP'
tree_dta$Code[tree_dta$species_g=='NYSS']= 'ACER.RUB'
tree_dta$Code[tree_dta$species_g=='PLAT']= 'ACER.SAC'
tree_dta$Code[tree_dta$species_g=='HAMA']= 'BETU.ALL'
tree_dta$Code[tree_dta$species_g=='RHUS']= 'PRUN.SER'


#### step 3: define functions to calculate AGB for tree with and without tree height   ####
# for species without a specific allometry or similar tree species with allometry is not found, below code use species code 'UNKN.SPP' meaning unknown species
get_agb = function(dbh, code){
  outs = tryCatch({
    AGB_LambertUngDBH(dbh, code)},error = function(e){
      code = 'UNKN.SPP'
      AGB_LambertUngDBH(dbh, code)
    })
  
  return(outs$Btotal)
}

get_agb_withHT = function(dbh, ht, code){
  outs = tryCatch({
    AGB_LambertUngDBHHT(dbh, ht, code)},error = function(e){
      code = 'UNKN.SPP'
      AGB_LambertUngDBHHT(dbh, ht, code)
    })
  
  return(outs$Btotal)
}


#### step 4: Calculate AGB for tree with and without tree height   ####

tree_dta1 = tree_dta[!is.na(tree_dta$height),]
tree_dta2 = tree_dta[is.na(tree_dta$height),]
dim(tree_dta1)
dim(tree_dta2)


library(dplyr)

agbs1 = mapply(get_agb_withHT, tree_dta1$dbh,tree_dta1$height, tree_dta1$Code)
agbs2 = mapply(get_agb, tree_dta2$dbh,  tree_dta2$Code)

tree_dta1$AGB = agbs1
tree_dta2$AGB = agbs2

tree_dta = rbind(tree_dta1, tree_dta2)
head(tree_dta)
write.csv(tree_dta,'All_tree_AGB.csv', row.names = F)
