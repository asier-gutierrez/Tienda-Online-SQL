/*FICHERO PARA CREACIÓN DE BASE DE DATOS*/

/*CIU*/
/*La tabla ciudad consta de un numero id, que sera la clave primaria y el identificador de la cidad que le ha sido asignada.
 *y el nombre es de una ciudad en concreto por ejemplo: Madrid. Ninguno de los atributos puede ser nulo */
CREATE TABLE CIUDAD (
ID NUMBER(5) CONSTRAINT CIU_ID_NN NOT NULL CONSTRAINT CIU_ID_PK PRIMARY KEY,
NOMBRE VARCHAR(30) CONSTRAINT CIU_NOMBRE_NN NOT NULL 
);

/*USU*/
/*La tabla ciudad consta de un dni para poder identificar al usuario y la clave primaria,nombre y appellido del usuario,email con el cual se 
  pondra en contacto y recibira informacion del pedido, una contraseña (CONTRA)con la cual asegurara su cuenta de usuario y por ultimo la fecha
  de nacimiento para saber si es un adulto o un niño.*/
CREATE TABLE USUARIO(
DNI VARCHAR(9) CONSTRAINT USU_DNI_NN NOT NULL CONSTRAINT USU_DNI_PK PRIMARY KEY,
NOMBRE VARCHAR(25) CONSTRAINT USU_NOMBRE_NN NOT NULL,
APELLIDO VARCHAR(40) CONSTRAINT USU_APELLIDO_NN NOT NULL,
EMAIL VARCHAR(60) CONSTRAINT USU_EMAIL_NN NOT NULL CONSTRAINT USU_EM_UN UNIQUE,
CONTRA VARCHAR(32) CONSTRAINT USU_CONTRA_NN NOT NULL,
FECHA_NACIMIENTO DATE CONSTRAINT USU_FECHA_NACIMIENTO_NN NOT NULL
);

/*T_DT_BN*/
/*La tabla tipo de dato bancario(TIPO_DATO_BANCARIO) consta de un numero que identifica el tipo de dato y la cual es la clave primaria
  y la denominacion que describe que clase de dato es, como por ejemplo: tarjeta debito, tarjeta credito...*/
CREATE TABLE TIPO_DATO_BANCARIO(
ID NUMBER(2) CONSTRAINT T_DT_BN_ID_NN NOT NULL CONSTRAINT T_DT_BN_ID_PK PRIMARY KEY,
DENOMINACION VARCHAR (25) CONSTRAINT T_DT_BN_DENOMINACION_NN NOT NULL CONSTRAINT T_DT_BN_DENOMINACION_UN UNIQUE
);

/*DT_BN*/
/*La tabla dato bancario que contiene los atributos: num que es la clave principal y es el numero de la cuenta bancaria del usuario ,
  el cvv son los tres ultimos digitos que se encuentra al reves de la tarjeta,para aquellos que quieran hacer el pago con tarjeta
  el tipo de dato bancario(ID_TIPO_DATO_BANCARIO)hace referencia a la tabla tipo_dato_bancario,la cual se incluye en esta tambien pro que pertenece al mismo grupo
  y el dni del usuario(USUARIO_DNI) hace referencia al dni de la tabla usuario, se necesita saber los datos del usuario para poder identificarlos*/
CREATE TABLE DATO_BANCARIO(
NUM VARCHAR(70) CONSTRAINT DT_BN_NUM_NN NOT NULL CONSTRAINT DT_BN_NUM_PK PRIMARY KEY,
CVV NUMBER(3),
ID_TIPO_DATO_BANCARIO NUMBER(2) CONSTRAINT DT_BN_ID_TIPO_DATO_BANCARIO_NN NOT NULL CONSTRAINT DT_BN_ID_TIPO_DATO_BANCARIO_FK REFERENCES TIPO_DATO_BANCARIO(ID) ON DELETE CASCADE,
USUARIO_DNI VARCHAR(9) CONSTRAINT DT_BN_USUARIO_DNI_NN NOT NULL CONSTRAINT DT_BN_USUARIO_DNI_FK_USU REFERENCES USUARIO(DNI) ON DELETE CASCADE
);

/*PST*/
/*La tabla PUESTO consta de un numero id el cual da una identificacion al puesto que se cubre
  y la denominacion es la descripcion del puesto por ejemplo: almacen, oficina */
CREATE TABLE PUESTO(
ID NUMBER(4) CONSTRAINT PST_ID_NN NOT NULL CONSTRAINT PST_ID_PK PRIMARY KEY,
DENOMINACION VARCHAR(30) CONSTRAINT PST_DENOMINACION_NN NOT NULL CONSTRAINT PST_DENOMINACION_UN UNIQUE
);

/*ET_PED*/
/*La tabla ESTADO_PEDIDO es para llevar un seguimiento y saber como se encuentra el pedido. Esta consta de un numero id, el cual identifa el pedido y lo distingue de los demas
  y la denominacion con la cual se describe el estado del pedido, esta puede ser como por ejemplo: enviado, pagado, devuelto...*/
CREATE TABLE ESTADO_PEDIDO(
ID NUMBER(2) CONSTRAINT ET_PED_ID_NN NOT NULL CONSTRAINT ET_PED_ID_PK PRIMARY KEY,
DENOMINACION VARCHAR(20) CONSTRAINT ET_PED_DENOMINACION_NN NOT NULL CONSTRAINT ET_PED_DENOMINACION_UN UNIQUE
);

/*COD_PS*/
/*La crecion de la tabla pedido esta pensada para agrupar las direcciones de la ciudades las cuales se van a enviar el pedido. Esta consta de un codigo, este es el codigo postal
  y el id de la ciudad al cual pertenece el codigo y hace referencia al id de la tabla ciudad.*/
CREATE TABLE CODIGO_POSTAL(
CODIGO NUMBER(7) CONSTRAINT COD_PS_CODIGO_NN NOT NULL CONSTRAINT COD_PS_CODIGO_PK PRIMARY KEY,
CIUDAD_ID NUMBER(5) CONSTRAINT COD_PS_CIUDAD_ID_NN NOT NULL CONSTRAINT COD_PS_CIUDAD_ID_FK_CIU REFERENCES CIUDAD(ID) ON DELETE CASCADE
);


/*DIR*/
/*La tabla direccion esta compuesta por un id,este sera el indentifcador de la direccion,
  la direccion (DIR) la cual sera de tipo varchar, ya que se necesita proporcionar una direccion,
  el id de la ciudad, el cual hace referencia a la tabla ciudad ya que ambas tablas estan conectadas
  y el codigo postal haciendo referencia a la tabla codigo_postal ,ya que en la direccion se necesita proporcionar el codigo postal en la cual esta ubicada la direccion.  */
CREATE TABLE DIRECCION(
ID NUMBER(9) CONSTRAINT DIR_ID_NN NOT NULL CONSTRAINT DIR_ID_PK PRIMARY KEY,
DIR VARCHAR(40) CONSTRAINT DIR_DIR_NN NOT NULL,
ID_CIUDAD NUMBER(5) CONSTRAINT DIR_ID_CIUDAD_NN NOT NULL CONSTRAINT DIR_ID_CIUDAD_FK_CIU REFERENCES CIUDAD(ID) ON DELETE CASCADE,
CODIGO_POSTAL NUMBER(7) CONSTRAINT DIR_CODIGO_POSTAL_NN NOT NULL CONSTRAINT DIR_CODIGO_POSTAL_FK_COD_PS REFERENCES CODIGO_POSTAL(CODIGO) ON DELETE CASCADE
);

/*MOD*/
/*La tabla modelo consta de un id, que identifica cada modelo diferente
  y el nombre, el cual describe el tipo de modelo del producto bien sea un nombre, color, tamaño por ejemplo: grande, negro...etc*/
CREATE TABLE MODELO(
ID NUMBER (9) CONSTRAINT MOD_ID_NN NOT NULL CONSTRAINT MOD_ID_PK PRIMARY KEY,
NOMBRE VARCHAR(25) CONSTRAINT MOD_NOMBRE_NN NOT NULL 
);

/*CTR_D_OP*/
/*La tabla CENTRO_DE_OPERACIONES esta formada por un id: todos los centros tienen uno distinto de distincion
  y la denominacion, la cual se escribe el nombre del centro de operaciones. */
CREATE TABLE CENTRO_DE_OPERACIONES(
ID NUMBER(9) CONSTRAINT CTR_D_OP_ID_NN NOT NULL CONSTRAINT CTR_D_OP_ID_PK PRIMARY KEY,
DENOMINACION VARCHAR(20) CONSTRAINT CTR_D_OP_DENOMINACION_NN NOT NULL
);


/*AL*/
/*La tabla almacen esta compuesta por un numero id, el cual identifica el almacen a que hace referencia,
  la denominacion del almacen, esta puede ser el nombre del almacen,
  y el id del centro a que pertenece (ID_CENTRO_OPERACIONES) este ultimo hace refencia a la tabla centro de operaciones en las cuales se gestionan las oficionas y almacenes.
  NOTA: a la constraint de FK que tiene el almacén, se le ha reducido el tamaño, suprimiendo la tabla a la que hace referencia para que se ajuste al tamaño máximo de las constraints, que son 30 caracteres*/

CREATE TABLE ALMACEN(
ID NUMBER(9) CONSTRAINT AL_ID_NN NOT NULL CONSTRAINT AL_ID_PK PRIMARY KEY,
DENOMINACION VARCHAR(20) CONSTRAINT AL_DENOMINACION_NN NOT NULL,
ID_CENTRO_OPERACIONES NUMBER(9) CONSTRAINT AL_ID_CENTRO_OPERACIONES_NN NOT NULL CONSTRAINT AL_ID_CENTRO_OPERACIONES_FK REFERENCES CENTRO_DE_OPERACIONES(ID) ON DELETE CASCADE
);

/*OF*/
/*La tabla oficona esta compuesta por un numero id, el cual identifica la oficina a la cual hace referencia,
  la denominacion del almacen, esta puede ser el nombre de la oficina por ejemplo: OFICINA PEPE,
  y el id del centro a que pertenece (ID_CENTRO_OPERACIONES) este ultimo hace refencia a la tabla centro de operaciones en las cuales se gestionan las oficionas y almacenes.
 NOTA: a la constraint de FK que tiene la oficina, se le ha reducido el tamaño, suprimiendo la tabla a la que hace referencia para que se ajuste al tamaño máximo de las constraints, que son 30 caracteres*/
CREATE TABLE OFICINA(
ID NUMBER(9) CONSTRAINT OF_ID_NN NOT NULL CONSTRAINT OF_ID_PK PRIMARY KEY,
DENOMINACION VARCHAR(20) CONSTRAINT OF_DENOMINACION_NN NOT NULL,
ID_CENTRO_OPERACIONES NUMBER(9) CONSTRAINT OF_ID_CENTRO_OPERACIONES_NN NOT NULL CONSTRAINT OF_ID_CENTRO_OPERACIONES_FK REFERENCES CENTRO_DE_OPERACIONES(ID) ON DELETE CASCADE
);


/*EMP*/
/*La tabla empleado esta creada para registrar la informacion de cada empleado que trabaja para la tienda. Esta compuesta por:
  Un dni de caracter alfanumerico, no nulo y es a su vez la clave primaria, ya que el empleado sera identificado por esta y no se repite.
  El nombre y apellido del usuario en forma alfanumerica y es un campo no nulo, registra el nombre y el apellido de cada empleado.
  La fecha de nacimiento de caracter date y no nula.
  Un email de caracter varchar y no nulo, ya que se necesita mantenerse en contacto con el empleado.
  El NSS de carcter numerico y no nulo, identifica al empleado.
  El id del puesto en forma numerica y no nula , provien de la tabla puesto, registra el puesto en el que trabaja el empleado no puede estar vacante.
  El id de almacen y oficina de caracter numerico y no nulo, esta hace la funcion de informar en donde trabaja el empleado.
  El id de direccion de caracter numerico y no nulo hace referencia al id de la tabla direccion, ya que cada empleado vive en un determinado sitio y se agrupan en direcciones.
  El dni del jefe de caracter varchar y no nulo, cada empleado tendra un jefe y este atributo proviene de la misma tabla, ya que el jefe es un empleado.*/
CREATE TABLE EMPLEADO(
DNI VARCHAR(9) CONSTRAINT EMP_DNI_NN NOT NULL CONSTRAINT EMP_DNI_PK PRIMARY KEY, 
NOMBRE VARCHAR(20) CONSTRAINT EMP_NOMBRE_NN NOT NULL,
SALARIO NUMBER(8) CONSTRAINT EMP_SALARIO_NN NOT NULL CONSTRAINT EMP_SALARIO_MAYOR_CERO CHECK(SALARIO>0),
APELLIDOS VARCHAR (40) CONSTRAINT EMP_APELLIDO_NN NOT NULL,
FECHA_NACIMIENTO DATE CONSTRAINT EMP_FECHA_NACIMIENTO_NN NOT NULL,
EMAIL VARCHAR(25) CONSTRAINT EMP_EMAIL_NN NOT NULL,
NSS NUMBER(12) CONSTRAINT EMP_NSS_NN NOT NULL,
ID_PUESTO NUMBER(4) CONSTRAINT EMP_ID_PUESTO_NN NOT NULL CONSTRAINT EMP_ID_PUESTO_FK_PST REFERENCES PUESTO(ID) ON DELETE CASCADE,
ID_OFICINA NUMBER(9) CONSTRAINT EMP_ID_OFICINA_NN NOT NULL CONSTRAINT EMP_ID_OFICINA_FK_OF REFERENCES OFICINA(ID)ON DELETE CASCADE,
ID_ALMACEN NUMBER(9) CONSTRAINT EMP_ID_ALMACEN_NN NOT NULL CONSTRAINT EMP_ID_ALMACEN_FK_AL REFERENCES ALMACEN(ID)ON DELETE CASCADE,
ID_DIRECCION NUMBER(9) CONSTRAINT EMP_ID_DIRECCION_NN NOT NULL CONSTRAINT EMP_ID_DIRECCION_FK_DIR REFERENCES DIRECCION(ID)ON DELETE CASCADE,
DNI_JEFE VARCHAR(9) CONSTRAINT EMP_DNI_JEFE_NN NOT NULL CONSTRAINT EMP_DNI_JEFE_FK_EMP REFERENCES EMPLEADO(DNI) ON DELETE CASCADE 
);

/*PED*/
/*La tabla pedido registra la informacion necesaria del pedido realizado. Esta esta compuesta por:
  Un id numerico ,no nulo y clave primaria, ya que es el atributo que identifica cada pedido.
  Una descripcion de caracter alfanumerico y no nula, esta describe el pedido por ejemplo: si el usuario quiere que tratemos el pedido realizado de alguna forma como para regalo...etc
  Una fecha del pedido de caracter date y no nulo, ya que cada pedido se realiza en una fecha en concreto.
  El id del estado del pedido de caracter numerico, proviene de la tabla estado_pedido, y se registra el estado en el que se encuentra el pedido.
  El numero del dato bancario, es alfanumerico, no nulo y proviene de la tabla dato bancario, con este atributo se registra el dato con el que se ha pagado el pedido.
  El dni del empleado de caracter alfanuemerico, no nulo y proveninete de la tabla empleado, es el cual atiende el pedido.
  EL dni del usuario de caracter alfanuemerico, no nulo y proveninete de la tabla, es el numero por el cual esta registrado el pedido del usuario en concreto.
  La id de direccion numerica, no nula y hace refencia a la misma id de la tabla direccion, ya que cada pedido se deasea que se mande a ciertas direcciones.*/
CREATE TABLE PEDIDO(
ID NUMBER(15) CONSTRAINT PED_ID_NN NOT NULL CONSTRAINT PED_ID_PK PRIMARY KEY,
DESCRIPCION VARCHAR(100),
FECHA_PEDIDO DATE CONSTRAINT PED_FECHA_NN NOT NULL,
ID_ESTADO_PEDIDO NUMBER(2) CONSTRAINT PED_ID_ESTADO_PEDIDO_NN NOT NULL CONSTRAINT PED_ID_ESTADO_PEDIDO_FK_ET_PED REFERENCES ESTADO_PEDIDO(ID),
NUM_DATO_BANCARIO VARCHAR(70) CONSTRAINT PED_NUM_DATO_BANCARIO_NN NOT NULL CONSTRAINT PED_NUM_DATO_BANCARIO_FK_DT_BN REFERENCES DATO_BANCARIO(NUM)ON DELETE CASCADE,
DNI_EMPLEADO VARCHAR(9) CONSTRAINT PED_DNI_EMPLEADO_NN NOT NULL CONSTRAINT PED_DNI_EMPLEADO_FK_EMP REFERENCES EMPLEADO(DNI)ON DELETE CASCADE,
DNI_USUARIO VARCHAR(9) CONSTRAINT PED_DNI_USUARIO_NN NOT NULL CONSTRAINT PED_DNI_USUARIO_FK_USU REFERENCES USUARIO(DNI)ON DELETE CASCADE,
ID_DIRECCION NUMBER(9) CONSTRAINT PED_ID_DIRECCION_NN NOT NULL CONSTRAINT PED_ID_DIRECCION_FK_DIR REFERENCES DIRECCION(ID) ON DELETE CASCADE
);

/*PRO*/
/*La tabla producto es creada para registrar la infamcion de los productos que diponemos. Esta consta de:
  Un identificador (id) de caracter numerico y no nulo, esta a su vez es declarada como clave primaria, ya que sera el atributo que identifique al prodcuto.
  La descripcion del producto en caracter alfanumerico y no nulo, por que es la que contiene las caracteristicas del producto a vender.
  Un nombre de caracter alfanumerico y no nulo, para distinguir el produto de los demas cada producto tendra un movil concreto.
  El precio de caracter numerico y no nulo, ya que todos los productos tienen un valor de venta.
  Y el id del modelo, que proviene de la tabla modelo, es un valor no nulo y esta ON DLETE CASCADE, ya que al ser borrada esa fila tambien se elimira esta.*/
CREATE TABLE PRODUCTO(
ID NUMBER (9) CONSTRAINT PRO_ID_NN NOT NULL CONSTRAINT PRO_ID_PK PRIMARY KEY,
DESCRIPCION VARCHAR(45) CONSTRAINT PRO_DESCRIPCION_NN NOT NULL,
NOMBRE VARCHAR(25) CONSTRAINT PRO_NOMBRE_NN NOT NULL,
PRECIO NUMBER (6) CONSTRAINT PRO_PRECIO_NN NOT NULL,
ID_MODELO NUMBER(9)  CONSTRAINT PRO_ID_MODELO_NN NOT NULL CONSTRAINT PRO_ID_MODELO_FK_MOD REFERENCES MODELO(ID) ON DELETE CASCADE
);


/*RC_QJ*/
/*La tabla reclamacion_queja esta creada para registrar todas aquellas quejas que tengan los pedidos.
  Esta connta de un numero id, que es no es nulo y es la clave primaria, ya que va a ser el atributo identificador de la tabla.
  Una denomicion de caracter alfanumerico y no nulo, es el problema en cuestion se necesita la informacion de esta.
  Un numero de reclamacion de caracter numerico no nulo y unico, ya que no es posible la repeticion de este.
  La descripcion de caracter alfanumerico y no nulo, esta es la informacion del problema detallada
  El id del pedido de caracter numerico, proviene de la tabla pedido que esta conectada a esta misma tabla.
  El dni del empleado con caracter alfanumerico ya que es el dni, no nulo y hace referencia a la tabla empleado, que es que va a tratar la queja.
  El dni del empleado y el id del pedido ambos estan en ON DELETE CASCADE, ya que se quiere eliminar la queja concreta.*/
CREATE TABLE RECLAMACION_QUEJA( 
ID NUMBER(9) CONSTRAINT RC_QJ_ID_NN NOT NULL CONSTRAINT RC_QJ_ID_PK PRIMARY KEY,
DENOMINACION  VARCHAR(20) CONSTRAINT RC_QJ_DENOMINACION_NN NOT NULL,
NUM_RECLAMACION NUMBER (9) CONSTRAINT RC_QJ_NUMERO_RECLAMACION_NN NOT NULL CONSTRAINT RC_QJ_NUMERO_RECLAMACION_UN UNIQUE,
DESCRIPCION VARCHAR(25) CONSTRAINT RC_QJ_DESCRIPCION_NN NOT NULL,
ID_PEDIDO NUMBER(15) CONSTRAINT RC_QJ_ID_PEDIDO_NN NOT NULL CONSTRAINT RC_QJ_ID_PEDIDO_FK_PED REFERENCES PEDIDO(ID) ON DELETE CASCADE,
DNI_EMPLEADO VARCHAR(9) CONSTRAINT RC_QJ_DNI_EMPLEADO_NN NOT NULL CONSTRAINT RC_QJ_DNI_EMPLEADO_FK_EMP REFERENCES EMPLEADO(DNI) ON DELETE CASCADE
);

/*DIS*/
/*La tabla disponibilada esta creada para registrar los modelos de los productos que disponemos en el almacen.
  Esta esta compuesta por la id del modelo y la id del almacen, ambas son caracteres numericos no nulos y claves primarias , por que identifica a todas las posibles filas de esas tablas.  */
CREATE TABLE DISPONIBILIDAD(
ID_MODELO NUMBER(9) CONSTRAINT DIS_ID_MODELO_NN NOT NULL CONSTRAINT DIS_ID_MODELO_FK_MOD REFERENCES MODELO(ID) ON DELETE CASCADE,
ID_ALMACEN NUMBER(9) CONSTRAINT DIS_ID_ALMACEN_NN NOT NULL CONSTRAINT DIS_ID_ALMACEN_FK_AL REFERENCES ALMACEN(ID) ON DELETE CASCADE,
CANTIDAD NUMBER(9) DEFAULT 0,
PRIMARY KEY ( ID_MODELO, ID_ALMACEN )
);

/*DM_EMP*/
/*La tabla domicilio empleado esta compuesta por el dni del empleado y la id de direccion ambos son claves primarias y no nulas, que para obtener el domicilio del empleado es necesario
  saber estos dos campos. Es la tabla que se crea de la union de direccion y empleado.*/
CREATE TABLE DOMICILIO_EMPLEADO(
ID_DIRECCION NUMBER(9) CONSTRAINT DM_EMP_ID_DIRECCION_NN NOT NULL CONSTRAINT DM_EMP_ID_DIRECCION_FK_DIR REFERENCES DIRECCION(ID) ON DELETE CASCADE,
DNI_EMPLEADO VARCHAR(9) CONSTRAINT DM_EMP_DNI_EMPLEADO_NN NOT NULL CONSTRAINT DM_EMP_DNI_EMPLEADO_FK_EMP REFERENCES EMPLEADO(DNI) ON DELETE CASCADE,
PRIMARY KEY ( ID_DIRECCION, DNI_EMPLEADO )
);

/*DM_US*/
/*La tabla domicilio usuario esta compuesta por el dni del usuario y la id de direccion ambos son claves primarias y no nulas, que para obtener el domicilio del usuario es necesario
  saber estos dos campos. Es la tabla que se crea de la union de direccion y usuario.*/
CREATE TABLE DOMICILIO_USUARIO(
DNI_USUARIO VARCHAR(9) CONSTRAINT DM_US_DNI_USUARIO_NN NOT NULL CONSTRAINT DM_US_DNI_USUARIO_FK_USU REFERENCES USUARIO(DNI) ON DELETE CASCADE,
ID_DIRECCION NUMBER(9) CONSTRAINT DM_US_ID_DIRECCION_NN NOT NULL CONSTRAINT DM_US_ID_DIRECCION_FK_DIR REFERENCES DIRECCION(ID) ON DELETE CASCADE,
PRIMARY KEY(DNI_USUARIO,ID_DIRECCION)
);

/*CNT*/
/*La tabla contiene es la union entre pedido y producto, en la cual se registra la cantidad de los productos que se han pedido.
  La cantidad es un atributo no nulo, ya que si se pide un producto nunca puede ser 0 simpre sera mayor a cero, de hay sacamos la comprobacion (CHECK).
  Tambien contiene la id del producto pedido y la id del pedido ambas son claves primarias, ya que se necesitan las dos para hacer las busquedas sobre la cantidad de un pedido o producto concreto.*/
CREATE TABLE CONTIENE(
ID_PRODUCTO NUMBER (9) CONSTRAINT CNT_ID_PRODUCTO_NN NOT NULL CONSTRAINT CNT_ID_PRODUCTO_FK_PRO REFERENCES PRODUCTO(ID) ON DELETE CASCADE,
ID_PEDIDO NUMBER(15) CONSTRAINT CNT_ID_PEDIDO_NN NOT NULL CONSTRAINT CNT_ID_PEDIDO_FK_PED REFERENCES PEDIDO(ID) ON DELETE CASCADE,
CANTIDAD NUMBER(4) CONSTRAINT CNT_CANTIDAD_NN NOT NULL CONSTRAINT CNT_CANTIDAD_CK_MAYOR_CERO CHECK (CANTIDAD>0),
PRIMARY KEY(ID_PRODUCTO,ID_PEDIDO)
);