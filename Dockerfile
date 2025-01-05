FROM ghcr.io/railwayapp/nixpacks:ubuntu-1731369831

# Instalación de dependencias del sistema necesarias para mysqlclient
RUN apt-get update && apt-get install -y \
    libmysqlclient-dev \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Crear y activar el entorno virtual
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copiar los archivos del proyecto
COPY . /app/

# Instalar dependencias de Python
RUN pip install --no-cache-dir -r /app/requirements.txt

# Comando para iniciar la aplicación
CMD ["gunicorn", "pacific_dreams.wsgi"]