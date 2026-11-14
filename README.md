# Mis Recordatorios — Backend
API NestJS + TypeORM + PostgreSQL 16.

## Requisitos
Node.js 20+, npm y el laboratorio Docker existente. No recrear contenedores.

## Windows
```powershell
npm ci
Copy-Item .env.example .env
# Edita DB_PASSWORD localmente; nunca publiques .env
npm run build
npm test
npm run start:dev
```
La conexión local utiliza 127.0.0.1:5544, base recordatorios_db, usuario postgres. El servidor escucha en 0.0.0.0:3000.

## API
- GET /health (independiente de PostgreSQL)
- GET /recordatorios y GET /recordatorios/:id
- POST /recordatorios, PATCH /recordatorios/:id, DELETE /recordatorios/:id
- Swagger: http://localhost:3000/docs

## Migración
TypeORM usa synchronize=false y migrationsRun=false. La migración versionada crea exclusivamente public.recordatorios y sus índices; no contiene DROP, TRUNCATE ni operaciones de recreación. Ejecutar manualmente el workflow **Aplicar migracion PostgreSQL local** tras revisar el destino. No se aplica al arrancar el servicio.
