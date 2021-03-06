## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE, eval = FALSE, comment = "#>", collapse = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  ## search for 18000 tweets using the rstats hashtag
#  rt <- search_tweets(
#    "#rstats", n = 18000, include_rts = FALSE
#  )
#  
#  ## preview tweets data
#  rt
#  
#  ## preview users data
#  users_data(rt)
#  
#  ## plot time series (if ggplot2 is installed)
#  ts_plot(rt)

## ---- eval=FALSE---------------------------------------------------------
#  ## plot time series of tweets
#  ts_plot(rt, "3 hours") +
#    ggplot2::theme_minimal() +
#    ggplot2::theme(plot.title = ggplot2::element_text(face = "bold")) +
#    ggplot2::labs(
#      x = NULL, y = NULL,
#      title = "Frequency of #rstats Twitter statuses from past 9 days",
#      subtitle = "Twitter status (tweet) counts aggregated using three-hour intervals",
#      caption = "\nSource: Data collected from Twitter's REST API via rtweet"
#    )

## ---- eval=FALSE---------------------------------------------------------
#  ## search for 250,000 tweets containing the word data
#  rt <- search_tweets(
#    "data", n = 250000, retryonratelimit = TRUE
#  )

## ---- eval=FALSE---------------------------------------------------------
#  ## search for 10,000 tweets sent from the US
#  rt <- search_tweets(
#    "lang:en", geocode = lookup_coords("usa"), n = 10000
#  )
#  
#  ## create lat/lng variables using all available tweet and profile geo-location data
#  rt <- lat_lng(rt)
#  
#  ## plot state boundaries
#  par(mar = c(0, 0, 0, 0))
#  maps::map("state", lwd = .25)
#  
#  ## plot lat and lng points onto state map
#  with(rt, points(lng, lat, pch = 20, cex = .75, col = rgb(0, .3, .7, .75)))

## ---- eval=FALSE---------------------------------------------------------
#  ## random sample for 30 seconds (default)
#  rt <- stream_tweets("")

## ---- eval=FALSE---------------------------------------------------------
#  ## stream tweets from london for 60 seconds
#  rt <- stream_tweets(lookup_coords("london, uk"), timeout = 60)

## ---- eval=FALSE---------------------------------------------------------
#  ## stream london tweets for a week (60 secs x 60 mins * 24 hours *  7 days)
#  stream_tweets(
#    "realdonaldtrump,trump",
#    timeout = 60 * 60 * 24 * 7,
#    file_name = "tweetsabouttrump.json",
#    parse = FALSE
#  )
#  
#  ## read in the data as a tidy tbl data frame
#  djt <- parse_stream("tweetsabouttrump.json")

## ---- eval=FALSE---------------------------------------------------------
#  ## get user IDs of accounts followed by CNN
#  cnn_fds <- get_friends("cnn")
#  
#  ## lookup data on those accounts
#  cnn_fds_data <- lookup_users(cnn_fds$user_id)

## ---- eval=FALSE---------------------------------------------------------
#  ## get user IDs of accounts following CNN
#  cnn_flw <- get_followers("cnn", n = 75000)
#  
#  ## lookup data on those accounts
#  cnn_flw_data <- lookup_users(cnn_flw$user_id)

## ---- eval=FALSE---------------------------------------------------------
#  ## how many total follows does cnn have?
#  cnn <- lookup_users("cnn")
#  
#  ## get them all (this would take a little over 5 days)
#  cnn_flw <- get_followers(
#    "cnn", n = cnn$followers_count, retryonratelimit = TRUE
#  )

## ---- eval=FALSE---------------------------------------------------------
#  ## get user IDs of accounts followed by CNN
#  tmls <- get_timelines(c("cnn", "BBCWorld", "foxnews"), n = 3200)
#  
#  ## plot the frequency of tweets for each user over time
#  tmls %>%
#    dplyr::filter(created_at > "2017-10-29") %>%
#    dplyr::group_by(screen_name) %>%
#    ts_plot("days", trim = 1L) +
#    ggplot2::geom_point() +
#    ggplot2::theme_minimal() +
#    ggplot2::theme(
#      legend.title = ggplot2::element_blank(),
#      legend.position = "bottom",
#      plot.title = ggplot2::element_text(face = "bold")) +
#    ggplot2::labs(
#      x = NULL, y = NULL,
#      title = "Frequency of Twitter statuses posted by news organization",
#      subtitle = "Twitter status (tweet) counts aggregated by day from October/November 2017",
#      caption = "\nSource: Data collected from Twitter's REST API via rtweet"
#    )

## ---- eval=FALSE---------------------------------------------------------
#  jkr <- get_favorites("jk_rowling", n = 3000)

## ---- eval=FALSE---------------------------------------------------------
#  ## search for users with #rstats in their profiles
#  usrs <- search_users("#rstats", n = 1000)

## ---- eval=FALSE---------------------------------------------------------
#  sf <- get_trends("san francisco")

## ---- eval=FALSE---------------------------------------------------------
#  ## lookup users by screen_name or user_id
#  users <- c("KimKardashian", "justinbieber", "taylorswift13",
#             "espn", "JoelEmbiid", "cstonehoops", "KUHoops",
#             "upshotnyt", "fivethirtyeight", "hadleywickham",
#             "cnn", "foxnews", "msnbc", "maddow", "seanhannity",
#             "potus", "epa", "hillaryclinton", "realdonaldtrump",
#             "natesilver538", "ezraklein", "annecoulter")
#  famous_tweeters <- lookup_users(users)
#  
#  ## preview users data
#  famous_tweeters
#  
#  # extract most recent tweets data from the famous tweeters
#  tweets_data(famous_tweeters)

## ---- eval=FALSE---------------------------------------------------------
#  post_tweet("my first rtweet #rstats")

## ---- eval=FALSE---------------------------------------------------------
#  ## ty for the follow ;)
#  post_follow("kearneymw")

