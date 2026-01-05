<img src="/static/logoHMB.png" alt="Logo" style="height: 5cm; width: 100%; object-fit: cover;">
# HackMyBugs
HackMyBugs, es una app web vulnerable para practicar tus conocimientos en Pentesting Web. Así como tu análisis lógico sobre los sistemas y estructuras web. [Descargar](https://github.com/infernoidpl4y/HackMyBugs/releases/tag/Updates)

## Como instalar:

### Docker:
```bash
docker build -t hackmybugs .
```
#### Ejecutar:
```bash
docker run -d -p 8001:8080 --name hackmybugs-container hackmybugs
```
### PowerShell(Como Admin):
```powershell
.\app.ps1
   O
.\app.exe
```

**Edita config.ini para cambiar IP o Puerto**



## Algunas de las vulnerabilidades presentes en HackMyBugs:
| Tipo | Severidad | Descripción |
|------|-----------|-------------|
| Command injection | 🔴 **Critical** | Ejecución de comandos del sistema operativo. |
| Privilege Escalation | 🔴 **Critical** | Elevación no autorizada de privilegios. |
| XSS stored | 🔴 **Critical** | Scripts maliciosos almacenados y ejecutados por otros usuarios. |
| Broken Access Control | 🟠 **High**-🔴 **Critical** | Fallos en controles de acceso. |
| XSS reflected | 🟠 **High** | Scripts reflejados inmediatamente en la respuesta. |
| CSRF | 🟠 **High** | Ejecutar acciones no autorizadas en nombre de usuarios autenticados. |
| IDOR | 🟡 **Medium**-🟠 **High** | Acceso no autorizado a objetos/data manipulando referencias |
| LFI | 🟡 **Medium** | Inclusión de archivos locales. |
| Path traversal | 🟡 **Medium** | Acceso a directorios fuera del raíz web mediante `../`. |
| Sensitive Data Exposure | ⚪ **Variable** | Exposición de información critica, su impacto depende de la info |
