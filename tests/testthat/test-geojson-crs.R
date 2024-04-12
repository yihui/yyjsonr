

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Prep data
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
filename_epsg_3857_geojson <- testthat::test_path("geojson/nc-epsg-3857.geojson")
filename_epsg_3857_sf      <- testthat::test_path("geojson/nc-epsg-3857.sf")

# library("sf")
# nc <- read_sf(system.file("shape/nc.shp", package = "sf"))
# nc <- st_transform(nc, "EPSG:3857")
# write_sf(nc, filename_epsg_3857_geojson)
# saveRDS (nc, filename_epsg_3857_sf)


test_that("multiplication works", {
  
  # CRS matches how 'sf' reads it
  ref  <- readRDS(filename_epsg_3857_sf)
  geo1 <- read_geojson_file(filename_epsg_3857_geojson)
  expect_equal(geo1, ref, ignore_attr = TRUE)
  expect_equal(geo1, ref)
  
  # Round trip write/read does not lose CRS info
  tmp <- tempfile()
  write_geojson_file(geo1, tmp)
  geo2 <- read_geojson_file(tmp)
  expect_equal(geo2, geo1)
  
  # x = read_sf("test1.geojson")
  # st_crs(x)$epsg
  # #> [1] 3857
  # y = read_geojson_file("test2.geojson")
  # st_crs(y)$epsg
  # #> [1] 4326
  
  
})
