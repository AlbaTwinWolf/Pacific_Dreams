# Usar una imagen base de Ubuntu
FROM ubuntu:22.04

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Instalar dependencias del sistema (incluyendo Python y pip)
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    build-essential \
    python3.10-dev \
    python3-pip \
    python3-venv \
    ca-certificates \
    libssl-dev \
    libffi-dev \
    pkg-config \
    libmysqlclient-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiar los archivos de tu aplicación al contenedor
COPY . .

# Crear un entorno virtual y activar
RUN python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install gunicorn

# Configurar PATH para el entorno virtual
ENV PATH="/opt/venv/bin:$PATH"

# Ejecutar la aplicación con gunicorn
CMD ["gunicorn", "pacific_dreams.wsgi:application", "--bind", "0.0.0.0:8000"]