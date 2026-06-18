FROM rocker/r-ver:4.4.3

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev

# cache bust: 2
RUN R -e "options(repos = c(CRAN = 'https://cran.r-project.org')); install.packages(c('svglite', 'plumber2', 'htmxr'), dependencies=TRUE)"


COPY . /app
WORKDIR /app

EXPOSE 8080
CMD ["Rscript", "launch.R"]