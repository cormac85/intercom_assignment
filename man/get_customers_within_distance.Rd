% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_customers_within_distance.R
\name{get_customers_within_distance}
\alias{get_customers_within_distance}
\title{Get Sorted List of Customers Within Distance to Campus Location}
\usage{
get_customers_within_distance(customers_path, cutoff_distance,
  intercom_locations_path, intercom_location_name)
}
\arguments{
\item{customers_path}{Path to customer list in JSON format.}

\item{cutoff_distance}{Max distance in km to customers.}

\item{intercom_locations_path}{Path to list of Intercom locations in .csv format}
}
\value{
A data frame with \code{name} and \code{user_id} of those
customers that are within 100 km of the Intercom Dublin Campus, sorted
by \code{user_id}
}
\description{
Get Sorted List of Customers Within Distance to Campus Location
}
\examples{
get_customers_within_distance("./path_to_customers.json", cutoff_distance,
                              "./path_to_campus_locations.csv")
}
