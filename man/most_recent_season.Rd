% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{most_recent_season}
\alias{most_recent_season}
\title{Get Latest Season}
\usage{
most_recent_season(roster = FALSE)
}
\arguments{
\item{roster}{a TRUE/FALSE flag: if TRUE, returns the current year if March 1st or later. if FALSE, returns the current year if September 1st or later. Otherwise returns current year minus 1.}
}
\value{
season (a four digit numeric)
}
\description{
A helper function to choose the most recent season available for a given dataset
}
