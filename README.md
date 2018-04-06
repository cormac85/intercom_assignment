# intercom_assignment
This package is a solution to an assignment provided by Intercom as part of the recruitment process.
It's main purpose is to calculate a list of customers, stored in JSON format, that are within a distance of a certain point.

The package is tested and documented using the testthat and roxygen2.

## Installation
Use the usual `devtools::install_github("cormac85/intercom_assignment")` to install.

## Usage
Two functions are exported, `calculate_gcd()` and `get_customers_within_distance()` which will calculate a great circle distance 
between coordinates, and gets the list of customers close to a certain point, respectively.

To use this function on `customers.txt`, you will need to have it and another file which 
contains a list of "campus locations" from which the customer distance can be calculated.

    intercom::get_customers_within_distance("./path_to_data/customers.txt", 100, "./path_to_data/intercom_locations.csv", "Intercom Dublin HQ")
    
The file "intercom_locations.csv" should contain a .csv with 3 variables, "name", "latitude","longitude" as follows:
    
    "name","latitude","longitude"
    "Intercom Dublin HQ",53.339428,-6.257664

For more details, use `?get_customers_within_distance` on the R command line.
