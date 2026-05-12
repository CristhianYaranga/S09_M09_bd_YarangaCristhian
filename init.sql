-- Crear base de datos
CREATE DATABASE viajes_db;
GO

-- Usar la base de datos
USE viajes_db;
GO

-- Crear tabla reservas
CREATE TABLE reservas (
    id BIGINT PRIMARY KEY IDENTITY(1,1),
    nombre_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    destino VARCHAR(100) NOT NULL,
    fecha_viaje DATE NOT NULL,
    fecha_regreso DATE NOT NULL,
    num_personas INT NOT NULL DEFAULT 1,
    precio_total DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
    created_at DATETIME DEFAULT GETDATE()
);
GO

-- Crear índice para búsquedas frecuentes
CREATE INDEX idx_email ON reservas(email);
CREATE INDEX idx_estado ON reservas(estado);
GO

-- Insertar datos de prueba
INSERT INTO reservas (nombre_cliente, email, destino, fecha_viaje, fecha_regreso, num_personas, precio_total, estado)
VALUES 
    ('Juan Pérez', 'juan@example.com', 'Machu Picchu', '2026-05-15', '2026-05-20', 2, 5000.00, 'Confirmado'),
    ('María García', 'maria@example.com', 'Cusco', '2026-06-01', '2026-06-05', 1, 3500.00, 'Pendiente'),
    ('Carlos López', 'carlos@example.com', 'Arequipa', '2026-07-10', '2026-07-15', 4, 8000.00, 'Cancelado'),
    ('Rosa Flores', 'rosa@example.com', 'Lima', '2026-05-20', '2026-05-25', 3, 4500.00, 'Confirmado'),
    ('Diego Morales', 'diego@example.com', 'Iquitos', '2026-06-15', '2026-06-22', 2, 6000.00, 'Pendiente'),
    ('Sofia Gutierrez', 'sofia@example.com', 'Puno', '2026-07-05', '2026-07-10', 5, 7500.00, 'Confirmado'),
    ('Miguel Reyes', 'miguel@example.com', 'Nazca', '2026-08-01', '2026-08-05', 1, 2800.00, 'Cancelado');
GO

-- Verificar que se creó correctamente
SELECT COUNT(*) AS total_reservas FROM reservas;
GO

-- Script para crear tabla Contactos en SQL Server
-- Ejecutar en SQL Server Management Studio

CREATE TABLE [dbo].[Contactos] (
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [Nombre] NVARCHAR(100) NOT NULL,
    [Email] NVARCHAR(100) NOT NULL,
    [Telefono] NVARCHAR(20) NOT NULL,
    [Asunto] NVARCHAR(100) NOT NULL,
    [Mensaje] NVARCHAR(MAX) NOT NULL,
    [FechaEnvio] DATETIME DEFAULT GETDATE(),
    [Estado] NVARCHAR(50) DEFAULT 'Nuevo'
);
GO

-- Insertar datos de prueba para Contactos
INSERT INTO [dbo].[Contactos] ([Nombre], [Email], [Telefono], [Asunto], [Mensaje], [Estado])
VALUES 
    ('Ana Rodríguez', 'ana@example.com', '+51987654321', 'Consulta sobre viajes', 'Me interesa conocer sobre paquetes a Machu Picchu', 'Nuevo'),
    ('Pedro Sánchez', 'pedro@example.com', '+51912345678', 'Reserva de hotel', 'Necesito información sobre hospedaje en Cusco', 'En proceso'),
    ('Laura Martínez', 'laura@example.com', '+51945678901', 'Problemas con reserva', 'Tuve un problema con mi reserva anterior', 'Resuelto');
GO

-- Verificar que la tabla Contactos se creó correctamente
SELECT * FROM [dbo].[Contactos];
GO
