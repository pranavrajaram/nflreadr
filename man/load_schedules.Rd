% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_nflverse.R
\name{load_schedules}
\alias{load_schedules}
\title{Load Game/Schedule Data}
\usage{
load_schedules(seasons = TRUE)
}
\arguments{
\item{seasons}{a numeric vector of seasons to return, default \code{TRUE} returns all available data.}
}
\value{
A tibble of game information for past and/or future games.
}
\description{
This returns game/schedule information as maintained by Lee Sharpe.
}
\examples{
\donttest{
 load_schedules(2020)
}

}
\seealso{
\url{https://nflreadr.nflverse.com/articles/dictionary_schedules.html} for a web version of the data dictionary

\code{\link{dictionary_schedules}} for the data dictionary as a dataframe

Issues with this data should be filed here: \url{https://github.com/nflverse/nfldata}
}
