SELECT @@SERVERNAME AS 'Server Name';
--------------------------------------------------------------------------------
-- A1
-- En la base de datos principal (PrincipalServer)
-- crear y abrir la base DB_SeguridadPractica
CREATE DATABASE DB_SeguridadPractica;
USE DB_SeguridadPractica;
GO
-- Tabla de usuarios con información sensible
CREATE TABLE dbo.Usuarios (
 UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
 NombreCompleto NVARCHAR(100) NOT NULL,
 NombreUsuario NVARCHAR(50) NOT NULL UNIQUE,
 Contraseña NVARCHAR(255) NOT NULL, -- Se almacenará encriptada
 Email NVARCHAR(100) NOT NULL,
 FechaNacimiento DATE,
 Salario DECIMAL(10,2),
 Direccion NVARCHAR(200),
 Telefono NVARCHAR(20),
 EsAdministrador BIT DEFAULT 0,
 FechaCreacion DATETIME DEFAULT GETDATE(),
 UltimoLogin DATETIME
);
GO
-- Tabla de registros de auditoría
CREATE TABLE dbo.AuditoriaLog (
 LogID INT IDENTITY(1,1) PRIMARY KEY,
 UsuarioID INT NULL,
 Accion NVARCHAR(50) NOT NULL,
 TablaAfectada NVARCHAR(100) NOT NULL,
 RegistroID INT NULL,
 DetallesAnteriores NVARCHAR(MAX),
 DetallesNuevos NVARCHAR(MAX),
 FechaHora DATETIME DEFAULT GETDATE(),
 DireccionIP NVARCHAR(50),
 FOREIGN KEY (UsuarioID) REFERENCES dbo.Usuarios(UsuarioID)
);
GO
-- Tabla de información financiera
CREATE TABLE dbo.TransaccionesFinancieras (
 TransaccionID INT IDENTITY(1,1) PRIMARY KEY,
 UsuarioID INT NOT NULL,
 TipoTransaccion NVARCHAR(50) NOT NULL,
 Monto DECIMAL(12,2) NOT NULL,
 FechaTransaccion DATETIME DEFAULT GETDATE(),
 Descripcion NVARCHAR(255),
 CuentaDestino NVARCHAR(50),
 Aprobada BIT DEFAULT 0,
 FOREIGN KEY (UsuarioID) REFERENCES dbo.Usuarios(UsuarioID)
);
GO
-- Tabla de productos
CREATE TABLE dbo.Productos (
 ProductoID INT IDENTITY(1,1) PRIMARY KEY,
 Nombre NVARCHAR(100) NOT NULL,
 Descripcion NVARCHAR(500),
 Precio DECIMAL(10,2) NOT NULL,
 Costo DECIMAL(10,2) NOT NULL,
 Stock INT NOT NULL DEFAULT 0,
 Categoria NVARCHAR(50),
 FechaCreacion DATETIME DEFAULT GETDATE(),
 Activo BIT DEFAULT 1
);
GO



----------------------------------------------------------------------------------------------

-- A2
-- Insertar usuarios (las contraseñas son el hash de 'Password123')
INSERT INTO dbo.Usuarios (NombreCompleto, NombreUsuario, Contraseña, Email,
FechaNacimiento, Salario, Direccion, Telefono, EsAdministrador)
VALUES
('Administrador del Sistema', 'admin',
'0x0200A89A828C3F0D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E',
'admin@empresa.com', '1980-01-15', 7500.00, 'Av. Principal 123', '+1234567890', 1),
('Juan Pérez', 'jperez',
'0x0200A89A828C3F0D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E',
'juan@empresa.com', '1990-05-22', 3500.00, 'Calle Secundaria 456', '+1234567891', 0),
('María Gómez', 'mgomez',
'0x0200A89A828C3F0D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E',
'maria@empresa.com', '1985-11-30', 4200.00, 'Av. Central 789', '+1234567892', 0),
('Carlos Ruiz', 'cruiz',
'0x0200A89A828C3F0D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E2A3D8C1A3E',
'carlos@empresa.com', '1992-03-10', 3800.00, 'Calle Norte 101', '+1234567893', 0);
GO
-- Insertar productos
INSERT INTO dbo.Productos (Nombre, Descripcion, Precio, Costo, Stock, Categoria)
VALUES
('Laptop Elite', 'Laptop de última generación con 16GB RAM y 1TB SSD', 1299.99, 850.00, 25,
'Tecnología'),
('Smartphone Pro', 'Teléfono inteligente con cámara de 48MP', 799.99, 450.00, 50, 'Tecnología'),
('Tablet Basic', 'Tablet con pantalla HD de 10 pulgadas', 299.99, 180.00, 30, 'Tecnología'),
('Auriculares Inalámbricos', 'Auriculares con cancelación de ruido', 199.99, 120.00, 40,
'Accesorios'),
('Monitor 27"', 'Monitor QHD de 27 pulgadas', 349.99, 220.00, 15, 'Tecnología');
GO
-- Insertar transacciones financieras
INSERT INTO dbo.TransaccionesFinancieras (UsuarioID, TipoTransaccion, Monto, Descripcion,
CuentaDestino, Aprobada)
VALUES
(2, 'Salario', 3500.00, 'Pago de nómina', 'CUENTA-12345', 1),
(3, 'Salario', 4200.00, 'Pago de nómina', 'CUENTA-12346', 1),
(4, 'Salario', 3800.00, 'Pago de nómina', 'CUENTA-12347', 1),
(2, 'Reembolso', 150.00, 'Reembolso de gastos', 'CUENTA-12345', 1),
(3, 'Bonificación', 300.00, 'Bonificación por desempeño', 'CUENTA-12346', 1),
(2, 'Compra', -799.99, 'Compra de Smartphone Pro', 'CUENTA-98765', 1),
(3, 'Compra', -299.99, 'Compra de Tablet Basic', 'CUENTA-98766', 1);
GO
-- Insertar registros de auditoría de ejemplo
INSERT INTO dbo.AuditoriaLog (UsuarioID, Accion, TablaAfectada, RegistroID, DetallesAnteriores,
DetallesNuevos, DireccionIP)
VALUES
(1, 'INSERT', 'Usuarios', 2, NULL, '{"NombreCompleto":"Juan
Pérez","NombreUsuario":"jperez","Email":"juan@empresa.com"}', '192.168.1.100'),
(1, 'INSERT', 'Productos', 1, NULL, '{"Nombre":"Laptop Elite","Precio":1299.99}', '192.168.1.100'),
(2, 'UPDATE', 'Usuarios', 2, '{"Salario":3400.00}', '{"Salario":3500.00}', '192.168.1.101'),
(1, 'DELETE', 'Productos', 5, '{"Nombre":"Monitor 27\"","Precio":349.99}', NULL, '192.168.1.100');
GO


---------------------------------------------------------------------------------
-- A3
-- Procedimiento para login de usuarios
CREATE PROCEDURE dbo.sp_LoginUsuario
 @NombreUsuario NVARCHAR(50),
 @Contraseña NVARCHAR(255)
AS
BEGIN
 SET NOCOUNT ON;

 DECLARE @UsuarioID INT;

 -- Verificar credenciales (en un caso real, compararías hashes)
 SELECT @UsuarioID = UsuarioID
 FROM dbo.Usuarios
 WHERE NombreUsuario = @NombreUsuario AND Contraseña = @Contraseña;

 -- Registrar intento de login
 INSERT INTO dbo.AuditoriaLog (UsuarioID, Accion, TablaAfectada, RegistroID, DetallesNuevos)
 VALUES (@UsuarioID, 'LOGIN', 'Usuarios', @UsuarioID,
 '{"IntentoLogin":"' + CASE WHEN @UsuarioID IS NULL THEN 'Fallido' ELSE 'Exitoso' END +
'"}');

 -- Actualizar último login si fue exitoso
 IF @UsuarioID IS NOT NULL
 BEGIN
 UPDATE dbo.Usuarios
 SET UltimoLogin = GETDATE()
 WHERE UsuarioID = @UsuarioID;

 SELECT 'Login exitoso' AS Resultado, u.*
 FROM dbo.Usuarios u
 WHERE u.UsuarioID = @UsuarioID;
 END
 ELSE
 BEGIN
 SELECT 'Credenciales inválidas' AS Resultado;
 END
END;
GO
-- Procedimiento para registrar transacciones financieras
CREATE PROCEDURE dbo.sp_RegistrarTransaccion
 @UsuarioID INT,
 @TipoTransaccion NVARCHAR(50),
 @Monto DECIMAL(12,2),
 @Descripcion NVARCHAR(255),
 @CuentaDestino NVARCHAR(50)
AS
BEGIN
 SET NOCOUNT ON;

 BEGIN TRY
 BEGIN TRANSACTION;

 -- Insertar la transacción
 INSERT INTO dbo.TransaccionesFinancieras (UsuarioID, TipoTransaccion, Monto, Descripcion,
CuentaDestino)
 VALUES (@UsuarioID, @TipoTransaccion, @Monto, @Descripcion, @CuentaDestino);

 -- Registrar en auditoría
 DECLARE @TransaccionID INT = SCOPE_IDENTITY();

 INSERT INTO dbo.AuditoriaLog (UsuarioID, Accion, TablaAfectada, RegistroID, DetallesNuevos)
 VALUES (@UsuarioID, 'INSERT', 'TransaccionesFinancieras', @TransaccionID,
 '{"Tipo":"' + @TipoTransaccion + '","Monto":' + CAST(@Monto AS NVARCHAR(20)) + '}');

 COMMIT TRANSACTION;

 SELECT 'Transacción registrada exitosamente' AS Resultado, @TransaccionID AS
TransaccionID;
 END TRY
 BEGIN CATCH
 IF @@TRANCOUNT > 0
 ROLLBACK TRANSACTION;

 INSERT INTO dbo.AuditoriaLog (UsuarioID, Accion, TablaAfectada, DetallesNuevos)
 VALUES (@UsuarioID, 'ERROR', 'TransaccionesFinancieras',
 '{"Error":"' + ERROR_MESSAGE() + '","TipoTransaccion":"' + @TipoTransaccion + '"}');

 SELECT 'Error al registrar transacción: ' + ERROR_MESSAGE() AS Resultado;
 END CATCH
END;
GO


--------------------------------------------------------------------------------------
-- 1.1. Preparar la base de datos para mirroring
-- En el servidor principal (PRIMARYSERVER\SQLPRIMARY)
USE master;
GO
-- Asegurar que la BD usa modelo FULL RECOVERY
ALTER DATABASE DB_SeguridadPractica SET RECOVERY FULL;
GO
-- Crear backup completo y de logs
BACKUP DATABASE DB_SeguridadPractica
TO DISK = 'C:\Mirroring\DB_SeguridadPractica_Full.bak'
WITH COMPRESSION, CHECKSUM;
GO
BACKUP LOG DB_SeguridadPractica
TO DISK = 'C:\Mirroring\DB_SeguridadPractica_Log.trn'
WITH COMPRESSION, CHECKSUM;
GO

---------------------------------------------------------------------
CREATE ENDPOINT EndpointMirroring
STATE = STARTED
AS TCP (LISTENER_PORT = 5022)
FOR DATABASE_MIRRORING (ROLE = PARTNER);
GO

-- Aquí el partner es la instancia espejo, que está en puerto 5023
ALTER DATABASE DB_SeguridadPractica
SET PARTNER = 'TCP://DESKTOP-NF3PUEU:5023';
GO


ALTER ENDPOINT EndpointMirroring STATE = STOPPED;
GO

DROP ENDPOINT EndpointMirroring;
GO





