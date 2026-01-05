# ![Logo]([https://fileport.io/an9NXzKJWCtF](https://fileport.io/get/1r7o1JePhvC1L_7DLfFOLACdS-CDIghrL_2uslCIQ3EMBdYcGguNJWbwUdq_Y5xfIVoTBZzSjxuDsw7RLdrjrlg9X0goUyvNaNz1teX8QFqvKpyif01nMMK1v8zfde5ClKAzE09ILelfhNiFZtSCuM5cqeVChMNe1sW60nuV98oBfwHdasAHbjR7zPEE5dg2wIF0AWn6a6MqQV5ImjPWiTWQ8zIV_HtWEMxEPol_xt-u21HPFnb7yuKP2L_lI_2gk))HackMyBugs
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
