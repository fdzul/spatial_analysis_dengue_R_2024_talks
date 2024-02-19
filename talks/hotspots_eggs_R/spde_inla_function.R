path_ovitraps <- "/Users/fdzul/Library/CloudStorage/OneDrive-Personal/datasets/CENAPRECE/2023/14_jalisco"
path_coord <- paste(path_ovitraps,"DescargaOvitrampasMesFco.txt", sep = "/" )

x <- deneggs::spde_inla(path_lect = path_ovitraps,
                            cve_edo = "14",
                            locality  = c("Guadalajara", "Zapopan",
                                          "Tlaquepaque", "Tonalá"),
                            path_coord = path_coord,
                            aproximation = "gaussian",
                            integration = "eb",
                            fam = "zeroinflatednbinomial1",
                            k = 120,
                            palette_vir  = "magma",
                            leg_title = "Huevos",
                            plot = TRUE,
                            hist_dataset = FALSE,
                            weeks = 41,
                            cell_size = 2000,
                            alpha = .99)

head(x$hotspots)

ggplot2::ggplot() +
    inlabru::gg(x$mesh)  +
    ggspatial::annotation_scale(style = "ticks")
    
ggplot2::ggplot() +
    inlabru::gg(x$mesh) +
    ggplot2::geom_point(data = x$data,
                        ggplot2::aes(x = x$data$Pocision_X,
                                     y = x$data$Pocision_Y),
                        col = "red") +
    ggplot2::coord_sf(xlim = c(-103.30, -103.28),
                      ylim = c(20.60, 20.61)) +
    ggspatial::annotation_scale(style = "ticks")

