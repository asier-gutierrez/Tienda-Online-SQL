/*SCRIPT PARA CREAR SINÓNIMOS PARA LAS TABLAS*/


CREATE SYNONYM CLIENTE FOR USUARIO;

CREATE SYNONYM DATOS_PAGO FOR DATO_BANCARIO;

CREATE SYNONYM MODO_DE_PAGO FOR TIPO_DATO_BANCARIO;

CREATE SYNONYM CARGO FOR PUESTO;

CREATE SYNONYM CP FOR CODIGO_POSTAL;

CREATE SYNONYM DIR FOR DIRECCION;

CREATE SYNONYM LUGAR_DE_TRABAJO FOR CENTRO_DE_OPERACIONES;

CREATE SYNONYM TRABAJADOR FOR EMPLEADO;

CREATE SYNONYM COMPRA FOR PEDIDO;

CREATE SYNONYM RECLAMACION FOR RECLAMACION_QUEJA;

CREATE SYNONYM QUEJA FOR RECLAMACION_QUEJA;

CREATE SYNONYM DIR_EMPLEADO FOR DOMICILIO_EMPLEADO;

CREATE SYNONYM DIR_TRABAJADOR FOR DOMICILIO_EMPLEADO;

CREATE SYNONYM DOMICILIO_TRABAJADOR FOR DOMICILIO_EMPLEADO;

CREATE SYNONYM DIR_USUARIO FOR DOMICILIO_USUARIO;