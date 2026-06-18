install.packages("plumber2")
install.packages("remotes")
remotes::install_version("mirai", version = "2.6.1")
install.packages("htmxr")

library(htmxr)
htmxr::hx_run_example("hello")


library(plumber2)

pr <- plumber2::api("api.R", doc_type = "") |>
  hx_serve_assets()

pr$ignite(port = port, block = TRUE)
