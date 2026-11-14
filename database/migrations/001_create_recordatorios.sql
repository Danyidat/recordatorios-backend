BEGIN;
CREATE TABLE IF NOT EXISTS public.recordatorios(id UUID PRIMARY KEY DEFAULT gen_random_uuid(),titulo VARCHAR(150) NOT NULL,descripcion TEXT NULL,fecha_hora TIMESTAMPTZ NOT NULL,completado BOOLEAN NOT NULL DEFAULT FALSE,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW());
CREATE INDEX IF NOT EXISTS idx_recordatorios_fecha_hora ON public.recordatorios(fecha_hora);
CREATE INDEX IF NOT EXISTS idx_recordatorios_completado ON public.recordatorios(completado);
COMMIT;
