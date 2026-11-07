# Laboratorio de Recordatorios — Backend

Laboratorio de desarrollo e integración continua para una aplicación móvil de recordatorios. Este repositorio contiene la base del backend y las verificaciones de infraestructura local ejecutadas mediante GitHub Actions.

## Objetivo

Preparar y validar un entorno reproducible para desarrollar el servicio backend, comprobar la disponibilidad de PostgreSQL y verificar consultas SQL reales sin modificar los datos.

## Arquitectura del laboratorio

- **NestJS:** framework de Node.js para construir la API backend modular.
- **Flutter:** tecnología del cliente móvil, mantenido en el repositorio independiente `recordatorios-mobile`.
- **Docker Desktop + Ubuntu WSL2:** entorno local donde se ejecutan los contenedores y el runner self-hosted.
- **PostgreSQL 16:** base de datos del laboratorio, en el contenedor `recordatorios-postgres-lab`, perteneciente al proyecto Compose `recordatorios-lab`.
- **GitHub Actions:** automatización de verificaciones mediante el runner self-hosted Linux del repositorio backend.

## Servicios PostgreSQL

| Elemento | Valor |
|---|---|
| Contenedor | `recordatorios-postgres-lab` |
| Proyecto Compose | `recordatorios-lab` |
| Imagen | `postgres:16-alpine` |
| Base de datos | `recordatorios_db` |
| Usuario | `postgres` |
| Puerto publicado en Windows | `127.0.0.1:5544` |

Las comprobaciones SQL se ejecutan dentro del contenedor mediante `docker exec`; no requieren exponer puertos adicionales ni almacenar contraseñas en el repositorio.

## Workflows

- **01 - Verificar Docker PostgreSQL Local** (`.github/workflows/check-local-postgres.yml`): comprueba Docker, identidad Compose, estado del contenedor, healthcheck y disponibilidad de PostgreSQL.
- **02 - Verificar Conexion SQL PostgreSQL** (`.github/workflows/check-postgres.yml`): ejecuta una consulta SQL de solo lectura y valida la base de datos conectada.

Ambos workflows admiten ejecución manual y se disparan al publicar cambios en su propio archivo sobre la rama `main`.

## Seguridad y alcance

Las verificaciones son de solo lectura. No crean, detienen ni reinician contenedores; no escriben en la base de datos; no publican archivos `.env`; y no abren servicios a internet.
