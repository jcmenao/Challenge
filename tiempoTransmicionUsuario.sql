create view as tiempoTransmicionUsuario
as
select 
cc.Nombre
, v.Tipo_de_video
, sum(v.DuracionVideo)
FROM videos v
	INNER JOIN Grupo_Videos_Usuario gvu
		on v.Grupo_Videos_Usuario_ID = gvu.ID
	INNER JOIN Creador_de_Contenido cc
		on gvu.Creador_de_Contenido_ID = cc.ID
Group by
cc.Nombre
, v.Tipo_de_video		