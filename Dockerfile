FROM rocker/shiny:4.3.2

# Instalar dependencias del sistema si las necesitas
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar paquetes de R que necesites
RUN R -e "install.packages(c('shiny', 'ggplot2'), repos='https://cloud.r-project.org/')"

# Copiar la aplicación
COPY app.R /srv/shiny-server/app/

# Exponer puerto
EXPOSE 3838

# Comando para ejecutar
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/app', host='0.0.0.0', port=3838)"]
