# Usar una imagen base de Ubuntu
FROM ubuntu:22.04

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar los archivos de tu aplicación al contenedor
COPY . .

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    build-essential \
    python3.10-dev \
    python3-pip \
    python3-venv \
    ca-certificates \
    libssl-dev \
    libffi-dev

# Ejecutar el contenedor con el ambiente configurado
CMD ["bash"]