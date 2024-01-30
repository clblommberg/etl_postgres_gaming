#!/bin/bash

# Nombre del contenedor PostgreSQL
POSTGRES_CONTAINER=db-temp

# Ruta del directorio de datos de PostgreSQL dentro del contenedor
POSTGRES_DATADIR=/var/lib/postgresql/data

# Directorio local que contiene los archivos .csv
LOCAL_CSV_DIR=datasets/Gaming

# Nombre de la base de datos en PostgreSQL
POSTGRES_DB=postgres

# Usuario y contraseña de PostgreSQL
POSTGRES_USER=example
POSTGRES_PASSWORD=example

# Recorrer todos los archivos .csv en el directorio local y copiarlos al directorio de datos de PostgreSQL en el contenedor
for file in "$LOCAL_CSV_DIR"/*.csv; do
    # Extraer el nombre del archivo (sin la ruta)
    filename=$(basename "$file")
    
    # Copiar el archivo al directorio de datos de PostgreSQL en el contenedor
    docker cp "$file" "$POSTGRES_CONTAINER":"$POSTGRES_DATADIR"/"$filename"
done
