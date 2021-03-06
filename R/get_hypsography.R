#'@title retrieve hypsography information
#'@description 
#'Retrieves hypsography information from glm_nml object or file.  \cr
#'Hypsography is the relationship between depth and area of a lake. 
#''Depth' is referenced from the lake surface and downward values are positive in meters. Areas are in square meters.
#'
#'@param glm_nml a nml (a list) for GLM config
#'@param file a string with the path to the GLM glm.nml file
#'@return glm_bth a data.frame with \code{depths} and \code{areas}
#'@keywords methods
#'@author
#'Jordan S. Read
#'@seealso \link{read_nml}, \link{get_nml_value}
#'@examples 
#'sim_folder <- run_example_sim(verbose = FALSE)
#'nml_file <- file.path(sim_folder, 'glm3.nml')
#'glm_nml <- read_nml(nml_file)
#'get_hypsography(glm_nml)
#'get_hypsography(file = nml_file)
#'@export
get_hypsography <- function(glm_nml, file){
  # if both are passed, glm_nml is used and 'file' is ignored
  if (missing(file) & missing(glm_nml)){stop('glm.nml file path OR glm_nml must be specified')}
  
  if (missing(glm_nml)){
    glm_nml <- read_nml(file)
  }
  
  
  heights	<-	get_nml_value(glm_nml,'H')
  max_elev  <-	max(heights)
  bthA	<-	rev(get_nml_value(glm_nml,'A')) # (As of GLMv2.0, nml has areas in m^2, no conversion needed)
  bthZ	<-	rev(max_elev-heights)
  glm_bth	<-	data.frame(bthZ,bthA)
  names(glm_bth)	<-	c("depths","areas")
  return(glm_bth)
}