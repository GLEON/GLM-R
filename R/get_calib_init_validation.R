#'@title Get last values from a calibration period to be used for the validation
#'
#'@description Reads in nml-file and output from calibration to get initial values for the calibration
#'@param file_name String of the GLM namelist file, in most cases this is 'glm3.nml'
#'@param output String of the file path in which the output.nc file is stored (created by calibration period)
#'@keywords methods
#'@seealso \code{\link{get_calib_setup}, \link{get_calib_periods}, \link{calibrate_sim}}
#'@author
#'Robert Ladwig
#'
#'@examples
#'nc_file <- system.file("extdata", "output/output.nc", package = "glmtools")
#'nml_file <- system.file("extdata", "glm3.nml", package = "glmtools")
#'initvalues <- get_calib_init_validation(file_name = nml_file, output = nc_file)
#'@export
get_calib_init_validation <- function(file_name, output){
  nml <- read_nml(file_name)
  temps <- get_var(file = output, reference = 'surface', var_name = 'temp', z_out = nml$init_profiles$the_depths, t_out = nml$time$stop)
  nml <- set_nml(nml, arg_list = list('the_temps' = as.double(temps[-1])))
  write_nml(nml,file_name)
  return()
}
