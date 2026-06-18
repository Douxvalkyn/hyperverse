FROM rocker/r-ver:4.4

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev

# cache bust: 2
RUN R -e "install.packages('plumber2', dependencies=TRUE)"
RUN R -e "install.packages(c('remotes', 'svglite', 'htmxr'), dependencies=TRUE)"
RUN R -e "library(plumber2); cat('plumber2 OK\n')"

COPY . /app
WORKDIR /app

EXPOSE 8080
CMD ["Rscript", "launch.R"]