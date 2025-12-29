
FROM mcr.microsoft.com/powershell:7.4-ubuntu-22.04

WORKDIR /app

COPY . .

ENV PORT=8001


CMD ["pwsh", "-File", "/app/app.ps1"]
