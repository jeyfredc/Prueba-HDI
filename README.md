
# Prueba-HDI

**Respuesta del punto No. 1 De la prueba**

-- No tiene errores 

**Respuesta del punto No. 2**

-- Se adjunta un archivo RaR para descomprimir, instalar dependencias con el comando `npm i` y lanzar el archivo con `ng serve -o` 

**Respuesta del punto No. 3**

-- Crear Base de datos con el archivo script_prueba en una base de datos local.

-- Correr la Function FxInformation

-- cambiar el nombre de la base de datos local en el archivo local.settings.json en `SqlServerConnection`

```
{
    "IsEncrypted": false,
    "Values": {
        "AzureWebJobsStorage": "UseDevelopmentStorage=true",
        "FUNCTIONS_WORKER_RUNTIME": "dotnet",
        "FilesDirectory": "files",
        "SqlServerConnection": "Server=DESKTOP-9SH5FF8;database=db_prueba;trusted_connection=true;"

    }
}

```

-- Abrir la carpeta Test y ejecutar el archivo ObtenerInformacion   `GET http://localhost:7071/api/obtener-informacion/222 HTTP/1.1`

**Respuesta Esperada**
```
GET http://localhost:7071/api/obtener-informacion/222

HTTP/1.1 200 OK
Content-Length: 418
Content-Type: application/json; charset=utf-8
Date: Thu, 30 Nov 2023 22:42:06 GMT
Server: Kestrel

{
  "isError": false,
  "message": "Consulta exitosa",
  "data": [
    {
      "score": "222",
      "fechaConsulta": "2023-10-26T09:04:17",
      "secuencia": 24909,
      "codigoRespuesta": "13",
      "numeroDocumento": "12345678",
      "tipo": "1",
      "estadi": "",
      "ciudad": "",
      "departamento": "",
      "genero": "4",
      "edadMin": "46",
      "edadMax": "55",
      "nombres": "CLIENTE",
      "primerApellido": "PRUEBA",
      "segundoApellido": "TEST",
      "tipoDocumento": "C",
      "vin": null,
      "fechaUltimaCarga": "2023-09-10T00:10:00"
    }
  ]
}
Response file saved.
> 2023-11-30T174206.200.json

Response code: 200 (OK); Time: 30ms (30 ms); Content length: 418 bytes (418 B)

```

Para poder traer esta consulta se creo un procedimiento almacenado que trae la data de la informacion principal
```
CREATE PROCEDURE consultaScore
@score VARCHAR(55)
AS
BEGIN
select s.Score, r.FechaConsulta, r.Secuencia, r.CodigoRespuesta, c.NumeroDocumento, id.Tipo, id.Estadi, id.Ciudad, id.Departamento,
id.Genero, p.EdadMin, p.EdadMax, p.Nombres, p.PrimerApellido, p.SegundoApellido,
c.Vin, c.TipoDocumento, c.FechaUltimaCarga
from Scores s inner join Informacion i 
on s.ScoreId = i.InformacionId 
inner join Categorias c on c.CategoriaId = i.CategoriaId
inner join Riesgos r on r.RiesgoId= i.RiesgoId
inner join Personas p on p.PersonaId = r.PersonaId
inner join Identificaciones id on id.Numero = c.NumeroDocumento
where s.Score = @score

END

EXEC consultaScore @score = 222
```
