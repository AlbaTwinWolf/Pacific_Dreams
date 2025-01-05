# Usa la imagen base de nixpacks
FROM ghcr.io/railwayapp/nixpacks:ubuntu-1731369831

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo de configuración de nixpacks
COPY nixpacks.toml /app/nixpacks.toml

# Copia el resto del código de tu proyecto
COPY . /app

# Instala las dependencias necesarias
RUN nixpacks install

# Crear un entorno virtual y activar el entorno
RUN python -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install -r requirements.txt

# Exponer el puerto 8000
EXPOSE 8000

# Ejecuta la aplicación con gunicorn
CMD ["gunicorn", "pacific_dreams.wsgi"]
