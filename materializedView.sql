/*
Este script solo funciona en base de datos PostgreSQL
*/

CREATE MATERIALIZED VIEW mv_videos AS
SELECT v.* 
FROM videos v
	INNER JOIN Grupo_Videos_Usuario gvu
		on v.Grupo_Videos_Usuario_ID = gvu.ID
WHERE Year(Fecha_de_Creacion) = 2020;