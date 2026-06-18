FROM rocker/verse:4.4.3

# cache bust: 11
RUN R -e " \
  options(repos = c(CRAN = 'https://packagemanager.posit.co/cran/__linux__/noble/latest')); \
  install.packages(c('svglite', 'plumber2', 'htmxr'), \
  dependencies = TRUE) \
"

COPY . /app
WORKDIR /app

EXPOSE 8080
CMD ["Rscript", "launch.R"]