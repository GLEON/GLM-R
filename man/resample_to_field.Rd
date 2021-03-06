% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/resample_to_field.R
\name{resample_to_field}
\alias{resample_to_field}
\title{Match GLM water temperatures with field observations}
\usage{
resample_to_field(
  nc_file,
  field_file,
  method = "match",
  precision = "hours",
  var_name = "temp"
)
}
\arguments{
\item{nc_file}{a string with the path to the netcdf output from GLM}

\item{field_file}{a string with the path to the field observation file}

\item{method}{'match' for exact match or 'interp' for temporal interpolation}

\item{precision}{matching precision (must be 'secs', 'mins','hours', or 'days')}

\item{var_name}{Name of variable to look for in field_obs file. 
Should match a GLM simulation variable (see output from \code{\link{sim_vars}}).}
}
\value{
validation a data.frame with DateTime and temperature at depth
}
\description{
Match GLM water temperatures with field observations
}
\examples{
nc_file <- system.file("extdata", "output/output.nc", package = "glmtools")
field_file <- system.file("extdata", "LakeMendota_field_data_hours.csv", package = "glmtools")
temps <- resample_to_field(nc_file, field_file)

buoy_file <- system.file('extdata', 'LakeMendota_buoy_data.csv', package = 'glmtools')
temps <- resample_to_field(nc_file, buoy_file)
}
\seealso{
\link{resample_sim}, \link{get_temp}
}
\author{
Jordan S. Read
}
\keyword{methods}
