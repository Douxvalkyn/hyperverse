library(plumber2)
library(htmxr)

Sys.setenv(PLUMBER2_HOST = "0.0.0.0")

port <- as.integer(Sys.getenv("PORT", "8080"))

plumber2::api("api.R", doc_type = "") |>
  hx_serve_assets() |>
  (\(pr) pr$ignite(host = "0.0.0.0", port = port, block = TRUE))()
