CREATE PROCEDURE NuevoEmpleado @empleado varchar(250)
AS
Insert into Empleados(Nombre, Fecha_de_Alta)
values(@empleado, getdate())
GO;