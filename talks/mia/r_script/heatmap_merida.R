

# Step 1. load the dengue dataset geocoded ####
load("/Users/fdzul/Library/CloudStorage/OneDrive-Personal/proyects/geocoding_mex/2024/8.RData/denmex_2024.RData")


########
densnv::mp_heatmap(locality = "Merida",
                   cve_edo = "31",
                   geocoded_datasets = z,
                   zoom = 12,
                   status_caso = c(1, 2),
                   week = c(1:6),
                   alpha = 0.3,
                   static = TRUE,
                   map_type = "terrain") +
    ggplot2::ggtitle("Semana Epidemiológica 1-6",
                     subtitle = "Probables & Confirmados")


###
path_ovitraps <- "/Users/fdzul/Library/CloudStorage/OneDrive-Personal/datasets/CENAPRECE/2024/31_yucatan"
path_coord <- paste(path_ovitraps,"DescargaOvitrampasMesFco.txt", sep = "/" )
x <- deneggs::eggs_hotspots(path_lect = path_ovitraps,
                            cve_ent = "31",
                            locality  = "Mérida",
                            path_coord = path_coord,
                            longitude  = "Pocision_X",
                            latitude =  "Pocision_Y",
                            aproximation = "gaussian",
                            integration = "eb",
                            fam = "zeroinflatednbinomial1",
                            k = 80,
                            palette_vir  = "viridis",
                            leg_title = "Huevos",
                            plot = FALSE,
                            hist_dataset = FALSE,
                            sem = 4,
                            var = "eggs",
                            cell_size = 3000,
                            alpha = .99)

#
# Step 1. transform dataset #####
w <- z |>
    dplyr::filter(ESTATUS_CASO %in% c(1, 2)) |>
    dplyr::mutate(x = long,
                  y = lat) |>
    sf::st_as_sf(coords = c("long", "lat"),
                 crs = 4326)

# Step 2. extract the locality ####
locality <- rgeomex::extract_locality(cve_edo = "31",
                                      locality = "Merida")

# Step 3. extract the geocoded cases of merida ####
w <- w[locality, ]  |>
    #sf::st_drop_geometry() |>
    dplyr::filter(SEM %in% c(1:6))

    
x$map +
    ggnewscale::new_scale_fill() +
    ggplot2::stat_density_2d(data = w,
                             ggplot2::aes(x = x,
                                          y = y),
                             geom = "density_2d", #"polygon",
                             col = "white", # "#E01E5A"
                             lwd = 0.3,
                             alpha = 0.7) +
    ggplot2::geom_point(data = w |>
                            dplyr::filter(ESTATUS_CASO %in% c(1, 2)), 
                        ggplot2::aes(x = x,
                                     y = y),
                        alpha = 0.3,
                        col = "#E01E5A") +
    ggplot2::theme(legend.position = "none")
