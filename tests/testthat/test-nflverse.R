test_that("load_pbp", {

  skip_on_cran()
  skip_if_offline("github.com")

  pbp <- load_pbp()
  pbp_years <- load_pbp(2019:2020)
  pbp_rds <- load_pbp(2019:2020, file_type = "rds")

  expect_s3_class(pbp, "tbl_df")
  expect_s3_class(pbp_rds, "tbl_df")
  expect_s3_class(pbp_years, "tbl_df")

  expect_gt(nrow(pbp_years), 90000)
  expect_gt(nrow(pbp_rds), 90000)
})

test_that("load_player_stats", {

  skip_on_cran()
  skip_if_offline("github.com")

  ps <- load_player_stats()
  ps_2020 <- load_player_stats(2020,stat_type = "offense")
  ps_rds <- load_player_stats(2020, file_type = "rds")
  ps_all <- load_player_stats(seasons = TRUE)

  kick <- load_player_stats(2020, stat_type = "kicking")

  expect_s3_class(ps, "tbl_df")
  expect_s3_class(ps_2020, "tbl_df")
  expect_s3_class(ps_rds, "tbl_df")
  expect_s3_class(ps_all, "tbl_df")
  expect_s3_class(kick, "tbl_df")

  expect_gt(nrow(ps_2020), 5000)
  expect_gt(nrow(ps_rds), 5000)
  expect_gt(nrow(ps_all), 110000)
  expect_gt(nrow(kick), 500)
})

test_that("load_schedules", {

  skip_on_cran()
  skip_if_offline("github.com")

  schedules <- load_schedules()

  expect_s3_class(schedules, "tbl_df")

  expect_gt(nrow(schedules), 6000)

  expect_error(load_schedules("2020"))

  sched_2020 <- load_schedules(2020)

  expect_s3_class(schedules, "tbl_df")

  expect_lte(nrow(sched_2020), 269)
})

test_that("load_rosters", {

  skip_on_cran()
  skip_if_offline("github.com")

  rosters <- load_rosters()
  rosters_years <- load_rosters(seasons = 2019:2020)
  rosters_all <- load_rosters(seasons = TRUE)

  expect_s3_class(rosters, "tbl_df")
  expect_s3_class(rosters_years, "tbl_df")
  expect_s3_class(rosters_all, "tbl_df")
  expect_gt(nrow(rosters_years), 7000)
  expect_gt(nrow(rosters_all), 60000)
})

test_that("load_ngs", {

  skip_on_cran()
  skip_if_offline("github.com")

  ngs_passing <- load_nextgen_stats()
  ngs_receiving <- load_nextgen_stats(seasons = 2019:2020, stat_type = "receiving", file_type = "rds")
  ngs_rushing <- load_nextgen_stats(seasons = 2020, stat_type = "rushing")

  expect_s3_class(ngs_passing, "tbl_df")
  expect_s3_class(ngs_receiving, "tbl_df")
  expect_s3_class(ngs_rushing, "tbl_df")

  expect_gt(nrow(ngs_receiving), 1500)
  expect_gt(nrow(ngs_rushing), 500)
})

test_that("load_teams", {

  skip_on_cran()
  skip_if_offline("github.com")

  team_graphics <- load_teams()

  expect_s3_class(team_graphics, "tbl_df")

  expect_gte(nrow(team_graphics), 32)
})

test_that("Cache clearing works",{

  skip_on_cran()
  skip_if_offline("github.com")

  rds_from_url("https://raw.githubusercontent.com/nflverse/nfldata/master/data/draft_picks.rds")

  expect(memoise::has_cache(rds_from_url)("https://raw.githubusercontent.com/nflverse/nfldata/master/data/draft_picks.rds"), "Function was not memoised!")

  expect_message(.clear_cache(), "nflreadr function cache cleared!")

  expect(!memoise::has_cache(rds_from_url)("https://raw.githubusercontent.com/nflverse/nfldata/master/data/draft_picks.rds"), "Cache was not cleared!")
})

test_that("load_depth_charts", {

  skip_on_cran()
  skip_if_offline("github.com")

  depth_charts <- load_depth_charts()
  depth_charts_years <- load_depth_charts(seasons = 2019:2020)

  expect_s3_class(depth_charts, "tbl_df")
  expect_s3_class(depth_charts_years, "tbl_df")
  expect_gt(nrow(depth_charts_years), 60000)
  })

test_that("load_injuries", {

  skip_on_cran()
  skip_if_offline("github.com")

  injuries <- load_injuries()
  injuries_years <- load_injuries(seasons = 2019:2020)
  injuries_all <- load_injuries(seasons = TRUE)

  expect_s3_class(injuries, "tbl_df")
  expect_s3_class(injuries_years, "tbl_df")
  expect_s3_class(injuries_all, "tbl_df")
  expect_gt(nrow(injuries_years), 8000)
  expect_gt(nrow(injuries_all), 60000)
})

test_that("load_espn_qbr", {

  skip_on_cran()
  skip_if_offline("github.com")

  qbr_default <- load_espn_qbr()
  qbr_nfl_weekly <- load_espn_qbr(league = "nfl", seasons = TRUE, summary_type = "weekly")
  qbr_cfb_season <- load_espn_qbr(league = "college", seasons = 2019:2020)

  expect_s3_class(qbr_default, "tbl_df")
  expect_s3_class(qbr_nfl_weekly, "tbl_df")
  expect_s3_class(qbr_cfb_season, "tbl_df")
  # expect_gt(nrow(qbr_default), 30)
  expect_gt(nrow(qbr_nfl_weekly), 7500)
  expect_gt(nrow(qbr_cfb_season), 200)
})

test_that("load_trades", {

  skip_on_cran()
  skip_if_offline("github.com")

  trades <- load_trades()
  trades_2020 <- load_trades(seasons = 2020)

  expect_s3_class(trades, "tbl_df")
  expect_s3_class(trades_2020, "tbl_df")

  expect_gt(nrow(trades), 3000)
  expect_lte(nrow(trades_2020), 215)

  expect_error(load_trades("2020"))
})

test_that("load_draft_picks", {

  skip_on_cran()
  skip_if_offline("github.com")

  picks <- load_draft_picks()
  picks_2020 <- load_draft_picks(2020)

  expect_s3_class(picks, "tbl_df")
  expect_s3_class(picks_2020, "tbl_df")

  expect_gt(nrow(picks), 10000)
  expect_lt(nrow(picks_2020), 260)

  expect_error(load_draft_picks("2020"))
})

test_that("load_combine", {

  skip_on_cran()
  skip_if_offline("github.com")

  combine <- load_combine()
  combine_2020 <- load_combine(2020)

  expect_s3_class(combine, "tbl_df")
  expect_s3_class(combine_2020, "tbl_df")

  expect_gt(nrow(combine), 7000)
  expect_gte(nrow(combine_2020), 337)

  expect_error(load_combine("2020"))
})

test_that("load_pfr_passing", {

  skip_on_cran()
  skip_if_offline("github.com")

  expect_warning(passing <- load_pfr_passing())

  expect_s3_class(passing, "tbl_df")

  expect_gt(nrow(passing), 200)
})

test_that("load_pfr_advstats", {

  skip_on_cran()
  skip_if_offline("github.com")

  expect_error(load_pfr_advstats("2020"))

  pass <- load_pfr_advstats(seasons = 2020, stat_type = "pass")
  rush <- load_pfr_advstats(seasons = TRUE, stat_type = "rush")
  def <- load_pfr_advstats(seasons = TRUE, stat_type = "def", summary_level = "season")

  expect_s3_class(pass, "tbl_df")
  expect_s3_class(rush, "tbl_df")

  expect_gt(nrow(pass), 600)
  expect_gt(nrow(rush), 5000)
})

test_that("load_snap_counts", {

  skip_on_cran()
  skip_if_offline("github.com")

  expect_error(load_snap_counts("2020"))

  counts <- load_snap_counts(2020)

  expect_s3_class(counts, "tbl_df")

  expect_gt(nrow(counts), 20000)
})

