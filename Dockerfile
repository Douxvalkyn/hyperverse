FROM rocker/r-ver:4.4

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev

RUN R -e "install.packages(c('remotes'))"
RUN R -e "remotes::install_github('https://github.com/posit-dev/plumber2')"
RUN R -e "install.packages(c('svglite', 'htmxr'))"

COPY . /app
WORKDIR /app

EXPOSE 8080
CMD ["Rscript", "launch.R"]