library(gganimate) # thomasp85/gganimate
library(cartogram)
library(geogrid) # Need github version jbaileyh/geogrid
library(rnaturalearth)
library(sf)
library(scico)

us <- ne_states('united states of america', returnclass = 'sf')
us <- us[!us$woe_name %in% c('Alaska', 'Hawaii'), ]
us <- st_transform(us, '+proj=eqdc +lat_0=39 +lon_0=-96 +lat_1=33 +lat_2=45 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs')
# Population data from https://www.census.gov/data/tables/2017/demo/popest/state-total.html
pop <- read.csv('PEP_2017_PEPANNRES_with_ann.csv', header = TRUE, skip = 1, check.names = FALSE)
us$pop <- pop[match(us$name, pop$Geography), ncol(pop)]

us_ca <- cartogram_cont(us, 'pop')
us_hex <- calculate_grid(shape = us, grid_type = "hexagonal", seed = 1)
us_hex <- assign_polygons(us, us_hex)
us_sq <- calculate_grid(shape = us, grid_type = "regular", seed = 13)
us_sq <- assign_polygons(us, us_sq)

types <- c(
  'Original',
  'Cartogram Weigted by Population',
  'Hexagonal Tiling',
  'Square Tiling'
)
us$type <- types[1]
us_ca$type <- types[2]
us_hex$type <- types[3]
us_sq$type <- types[4]
us_all <- rbind(us, us_hex[, names(us)], us_ca[, names(us)], us_sq[, names(us)])
us_all$type <- factor(us_all$type, levels = types)

ggplot(us_all) + 
  geom_sf(aes(fill = pop, group = name)) + 
  scale_fill_scico(palette = 'lapaz') + 
  coord_sf(datum = NA) +
  theme_void() + 
  theme(legend.position = 'bottom', 
        legend.text = element_text(angle = 30, hjust = 1)) + 
  labs(title = 'Showing {closest_state}', 
       fill = 'Population') +
  transition_states(type, 2, 1)
  
