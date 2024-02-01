path_vect <- "/Users/fdzul/Library/CloudStorage/OneDrive-Personal/datasets/CENAPRECE/2023/31_yucatan"
path_coord <- paste(path_vect, "DescargaOvitrampasMesFco.txt", sep = "/")
library(magrittr)
library(sf)

deneggs::eggs_hotspots(path_lect = path_vect,
                       path_coord = path_coord,
                       locality = "Mérida",
                       cve_ent = "31",
                       fam = "zeroinflatednbinomial1",
                       k = 30,
                       plot = FALSE,
                       sem = 25, 
                       aproximation = "gaussian",
                       integration = "eb",
                       longitude  = "Pocision_X",
                       latitude =  "Pocision_Y",
                       var = "eggs",
                       alpha = 0.99,
                       cell_size = 2000,
                       palette_vir  = "magma",
                       leg_title = "Huevos",
                       hist_dataset = FALSE)$map
path_vect <- "/Users/fdzul/Library/CloudStorage/OneDrive-Personal/datasets/CENAPRECE/2023/14_jalisco"
path_coord <- paste(path_vect, "DescargaOvitrampasMesFco.txt", sep = "/")
deneggs::eggs_hotspots(path_lect = path_vect,
                       path_coord = path_coord,
                       locality = c("Zapopan", "Guadalajara", "Tlaquepaque", "Tonalá"),
                       cve_ent = "14",
                       fam = "zeroinflatednbinomial1",
                       k = 20,
                       plot = FALSE,
                       sem = 25, 
                       aproximation = "gaussian",
                       integration = "eb",
                       longitude  = "Pocision_X",
                       latitude =  "Pocision_Y",
                       var = "eggs",
                       alpha = 0.99,
                       cell_size = 2000,
                       palette_vir  = "magma",
                       leg_title = "Huevos",
                       hist_dataset = FALSE)$map

path_vect <- "/Users/fdzul/Library/CloudStorage/OneDrive-Personal/datasets/CENAPRECE/2023/30_veracruz"
path_coord <- paste(path_vect, "DescargaOvitrampasMesFco.txt", sep = "/")
deneggs::eggs_hotspots(path_lect = path_vect,
                       path_coord = path_coord,
                       locality = c("Veracruz", "Boca del Rio"),
                       cve_ent = "30",
                       fam = "zeroinflatednbinomial1",
                       k = 20,
                       plot = FALSE,
                       sem = 25, 
                       aproximation = "gaussian",
                       integration = "eb",
                       longitude  = "Pocision_X",
                       latitude =  "Pocision_Y",
                       var = "eggs",
                       alpha = 0.99,
                       cell_size = 2000,
                       palette_vir  = "magma",
                       leg_title = "Huevos",
                       hist_dataset = FALSE)$map

path_vect <- "/Users/fdzul/Library/CloudStorage/OneDrive-Personal/datasets/CENAPRECE/2023/23_quintana_roo"
path_coord <- paste(path_vect, "DescargaOvitrampasMesFco.txt", sep = "/")
library(INLA)
deneggs::eggs_hotspots(path_lect = path_vect,
                       path_coord = path_coord,
                       locality = "Cancun",
                       cve_ent = "23",
                       fam = "zeroinflatednbinomial1",
                       k = 20,
                       plot = FALSE,
                       sem = 25, 
                       aproximation = "gaussian",
                       integration = "eb",
                       longitude  = "Pocision_X",
                       latitude =  "Pocision_Y",
                       var = "eggs",
                       alpha = 0.99,
                       cell_size = 2000,
                       palette_vir  = "magma",
                       leg_title = "Huevos",
                       hist_dataset = FALSE)$map


