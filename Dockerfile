FROM rocker/r-ver:4.4

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev

RUN R -e "install.packages(c('remotes', 'svglite', 'plumber2', 'htmxr'))"

COPY . /app
WORKDIR /app

EXPOSE 8080
CMD ["Rscript", "-e", "\
  library(plumber2); \
  library(htmxr); \
  plumber2::api('api.R', doc_type='') |> \
  hx_serve_assets() |> \
  (\\(pr) pr$ignite(host='0.0.0.0', port=8080,