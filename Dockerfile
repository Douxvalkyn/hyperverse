FROM rocker/r-ver:4.4

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev

RUN R -e "install.packages('nanonext', type='binary')"
RUN R -e "install.packages('mirai', type='binary')"
RUN R -e "install.packages(c('remotes', 'svglite', 'plumber2', 'htmxr'))"

COPY . /app
WORKDIR /app

EXPOSE 8080
CMD ["Rscript", "launch.R"]