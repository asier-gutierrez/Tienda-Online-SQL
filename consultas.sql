/*FICHERO PARA HACER CONSULTAS (CADA UNO DESARROLLARA LAS SUYAS)*/

/*IVAN*/
1º Se quiere crear una vista con parte de la información de los usuarios, por seguridad, 
donde no se tendrá acceso a la contraseña del cliente, ni a su DNI, ni a su fecha de nacimiento.

SQL> CREATE VIEW DATOS_USUARIOS(NOMBRE,APELLIDO,MAIL) AS SELECT NOMBRE,APELLIDOS,EMAIL FROM EMPLEADO;

Vista creada.

SQL> SELECT * FROM DATOS_USUARIOS;

Resultado:

NOMBRE               APELLIDO                                                   
-------------------- ----------------------------------------                   
MAIL                                                                            
-------------------------                                                       
PEDRO                EGUNON                                                     
PE@OPENDEUSTO.ES                                                                
                                                                                
SILVIA               ORTIZ                                                      
SO@OPENDEUSTO.ES                                                                
                                                                                
JUAN                 GARAY                                                      
JG@OPENDEUSTO.ES                                                                
                                                                                

NOMBRE               APELLIDO                                                   
-------------------- ----------------------------------------                   
MAIL                                                                            
-------------------------                                                       
ELENA                JIMENEZ                                                    
EJ@OPENDEUSTO.ES                                                                
                                                                                
JONAN                OPORTO                                                     
JO@OPENDEUSTO.ES                                                                
                                                                                
ANE                  MONSERRAT                                                  
AM@OPENDEUSTO.ES                                                                
                                                                                

NOMBRE               APELLIDO                                                   
-------------------- ----------------------------------------                   
MAIL                                                                            
-------------------------                                                       
KEVIN                AMIANO                                                     
KA@OPENDEUSTO.ES                                                                
                                                                                
CARLOS               CARCEDO                                                    
CC@OPENDEUSTO.ES                                                                
                                                                                
CARLOTA              IGLESIAS                                                   
CI@OPENDEUSTO.ES                                                                
                                                                                

NOMBRE               APELLIDO                                                   
-------------------- ----------------------------------------                   
MAIL                                                                            
-------------------------                                                       
MARTA                ABAITUA                                                    
MA@OPENDEUSTO.ES                                                                
                                                                                
ROBERTO              BARREDO                                                    
RB@OPENDEUSTO.ES                                                                
                                                                                
ASUNCION             CAMPO                                                      
AC@OPENDEUSTO.ES                                                                
 

2º El usuario Pedro se ha quejado de su pedido, por ello queremos saber qué empleado ha tramitado su pedido, 
con su nombre, apellido y MAIL.

SQL> SELECT E.NOMBRE,E.APELLIDOS,E.EMAIL FROM EMPLEADO E, PEDIDO P,USUARIO U WHERE U.NOMBRE= 'PEDRO' AND U.DNI=P.DNI_USUARIO AND P.DNI_EMPLEADO=E.DNI;

Resultado:

NOMBRE               APELLIDOS                                                  
-------------------- ----------------------------------------                   
EMAIL                                                                           
-------------------------                                                       
ELENA                JIMENEZ                                                    
EJ@OPENDEUSTO.ES  

3º Queremos saber el salario medio de cada puesto de los departamentos con media superior a 1600 €, ordendo el resultado por orden alfabético de puesto
 (primero creamos una vista para sacar la media, y luego visualizamos el nombre de los departamentos).

 SQL>CREATE VIEW MEDIA_SALARIOS(ID, MEDIA)AS SELECT ID_PUESTO, AVG(SALARIO) FROM EMPLEADO GROUP BY ID_PUESTO HAVING  AVG(SALARIO)>1600;

Vista creada.

SQL>SELECT P.DENOMINACION,M_S.MEDIA FROM PUESTO P, MEDIA_SALARIOS M_S WHERE M_S.ID=P.ID ORDER BY DENOMINACION;

Resultado:

DENOMINACION                        MEDIA                                       
------------------------------ ----------                                       
DIRECTOR                             2000                                       
ENCARGADO                            2000                                       
INTERNO                              1700                                       
SECRETARIA                           2500                                       
TECNICO                        1833,33333    

4ª Se quiere saber la cantidad de modelos disponibles en el almacén cuya cantidad disponible sea mayor a la del modelo negro,
indicando la cantidad disponible, la denominación del almacén y el nombre del modelo.

SQL> SELECT CANTIDAD, A.DENOMINACION, M.NOMBRE FROM DISPONIBILIDAD D,
  2  ALMACEN A, MODELO M WHERE D.ID_MODELO=M.ID AND D.ID_ALMACEN=A.ID
  3  AND CANTIDAD>ANY(SELECT CANTIDAD FROM DISPONIBILIDAD
  4  WHERE ID_MODELO=ANY(SELECT ID FROM MODELO WHERE NOMBRE='NEGRO'));

Resultado:

  CANTIDAD DENOMINACION         NOMBRE                                          
---------- -------------------- -------------------------                       
         8 INFOR                GRANDE                                          
         4 TECHNO               ORO                                             
         4 PRENDAS              PEQUEñO                                        
         4 MATPRIMA             AZUL                                            
         4 PRODUCTOTERMINADO    MINI                                            
         3 REPUESTOS            PLUS                                            
         2 PRODUCTOENCURSO      TALLA M                                         
         2 ATUN                 PLATA                                           
         2 MATOFICINA           MORADO                                          

5º La usuaria Yasmín Martín quiere saber en qué estado estan sus pedidos, indicando la descripcion de su pedido y su estado.

SQL>SELECT P.DESCRIPCION, E_P.DENOMINACION FROM PEDIDO P, ESTADO_PEDIDO E_P,USUARIO U WHERE P.DNI_USUARIO =(SELECT DNI FROM USUARIO WHERE NOMBRE = 'YASMIN' AND APELLIDO = 'MARTIN') AND P.ID_ESTADO_PEDIDO=E_P.ID;

Resultado:

DESCRIPCION                                                                     
--------------------------------------------------------------------------------
DENOMINACION                                                                    
--------------------                                                            
2 MOVILES                                                                       
ENVIADO                                                                         
                                                                                                                                               
DESCRIPCION                                                                     
--------------------------------------------------------------------------------
DENOMINACION                                                                    
--------------------                                                            
1 MOVIL                                                                         
DEVUELTO 

/*ASIER*/

/*ENUNCIADO: Se quiere hacer un estudio para determinar cual es el método de pago más utilizado*/
/*Obtener el nombre, identificativo, número total de ventas realizadas e importe de todos los métodos de pago existentes*/
SQL> CREATE VIEW GASTOCONTIPO(ID,NOMBRE,GASTO) AS SELECT TDB.ID,TDB.DENOMINACION,SUM(P.PRECIO*C.CANTIDAD) FROM TIPO_DATO_BANCARIO TDB, DATO_BANCARIO DB, PRODUCTO P,PEDIDO PE, CONTIENE C WHERE TDB.ID=DB.ID_TIPO_DATO_BANCARIO AND DB.NUM=PE.NUM_DATO_BANCARIO AND PE.ID=C.ID_PEDIDO AND P.ID=C.ID_PRODUCTO GROUP BY TDB.ID,TDB.DENOMINACION;

Vista creada.

SQL> SELECT * FROM GASTOCONTIPO;

        ID NOMBRE                         GASTO                                 
---------- ------------------------- ----------                                 
         5 MASTERCARD                        20                                 
         2 PAYPAL                           170                                 
         1 CUENTA CORRIENTE                1075                                 
         3 TARJETA DE CREDITO               174                                 


SQL> SELECT * FROM GASTOCONTIPO WHERE GASTO=(SELECT MAX(GASTO) FROM GASTOCONTIPO);

        ID NOMBRE                         GASTO                                 
---------- ------------------------- ----------                                 
         1 CUENTA CORRIENTE                1075  

/*ENUNCIADO: Se quiere conocer el empeño de los trabajadores que procesan pedidos. Como
esto es una empresa nos dedicaremos a mirar los pedidos más caros. (En sumatorio de precios)*/
/*Obtener quién es el empleado que ha procesado más pedidos (teniendo en cuenta el importe) durante el último mes, considerando
la suma de los importes de todas las consultas atendidas durante el periodo. Se debe indicar el número
de la seguridad social y nombre del empleado. También mostrar el importe total facturado de los pedidos que ha procesado.
Se puede hacer creando una vista.*/
SQL> CREATE VIEW PROCESADO_DE_PEDIDO (NSS,NOMBRE,CANTIDAD,BENEFICIO)AS SELECT E.NSS,E.NOMBRE,COUNT(*),SUM(P.PRECIO*C.CANTIDAD) FROM EMPLEADO E, PEDIDO PE,PRODUCTO P,CONTIENE C WHERE E.DNI=PE.DNI_EMPLEADO AND FECHA_PEDIDO BETWEEN'06-12-2015' AND '06-01-2016'AND PE.ID=C.ID_PEDIDO AND P.ID=C.ID_PRODUCTO GROUP BY E.NSS,E.NOMBRE;

Vista creada.

SQL> SELECT * FROM PROCESADO_DE_PEDIDO;

       NSS NOMBRE                 CANTIDAD  BENEFICIO                           
---------- -------------------- ---------- ----------                           
     67891 PEDRO                         2        260                           
     78912 ELENA                         2        300                           
     12345 JUAN                          1        240                           
     85432 MARTA                         1         84                           

SQL> SELECT * FROM PROCESADO_DE_PEDIDO WHERE BENEFICIO=(SELECT MAX(BENEFICIO) FROM PROCESADO_DE_PEDIDO);

       NSS NOMBRE                 CANTIDAD  BENEFICIO                           
---------- -------------------- ---------- ----------                           
     78912 ELENA                         2        300                   
     
     
     

/*ENUNCIADO: Se quiere hacer una reducción de plantilla, por ello, queremos ver cuales son los empleados que menor rendimiento
han tenido en la empresa*/
/*Obtener cuántos pedidos ha atendido cada empleado del departamento de quejas y reclamaciones durante el
último año, indicando el número de la seguridad social y el número de quejas y reclamaciones atendidas para todos
los que hayan realizado menos de 10.*/
SQL> CREATE VIEW EFICIENCIA_EN_AC(NSS,N_RQ_ATENDIDAS) AS SELECT NSS,COUNT(*) FROM EMPLEADO E, RECLAMACION_QUEJA RQ WHERE E.DNI=RQ.DNI_EMPLEADO GROUP BY NSS;

Vista creada.

SQL> SELECT * FROM EFICIENCIA_EN_AC;

       NSS N_RQ_ATENDIDAS                                                       
---------- --------------                                                       
     78912              2                                                       
     89343              2                                                       
     23896              2                                                       
     34567              1                                                       
     56231              2                                                       
     12345              1                                                       
     52346              2                                                       

7 filas seleccionadas.

SQL> SELECT * FROM EFICIENCIA_EN_AC WHERE N_RQ_ATENDIDAS<10;

       NSS N_RQ_ATENDIDAS                                                       
---------- --------------                                                       
     78912              2                                                       
     89343              2                                                       
     23896              2                                                       
     34567              1                                                       
     56231              2                                                       
     12345              1                                                       
     52346              2                                                       

7 filas seleccionadas.


/*ENUNCIADO: Se quiere mejorar la atención al cliente y el servicio post-venta en la ciudad que menos pedidos
recibe con el fin de aumentar las ventas y reforzar la fidelización con nuestros clientes*/
/*Obtener cual es la ciudad desde la cual se realizan menos pedidos (la ciudad a la que menos pedidos se envían).
Mostrar nombre de la ciudad, identificativo, número de pedidos.*/
SQL> CREATE VIEW ENVIOSPORCIUDADES(CODIGO,NOMBRE,N_ENVIOS) AS SELECT C.ID,C.NOMBRE,COUNT(*) FROM CIUDAD C,PEDIDO P,DIRECCION D WHERE P.ID_DIRECCION=D.ID AND D.ID_CIUDAD=C.ID GROUP BY C.ID,C.NOMBRE;

Vista creada.

SQL> SELECT * FROM ENVIOSPORCIUDADES;

    CODIGO NOMBRE                           N_ENVIOS                            
---------- ------------------------------ ----------                            
         6 VALENCIA                                1                            
         1 MADRID                                  1                            
         2 BARCELONA                               2                            
        11 SANTANDER                               1                            
         3 BILBAO                                  1                            
         5 ZARAGOZA                                2                            
         8 OVIEDO                                  1                            
         4 SEVILLA                                 1                            
         9 LA RIOJA                                1                            
        12 ANDALUCIA                               1                            

10 filas seleccionadas.

SQL> SELECT * FROM ENVIOSPORCIUDADES WHERE N_ENVIOS=(SELECT MIN(N_ENVIOS) FROM ENVIOSPORCIUDADES);

    CODIGO NOMBRE                           N_ENVIOS                            
---------- ------------------------------ ----------                            
         6 VALENCIA                                1                            
         1 MADRID                                  1                            
        11 SANTANDER                               1                            
         3 BILBAO                                  1                            
         8 OVIEDO                                  1                            
         4 SEVILLA                                 1                            
         9 LA RIOJA                                1                            
        12 ANDALUCIA                               1                            

8 filas seleccionadas.


/*ENUNCIADO: Se quiere enviar al cliente que más ha gastado un regalo con el fin de aumentar su fidelidad a nuestra tienda.*/
/*Obtener  todos los datos personales del cliente que más ha gastado
en nuestra tienda.*/
SQL> CREATE VIEW GASTOPORCLIENTES(DNI,NOMBRE,APELLIDO,EMAIL,TOTAL) AS SELECT U.DNI,U.NOMBRE,U.APELLIDO,U.EMAIL,SUM(P.PRECIO*C.CANTIDAD) FROM USUARIO U,PRODUCTO P,PEDIDO PE,CONTIENE C WHERE U.DNI=PE.DNI_USUARIO AND P.ID=C.ID_PRODUCTO AND PE.ID=C.ID_PEDIDO GROUP BY U.DNI,U.NOMBRE,U.APELLIDO,U.EMAIL;

Vista creada.

SQL> SELECT * FROM GASTOPORCLIENTES;

DNI       NOMBRE                    APELLIDO                                    
--------- ------------------------- ----------------------------------------    
EMAIL                                                             TOTAL         
------------------------------------------------------------ ----------         
85296374H ROBERTO                   MENDEZ                                      
RM@OPENDEUSTO.ES                                                     20         
                                                                                
14725836I AMAIA                     NUÃ‘EZ                                      
AN@OPENDEUSTO.ES                                                    130         
                                                                                
56390874E CARLOS                    LANDA                                       
CL@OPENDEUSTO.ES                                                    240         
                                                                                

DNI       NOMBRE                    APELLIDO                                    
--------- ------------------------- ----------------------------------------    
EMAIL                                                             TOTAL         
------------------------------------------------------------ ----------         
45615975B YASMIN                    MARTIN                                      
YM@OPENDEUSTO.ES                                                    480         
                                                                                
96385274G PEDRO                     ZAPATERO                                    
PZ@OPENDEUSTO.ES                                                     60         
                                                                                
78912345A MARTA                     ANGUIANO                                    
MA@OPENDEUSTO.ES                                                     20         
                                                                                

DNI       NOMBRE                    APELLIDO                                    
--------- ------------------------- ----------------------------------------    
EMAIL                                                             TOTAL         
------------------------------------------------------------ ----------         
45876562C ASIER                     GUTIERREZ                                   
AG@OPENDEUSTO.ES                                                    240         
                                                                                
74185296F LAURA                     RODRIGUEZ                                   
LR@OPENDEUSTO.ES                                                     75         
                                                                                
32165478L JOSE                      ESCUDERO                                    
JE@OPENDEUSTO.ES                                                     90         
                                                                                

DNI       NOMBRE                    APELLIDO                                    
--------- ------------------------- ----------------------------------------    
EMAIL                                                             TOTAL         
------------------------------------------------------------ ----------         
78945632K MARIA                     LOPEZ                                       
ML@OPENDEUSTO.ES                                                     84         
                                                                                

10 filas seleccionadas.

SQL> SELECT * FROM GASTOPORCLIENTES WHERE TOTAL=(SELECT MAX(TOTAL) FROM GASTOPORCLIENTES);

DNI       NOMBRE                    APELLIDO                                    
--------- ------------------------- ----------------------------------------    
EMAIL                                                             TOTAL         
------------------------------------------------------------ ----------         
45615975B YASMIN                    MARTIN                                      
YM@OPENDEUSTO.ES                                                    480       


/*ENUNCIADO: Se quiere realizar un conteo de todos los empleados de cada cargo existente en la empresa*/
/*Obtener el cargo y el número de personas que ostentan dicho cargo.*/
SQL> CREATE VIEW CONTEO(ID,NOMBRE,NUMPERSONAS) AS SELECT ID,DENOMINACION,COUNT(*) FROM PUESTO GROUP BY ID,DENOMINACION;

Vista creada.

SQL> SELECT * FROM CONTEO;

        ID NOMBRE                         NUMPERSONAS                           
---------- ------------------------------ -----------                           
      1111 TECNICO                                  1                           
      6666 DIRECTOR                                 1                           
      1000 ADMINISTRADORA                           1                           
      9999 SECRETARIA                               1                           
      5555 BECARIO                                  1                           
      1002 SUPERVISOR                               1                           
      8888 GERENTE                                  1                           
      4444 EMPLEADO                                 1                           
      7777 INTERNO                                  1                           
      1001 ASISTENTE                                1                           
      2222 ENCARGADO                                1                           

        ID NOMBRE                         NUMPERSONAS                           
---------- ------------------------------ -----------                           
      3333 JEFE                                     1                           

12 filas seleccionadas.


/*MARTA*/

1.Obtener el número de usuario de la página que hayan realizado un pedido con id de direccion  igual a 2, y que además sean del año 

1995. Indicar sus respectivos DNIs, nombres y apellidos, y ordenar el resultado por orden ascendente del número de DNI.
  SQL> select dni, nombre , apellido
  2  from usuario u, pedido p
  3  where u.dni=p.dni_usuario and p.id_direccion=2 and u.fecha_nacimiento like'%95'
  4  order by u. dni asc;

DNI       NOMBRE                    APELLIDO                                    
--------- ------------------------- ----------------------------------------    
45876562C ASIER                     GUTIERREZ                                   
78912345A MARTA                     ANGUIANO                                    

                                
2.	Indicar los puestos en los que trabajan los empleados que son jefes, completar sus id y denominación del puesto. Disponer de 

estos datos en orden de apeellidos.
SQL> select * from empleado where id_puesto=(select id from puesto where denominacion='JEFE') order by apellidos;

DNI       NOMBRE                  SALARIO                                       
--------- -------------------- ----------                                       
APELLIDOS                                FECHA_NA EMAIL                         
---------------------------------------- -------- -------------------------     
       NSS  ID_PUESTO ID_OFICINA ID_ALMACEN ID_DIRECCION DNI_JEFE               
---------- ---------- ---------- ---------- ------------ ---------              
78912345J ELENA                      1000                                       
JIMENEZ                                  07/04/89 EJ@OPENDEUSTO.ES              
     78912       3333          4          4            3 22558975C    
3.	Obtener los empleados que trabajen en el puesto “1111” y que además tengan 25 años o menos, mediante dos selects conectados 

por el operador minus, mediante dos select conectados por el operador intersect y por último mediante una única select.
SQL> select apellidos from empleado where id_puesto=1111 and (select sysdate-fecha_nacimiento from dual)/365<=25;

APELLIDOS                                                                       
----------------------------------------                                        
EGUNON       
SQL> select apellidos from empleado where id_puesto=1111
  2  intersect
  3  ((select sysdate-fecha_nacimiento from dual)/365<=25);

APELLIDOS                                                                       
----------------------------------------                                        
EGUNON       

SQL> select apellidos from empleado where id_puesto=1111
  2  minus
  3  ((select sysdate-fecha_nacimiento from dual)/365<=25);

APELLIDOS                                                                       
----------------------------------------                                        
EGUNON       

4.	Obtener el salario medio de cada nombre de los empleados, siempre que el salario medio sea superior a 1000
SQL> select nombre, avg(salario)
  2  from empleado
  3  group by nombre having avg(salario)>1000;

NOMBRE               AVG(SALARIO)                                               
-------------------- ------------                                               
JONAN                        1500                                               
ANE                          1500                                               
MARTA                        2500                                               
ROBERTO                      3500                                               
KEVIN                        2000                                               
CARLOS                       1700                                               
CARLOTA                      1500                                               
SILVIA                       2000                                               

8 filas seleccionadas.

5.	Crear una vista de los pedidos que se han realizado en la tienda, indicando la descripción, el estado y la fecha del pedido, 

mostrar así mismo qué usuario ha realizado cada pedido. .Después obtener cuales son los clientes que más pedidos han hecho a partir 

de esta vista, mostrando sus nombres.

SQL> create view v( descripcion,id_estado_pedido, fecha_pedido, cantPedidos, nombre)
  2  as select p.descripcion, p.id_estado_pedido,p.fecha_pedido, count(*),u.nombre
  3  from usuario u, pedido p
  4  where u.dni=p.dni_usuario
  5  group by p.descripcion, p.id_estado_pedido,p.fecha_pedido,u.nombre;

Vista creada.

SQL> select nombre from v where cantPedidos=(Select max(cantPedidos) from v);

NOMBRE                                                                          
-------------------------                        
YASMIN
AMAIA


/*YASMIN*/
1.Obtener el nombre del empleado, que esta atendiendo las quejas, y a su vez la cantidad de quejas que esta atendiendo cada empleado ordenandolo por el nombre:

SQL> SELECT DISTINCT NOMBRE, COUNT(DNI) FROM EMPLEADO, RECLAMACION_QUEJA WHERE DNI_EMPLEADO=DNI GROUP BY NOMBRE ORDER BY NOMBRE ASC;

NOMBRE               COUNT(DNI)                                                 
-------------------- ----------                                                 
ANE                           2                                                 
CARLOS                        2                                                 
CARLOTA                       2                                                 
ELENA                         2                                                 
JONAN                         1                                                 
JUAN                          1                                                 
KEVIN                         2                                                 

7 filas seleccionadas.                                           

2.Utilizando dos select por medio de un intersect obtener los datos de todos los usuarios de los cuales el numero dni empieze por 7 y el nombre empeize por la letra M. Hacerlo 
tambien por medio de dos select, observando la diferencia de los dos metodos:

SQL> SELECT * FROM USUARIO WHERE DNI LIKE '7%'
  2  INTERSECT
  3  SELECT * FROM USUARIO WHERE NOMBRE LIKE 'M%';

DNI       NOMBRE                    APELLIDO                                    
--------- ------------------------- ----------------------------------------    
EMAIL                                                                           
------------------------------------------------------------                    
CONTRA                           FECHA_NA                                       
-------------------------------- --------                                       
78912345A MARTA                     ANGUIANO                                    
MA@OPENDEUSTO.ES                                                                
1111A                            28/12/95                                       
                                                                                
78945632K MARIA                     LOPEZ                                       
ML@OPENDEUSTO.ES                                                                
1001K                            11/06/93                                       

DNI       NOMBRE                    APELLIDO                                    
--------- ------------------------- ----------------------------------------    
EMAIL                                                                           
------------------------------------------------------------                    
CONTRA                           FECHA_NA                                       
-------------------------------- --------                                       
                                                                                

SQL> SELECT * FROM USUARIO WHERE DNI LIKE '7%'
  2  UNION
  3  SELECT * FROM USUARIO WHERE NOMBRE LIKE 'M%';

DNI       NOMBRE                    APELLIDO                                    
--------- ------------------------- ----------------------------------------    
EMAIL                                                                           
------------------------------------------------------------                    
CONTRA                           FECHA_NA                                       
-------------------------------- --------                                       
74185296F LAURA                     RODRIGUEZ                                   
LR@OPENDEUSTO.ES                                                                
6666F                            22/11/90                                       
                                                                                
78912345A MARTA                     ANGUIANO                                    
MA@OPENDEUSTO.ES                                                                
1111A                            28/12/95                                       

DNI       NOMBRE                    APELLIDO                                    
--------- ------------------------- ----------------------------------------    
EMAIL                                                                           
------------------------------------------------------------                    
CONTRA                           FECHA_NA                                       
-------------------------------- --------                                       
                                                                                
78945623D IVAN                      FERNANDEZ                                   
IM@OPENDEUSTO.ES                                                                
4444D                            18/05/95                                       
                                                                                
78945632K MARIA                     LOPEZ                                       
ML@OPENDEUSTO.ES                                                                

DNI       NOMBRE                    APELLIDO                                    
--------- ------------------------- ----------------------------------------    
EMAIL                                                                           
------------------------------------------------------------                    
CONTRA                           FECHA_NA                                       
-------------------------------- --------                                       
1001K                            11/06/93                                       
                                                                                

3.Utilizar los metodos JOIN y SUBCONSULTA para obtener el nombre de los empleados, los cuales tengan el numero id del puesto 8888  (Gerente):

SQL> SELECT DISTINCT NOMBRE FROM EMPLEADO, PUESTO WHERE ID_PUESTO=8888;

NOMBRE                                                                          
--------------------                                                            
CARLOTA                                                                         

SQL> SELECT DISTINCT NOMBRE FROM EMPLEADO WHERE ID_PUESTO=ANY (SELECT ID FROM PUESTO WHERE ID=8888 );

NOMBRE                                                                          
--------------------                                                            
CARLOTA                                                                         
                                                    

4.Obtener el dni del usuario de los cuales han hecho el pedido en diciembre y a su vez descartar todos aquellos cuyo numero de dni no empieze por cuatro: 

SQL> SELECT DNI_USUARIO FROM PEDIDO WHERE FECHA_PEDIDO BETWEEN '01-12-2015' AND '31-12-2015' GROUP BY DNI_USUARIO HAVING DNI_USUARIO LIKE '4%';

DNI_USUAR                                                                       
---------                                                                       
45876562C                                                                       
45615975B      

5.Crear una vista en donde se almacenan el la descripcion, la id y el nombre de usuario de un pedido. Almacenar en esta vista todos aquellos pedidos en cuya descripcion haya 2 productos de un mismo producto.
Mostrar luego el dni del usuario y la descripcion del pedido:

SQL> CREATE VIEW P(DESCRIPCION, ID, DNI_USUARIO)
  2  AS SELECT PED.DESCRIPCION, PED.ID, PED.DNI_USUARIO
  3  FROM PEDIDO PED
  4  WHERE PED.DESCRIPCION LIKE '2%'
  5  GROUP BY PED.DESCRIPCION, PED.ID, PED.DNI_USUARIO;

Vista creada.

SQL> SELECT DNI_USUARIO, DESCRIPCION FROM P;

DNI_USUAR                                                                       
---------                                                                       
DESCRIPCION                                                                     
--------------------------------------------------------------------------------
56390874E                                                                       
2 CAMISETAS                                                                     
                                                                                
45615975B                                                                       
2 MOVILES                                                                       
                            




















