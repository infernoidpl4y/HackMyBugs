FROM mcr.microsoft.com/powershell:7.4-ubuntu-22.04

# Copiar TODO tu proyecto
COPY . /app

# Establecer directorio de trabajo
WORKDIR /app

# No necesitas instalar Pode porque ya está en tu proyecto
# Solo necesitas importarlo desde la carpeta local

# Exponer puerto
EXPOSE 8080

# Comando para ejecutar
CMD ["pwsh", "-File", "/app/app.ps1"]
