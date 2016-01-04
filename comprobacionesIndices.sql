/*Fichero script para comprobar los índices existentes sobre las tablas*/
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'CIUDAD';
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'USUARIO';
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'TIPO_DATO_BANCARIO'; 
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'DATO_BANCARIO'; 
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'PUESTO' ;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'ESTADO_PEDIDO' ;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'CODIGO_POSTAL'; 
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'DIRECCION'; 
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'MODELO' ;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'CENTRO_DE_OPERACIONES' ;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'ALMACEN' ;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'OFICINA' ;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'EMPLEADO'; 
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'PEDIDO' ;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'PRODUCTO' ;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'RECLAMACION_QUEJA'; 
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'DISPONIBILIDAD' ;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'DOMICILIO_EMPLEADO' ;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'DOMICILIO_USUARIO' ;
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME= 'CONTIENE' ;
