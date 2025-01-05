# Usa la imagen base de Ubuntu
FROM ubuntu:22.04

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    python3-pip \
    python3-dev \
    build-essential \
    libmysqlclient-dev \
    curl

# Instalar nixpacks
RUN curl -sSL https://nixos.org/nix/install | sh

# Añadir el path de nixpacks
ENV PATH="/root/.nix-profile/bin:${PATH}"

# Copiar el archivo de configuración de nixpacks
COPY nixpacks.toml /app/nixpacks.toml

# Copiar el resto del código de tu proyecto
COPY . /app

# Instalar dependencias usando nixpacks
RUN nixpacks install

# Crear entorno virtual y activar
RUN python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install -r requirements.txt

# Exponer el puerto 8000
EXPOSE 8000

# Ejecutar la aplicación con gunicorn
CMD ["gunicorn", "pacific_dreams.wsgi"]
