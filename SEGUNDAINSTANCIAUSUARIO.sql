-- Crear el login 'sha' con una contraseña segura
CREATE LOGIN sha WITH PASSWORD = 'Kishauwu04?';

-- Asignar al rol de servidor sysadmin (permisos de administrador)
ALTER SERVER ROLE sysadmin ADD MEMBER sha;


-- Verificar el login y su rol
SELECT 
    sp.name AS LoginName,
    sp.type_desc AS LoginType,
    slr.role_principal_id,
    pr.name AS ServerRole
FROM sys.server_principals sp
LEFT JOIN sys.server_role_members slr ON sp.principal_id = slr.member_principal_id
LEFT JOIN sys.server_principals pr ON slr.role_principal_id = pr.principal_id
WHERE sp.name = 'sha';


SELECT name, is_disabled FROM sys.sql_logins WHERE name = 'sha';
