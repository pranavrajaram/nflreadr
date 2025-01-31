% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_nflverse.R
\name{load_rosters}
\alias{load_rosters}
\title{Load Rosters}
\usage{
load_rosters(seasons = most_recent_season(roster = TRUE))
}
\arguments{
\item{seasons}{a numeric vector of seasons to return, defaults to returning
this year's data if it is March or later. If set to \code{TRUE}, will return all available data.}
}
\value{
A tibble of season-level roster data.
}
\description{
Load Rosters
}
\examples{
\donttest{
  load_rosters(2020)
}

}
\seealso{
\url{https://nflreadr.nflverse.com/articles/dictionary_rosters.html} for a web version of the data dictionary

\code{\link{dictionary_rosters}} for the data dictionary as a dataframe

Issues with this data should be filed here: \url{https://github.com/nflverse/nflverse-data}
}
