/*FICHERO PARA HACER CONSULTAS (CADA UNO DESARROLLARA LAS SUYAS)*/

/*IVAN*/





/*ASIER*/

/*ENUNCIADO: Se quiere hacer un estudio para determinar si el salario de los contables es
demasiado bajo, para ello:*/
/*Obtener el nombre, puesto y salario de los trabajadores que tienen un salario
superior a la media del salario del puesto de contable*/


/*ENUNCIADO: Se quiere conocer el empeño de los trabajadores que procesan pedidos. Como
esto es una empresa nos dedicaremos a mirar los pedidos más caros. (En sumatorio de precios)*/
/*Obtener quién es el empleado que ha procesado más pedidos (teniendo en cuenta el importe) durante el último mes, considerando
la suma de los importes de todas las consultas atendidas durante el periodo. Se debe indicar el número
de la seguridad social y nombre del empleado. También mostrar el importe total facturado de los pedidos que ha procesado.
Se puede hacer creando una vista.*/

/*ENUNCIADO: Se quiere hacer una reducción de plantilla no , queremos ver cuales son los empleados que menor rendimiento
han tenido en la empresa*/
/*Obtener cuántos pedidos ha atendido cada empleado del departamento de quejas y reclamaciones durante el
último año, indicando el número de la seguridad social y el número de quejas y reclamaciones atendidas para todos
los que hayan realizado menos de 10.
   
*/




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