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
    libmysqlclient-dev  # Esto es necesario para mysqlclient

# Copiar los archivos de tu aplicación al contenedor
COPY . .

# Instalar las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Instalar gunicorn
RUN pip install gunicorn

# Ejecutar la aplicación con gunicorn (ajusta el nombre del archivo wsgi.py si es necesario)
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
