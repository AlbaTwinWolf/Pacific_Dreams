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

# Copiar y ejecutar el script de instalación de Nix (ya está instalado en tu máquina local)
RUN curl -sSL https://nixos.org/nix/install | sh

# Establecer las variables de entorno de Nix para usar en el contenedor
ENV NIX_PATH=/home/alba/.nix-profile/etc/profile.d/nix.sh
RUN . /home/alba/.nix-profile/etc/profile.d/nix.sh

# Instalar cualquier otra dependencia con Nix
RUN nix-env -iA nixpkgs.python3

# Ejecutar el contenedor con el ambiente configurado
CMD ["bash"]