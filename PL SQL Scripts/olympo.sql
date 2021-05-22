CREATE TABLE cargo (
    idCargo   VARCHAR2(5) CONSTRAINT pk_cargo PRIMARY KEY,
    nombre    VARCHAR2(20) CONSTRAINT cargo_nombreNN NOT NULL
);


CREATE TABLE categoria (
    idCategoria   VARCHAR2(5) CONSTRAINT pk_categoria PRIMARY KEY,
    nombre        VARCHAR2(20) CONSTRAINT cat_nombreNN NOT NULL
);

CREATE TABLE cliente (
    idCliente   VARCHAR2(5) CONSTRAINT pk_cliente PRIMARY KEY,
    dni         CHAR(8) CONSTRAINT cli_dniNN NOT NULL,
    nombre      VARCHAR2(50) CONSTRAINT cli_nombreNN NOT NULL,
    apellidos   NVARCHAR2(100) CONSTRAINT cli_apellidosNN NOT NULL,
    direccion   NVARCHAR2(100) CONSTRAINT cli_direccionNN NOT NULL,
    telefono    VARCHAR2(9)
);

CREATE TABLE consumo (
    idConsumo   VARCHAR2(5) CONSTRAINT pk_consumo PRIMARY KEY,
    fecha       DATE CONSTRAINT consumo_fechaNN NOT NULL
);

CREATE TABLE detalle_consumo (
    idDetalleConsumo   VARCHAR2(5) CONSTRAINT pk_det_consumo PRIMARY KEY,
    cantidad           NUMBER CONSTRAINT detConsumo_cantidad_NN NOT NULL,
    subtotal              NUMBER(5,2) CONSTRAINT detConsumo_subtotalNN NOT NULL,
    idProducto        VARCHAR2(5) CONSTRAINT detConsumo_idproductoNN NOT NULL,
    idConsumo         VARCHAR2(5) CONSTRAINT detConsumo_idConsumoNN NOT NULL
);

CREATE TABLE pedido (
    idPedido      VARCHAR2(5) CONSTRAINT pk_pedido PRIMARY KEY,
    fecha         DATE CONSTRAINT pedido_fechaNN NOT NULL,
    idPersonal   VARCHAR2(5) CONSTRAINT pedido_idPersonalNN NOT NULL
);

CREATE TABLE detalle_pedido (
    idDetallePedido   VARCHAR2(5) CONSTRAINT pk_det_pedido PRIMARY KEY,
    cantidad          NUMBER CONSTRAINT detPedido_cantidadNN NOT NULL,
    descuento         NUMBER(3,2),
    total             NUMBER(5,2) CONSTRAINT detPedido_totalNN NOT NULL,
    idpedido         VARCHAR2(5) CONSTRAINT detPedido_idpedidoNN NOT NULL,
    idproducto       VARCHAR2(5) CONSTRAINT detPedido_idproductoNN NOT NULL
);

CREATE TABLE habitacion (
    idHabitacion        VARCHAR2(5) CONSTRAINT pk_habitacion PRIMARY KEY,
    numero              VARCHAR2(3) CONSTRAINT habitacion_numeroNN NOT NULL,
    numPiso          VARCHAR2(2) CONSTRAINT habitacion_totalNN NOT NULL,
    precio              NUMBER(3,2) CONSTRAINT habitacion_precioNN NOT NULL,
    idTipoHabitacion   VARCHAR2(5) CONSTRAINT habitacion_idTipoHabitacionNN NOT NULL
);

CREATE TABLE tipo_habitacion (
    idTipoHabitacion   VARCHAR2(5) CONSTRAINT pk_tipo_habitacion PRIMARY KEY,
    nombre             VARCHAR2(20) CONSTRAINT tipoHabitacion_nombreNN NOT NULL,
    numCamas        VARCHAR2(1) CONSTRAINT tipoHabitacion_numCamasNN NOT NULL,
    baño         CHAR(1) CONSTRAINT tipoHabitacion_bañoNN NOT NULL,
    precio             NUMBER(3,2) CONSTRAINT tipoHabitacion_precioNN NOT NULL
);

CREATE TABLE comprobante_pago (
    idComprobantePago    VARCHAR2(5) CONSTRAINT pk_comprobante_pago PRIMARY KEY,
    fecha            DATE CONSTRAINT compPago_fechaNN NOT NULL,
    descuento        NUMBER(4,2),
    total            NUMBER(5,2) CONSTRAINT compPago_totalNN NOT NULL,
    idCliente       VARCHAR2(5) CONSTRAINT compPago_idClienteNN NOT NULL,
    idReservacion   VARCHAR2(5) CONSTRAINT compPago_idReservacionNN NOT NULL,
    idConsumo       VARCHAR2(5) CONSTRAINT compPago_idConsumoNN NOT NULL
);

CREATE TABLE contrato (
    idContrato      VARCHAR2(5) CONSTRAINT pk_contrato PRIMARY KEY,
    fechaEmision    DATE        CONSTRAINT contrato_fechaEmisionNN NOT NULL,
    fechaInicio     DATE        CONSTRAINT contrato_fechaInicioNN NOT NULL,
    fechaPago       DATE        CONSTRAINT contrato_fechaPagoNN NOT NULL,
    idPersonal      VARCHAR2(5) CONSTRAINT contrato_idPersonalNN NOT NULL,
    idTipoContrato  VARCHAR2(5) CONSTRAINT contrato_idTipoContratoNN NOT NULL
);

CREATE TABLE tipo_contrato (
    idTipoContrato  VARCHAR2(5) CONSTRAINT pk_tipo_contrato PRIMARY KEY,
    nombre          VARCHAR2(20)    CONSTRAINT tipoContrato_nombreNN NOT NULL,
    horasDiarias    NUMBER(1)   CONSTRAINT tipoContrato_horasDiariasNN NOT NULL,         
    sueldo          NUMBER(3,2) CONSTRAINT tipoContrato_sueldoNN NOT NULL
);

CREATE TABLE personal (
    idPersonal      VARCHAR2(5) CONSTRAINT pk_personal PRIMARY KEY,
    nombre          VARCHAR2(50) CONSTRAINT personal_nombreNN NOT NULL,
    apellidos       VARCHAR2(100) CONSTRAINT personal_apellidosNN NOT NULL,
    direccion       VARCHAR2(100) CONSTRAINT personal_direccionNN NOT NULL,
    telefono        VARCHAR2(9) CONSTRAINT personal_telefonoNN NOT NULL,
    sexo            CHAR(1) CONSTRAINT personal_sexoNN NOT NULL,
    idTurno         VARCHAR2(5) CONSTRAINT personal_turnoNN NOT NULL,
    idContrato      VARCHAR2(5) CONSTRAINT personal_idContratoNN NOT NULL,
    idCargo         VARCHAR2(5) CONSTRAINT personal_idCargoNN NOT NULL
);

CREATE TABLE producto (
    idProducto     VARCHAR2(5) CONSTRAINT pk_producto PRIMARY KEY,
    nombre         VARCHAR2(20) CONSTRAINT producto_nombreNN NOT NULL,
    precio         NUMBER(3,2) CONSTRAINT producto_precioNN NOT NULL,
    idCategoria   VARCHAR2(5) CONSTRAINT producto_idCategoriaNN NOT NULL,
    idProveedor   VARCHAR2(5) CONSTRAINT producto_idProveedorNN NOT NULL
);

CREATE TABLE proveedor (
    idProveedor   VARCHAR2(5) CONSTRAINT pk_proveedor PRIMARY KEY,
    nombre        VARCHAR2(20) CONSTRAINT proveedor_nombreNN NOT NULL,
    direccion     VARCHAR2(100) CONSTRAINT proveedor_direccionNN NOT NULL,
    ciudad        VARCHAR2(50) CONSTRAINT proveedor_ciudadNN NOT NULL,
    telefono      VARCHAR2(9) CONSTRAINT proveedor_telefonoNN NOT NULL
);

CREATE TABLE reservacion (
    idReservacion      VARCHAR2(5) CONSTRAINT pk_reservacion PRIMARY KEY,
    fecha              DATE CONSTRAINT reservacion_fechaNN NOT NULL,
    idPersonal         VARCHAR2(5) CONSTRAINT reservacion_idPersonalNN NOT NULL,
    idCliente          VARCHAR2(5) CONSTRAINT reservacion_idClienteNN NOT NULL,
    idHabitacion       VARCHAR2(5) CONSTRAINT reservacion_idHabitacionNN NOT NULL
);

CREATE TABLE turno (
    idTurno       VARCHAR2(5) CONSTRAINT pk_turno PRIMARY KEY,
    horaIngreso   DATE CONSTRAINT turno_horaIngresoNN NOT NULL,
    horaSalida    DATE CONSTRAINT turno_horaSalidaNN NOT NULL,
    diaDescanso     VARCHAR2(9)
);



--RESTRICCIONES

--FOREIGN KEY

ALTER TABLE detalle_consumo
ADD CONSTRAINT fk_detConsumo_consumo FOREIGN KEY(idConsumo) REFERENCES consumo(idConsumo);

ALTER TABLE detalle_consumo
ADD CONSTRAINT fk_detConsumo_producto FOREIGN KEY(idProducto) REFERENCES producto(idProducto);

ALTER TABLE detalle_pedido
ADD CONSTRAINT fk_detPedido_Pedido FOREIGN KEY(idPedido) REFERENCES pedido(idPedido);

ALTER TABLE detalle_pedido
ADD CONSTRAINT fk_detPedido_producto FOREIGN KEY(idProducto) REFERENCES producto(idProducto);

ALTER TABLE habitacion
ADD CONSTRAINT fk_habitacion_tipoHabitacion FOREIGN KEY(idTipoHabitacion) REFERENCES tipo_habitacion(idTipoHabitacion);

ALTER TABLE comprobante_pago
ADD CONSTRAINT fk_comprobantePago_reservacion FOREIGN KEY(idReservacion) REFERENCES reservacion(idReservacion);

ALTER TABLE comprobante_pago
ADD CONSTRAINT fk_comprobantePago_consumo FOREIGN KEY(idConsumo) REFERENCES consumo(idConsumo);


ALTER TABLE contrato
ADD CONSTRAINT fk_contrato_tipoContrato FOREIGN KEY(idTipoContrato) REFERENCES tipo_contrato(idTipoContrato);

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_personal FOREIGN KEY(idPersonal) REFERENCES personal(idPersonal);

ALTER TABLE personal
ADD CONSTRAINT fk_personal_turno FOREIGN KEY(idTurno) REFERENCES Turno(idTurno);

ALTER TABLE personal
ADD CONSTRAINT fk_personal_Contrato FOREIGN KEY(idContrato) REFERENCES contrato(idContrato);

ALTER TABLE personal
ADD CONSTRAINT fk_personal_cargo FOREIGN KEY(idCargo) REFERENCES cargo(idCargo);

ALTER TABLE producto
ADD CONSTRAINT fk_producto_categoria FOREIGN KEY(idCategoria) REFERENCES categoria(idCategoria);

ALTER TABLE producto
ADD CONSTRAINT fk_producto_proveedor FOREIGN KEY(idProveedor) REFERENCES proveedor(idProveedor);

ALTER TABLE reservacion
ADD CONSTRAINT fk_reservacion_personal FOREIGN KEY(idPersonal) REFERENCES personal(idPersonal);

ALTER TABLE reservacion
ADD CONSTRAINT fk_reservacion_cliente FOREIGN KEY(idCliente) REFERENCES cliente(idCliente);

ALTER TABLE reservacion
ADD CONSTRAINT fk_reservacion_habitacion FOREIGN KEY(idHabitacion) REFERENCES habitacion(idHabitacion);


--CHECK
ALTER TABLE tipo_habitacion
ADD CONSTRAINT tipoHabitacion_bañoCHECK CHECK((baño='S') OR (baño='N'));

ALTER TABLE personal
ADD CONSTRAINT personal_sexoCHECK CHECK((sexo='M') OR (sexo='F'));


--UNIQUE
ALTER TABLE cliente
ADD CONSTRAINT cliente_dniUNI UNIQUE (dni);

ALTER TABLE habitacion
ADD CONSTRAINT habitacion_numeroUNI UNIQUE (numero);

--ARREGLOS


alter table habitacion 
add estado char(7) ;

alter table turno 
drop column horaingreso;

alter table turno 
drop column horasalida;

alter table turno 
add horaingreso varchar2(10) not null;

alter table turno 
add horasalida varchar2(10) not null;

alter table habitacion
drop column numero;

alter table tipo_contrato
drop column sueldo;

alter table tipo_contrato
add sueldo number(6,2);

alter table producto
drop column precio;

alter table producto
add precio number(5,2);

alter table tipo_habitacion
drop column numcamas;

alter table tipo_habitacion
add numcamas number(1);

alter table tipo_habitacion
drop column precio;

alter table tipo_habitacion
add precio number(5,2);


--1 - CONSULTA QUE DEVUELVA LAS MUJERES QUE TRABAJAN EN EL HOTEL OLYMPO

select idpersonal, nombre, apellidos, sexo, idcargo 
from personal
where sexo = 'f';

--2 - MOSTRAR LOS COMPROBANTES DE PAGO QUE SUPERAN 90 SOLES

select *
from comprobante_pago
where total >90;

--3 - ORDENAR LOS CUARTOS POR PRECIO DESDE EL MAS CARO AL PRECIO MAS BARATO

select *
from habitacion
order by precio desc;


--4 - MOSTRAR LA LISTA DE CUARTOS OCUPADOS 
select *
from habitacion
where estado != 'libre';

--5 - MOSTRAR EL NUMERO DE HABITACIONES LIBRES QUE HAY EN UN PISO 
select count (idhabitacion) as numero_de_habitaciones
from habitacion
where numpiso = 'p1' and estado != 'libre';

--6 - LISTA LOS EMPLEADOS QUE SEAN HOMBRES Y CUYO NOMBRE EMPIECE CON ‘R’

select idpersonal, nombre, apellidos
from personal 
where nombre like 'r%' and sexo = 'M';

--7 - CAMBIAR DE CUARTO A UN CLIENTE 
update reservacion 
set idhabitacion = 'p02'
where idcliente = '1';     

--SUBCONSULTAS
--8 - MOSTRAR LOS CUARTOS QUE ESTAN LIBRES Y TIENEN PRECIO DIFERENTE AL PRECIO MAXIMO
select idhabitacion
from habitacion
where precio != (select max(precio)
                from habitacion)    and estado = 'libre';

--9 - MOSTRAR QUE EMPLEADOS FUERON CONTRATADOS EN EL ULTIMO MES 

select p.idpersonal, p.nombre, p.apellidos
from personal p inner join contrato c on (p.idcontrato = c.idcontrato )
where c.fechaemision > (SELECT sysdate - 30 FROM dual);

--10 - LISTAR LAS RESERVAS SOLICITADAS EL DIA MAS RECIENTE 

select *
from reservacion
where fecha > (select sysdate-7 from dual);

--11 - LISTAR LAS HABITACIONES QUE TENGAN 2 O MAS CAMAS

select numero as numero_de_habitacion
from   habitacion
where idtipohabitacion = (select idtipohabitacion
                            from tipo_habitacion
                            where numcamas >= 2);


-- 12 - MOSTRAR NOMBRE DE LOS EMPLEADOS QUE NO TRABAJEN DIA DOMINGO 

select idpersonal, nombre, apellidos
from personal 
where idturno = (select idturno
                        from turno 
                        where diadescanso = 'domingo');  

--13 - MOSTRAR LOS DATOS DEL EMPLEADO CON MAYOR SUELDO

select p.idpersonal, p.nombre, p.apellidos
from personal p inner join contrato c on (p.idcontrato = c.idcontrato)
                inner join tipo_contrato tc on (tc.idtipocontrato = c.idtipocontrato)
where tc.sueldo = (select max(sueldo)
                            from tipo_contrato );
                            
--COMBINADAS

--14 - MUESTRAR LA CANTIDAD DE CONSUMO DE UN CLIENTE Y LO QUE CONSUMIO

select c.idcliente, c.nombre, c.apellidos, dc.cantidad, dc.subtotal, p.nombre
from cliente c  inner join reservacion r on  (c.idcliente = r.idcliente)
                inner join comprobante_pago cp on (cp.idreservacion = r.idreservacion)
                inner join consumo cn on (cn.idconsumo = cp.idconsumo)
                inner join detalle_consumo dc on (cn.idconsumo = dc.idconsumo)
                inner join producto p on (p.idproducto = dc.idproducto);

--15 - SELECCIONA LA FECHA Y EL NOMBRE DE LOS CLIENTE QUE HAN RESERVADO UN CUARTO
select c.nombre, c.apellidos, r.fecha                         
from cliente c inner join reservacion r on  (c.idcliente = r.idcliente);

 
-- 16 - INDICAR EL PRODUCTO MAS CONSUMIDO 
select *
from   (select p.nombre,  count (p.idproducto)
        from detalle_consumo dc inner join producto p on (dc.idproducto = p.idproducto)
        group by p.nombre
        order by count (p.idproducto) desc
        )
where rownum = 1;

-- 17 - LISTAR LOS EMPLEADOS CON SU RESPECTIVO CARGO Y FECHA DE CONTRATO

select p.idpersonal, p.nombre, p.apellidos, ca.nombre as cargo, c.fechaemision as fecha_De_Contrato
from personal p inner join cargo ca on (p.idcargo = ca.idcargo)
                inner join contrato c on (p.idcontrato = c.idcontrato );
                
                
-- 18 - MOSTRAR LA CANTIDAD DE PEDIDOS ATENDIDOS POR CADA EMPLEADO

select p.idpersonal, p.nombre, p.apellidos, count(pe.idpedido) as Pedidos 
from personal p left join pedido pe on (pe.idpersonal = p.idpersonal )
group by p.idpersonal, p.nombre, p.apellidos
order by count(pe.idpedido) desc;

-- 19 - MOSTRAR LA CANTIDAD DE RESERVAS QUE TUVO UNA HABITACION

select h.idhabitacion, count(r.idreservacion) as reservaciones_Totales 
from habitacion h left join reservacion r on (h.idhabitacion = r.idhabitacion )
group by h.idhabitacion;

-- 20 -LISTAR LOS CLIENTES QUE TUVIERON UN DESCUENTO 

select c.idCliente, c.nombre, c.apellidos
from cliente c inner join reservacion r on (c.idcliente = r.idcliente )
                inner join comprobante_pago cp on (r.idreservacion = cp.idreservacion)
where cp.descuento >0;

-------------------------------------------------------------------------------------------
--SECUENCIAS


CREATE SEQUENCE comprobante_pago_sec
INCREMENT BY 1
START WITH 1
NOMAXVALUE 
NOMINVALUE
NOCYCLE
ORDER;


CREATE SEQUENCE tipoHabitacion_sec
INCREMENT BY 1
START WITH 1
NOMAXVALUE 
NOMINVALUE
NOCYCLE
ORDER;

CREATE SEQUENCE turno_sec
INCREMENT BY 1
START WITH 1
NOMAXVALUE 
NOMINVALUE
NOCYCLE
ORDER;

CREATE SEQUENCE consumo_sec
INCREMENT BY 1
START WITH 1
NOMAXVALUE 
NOMINVALUE
NOCYCLE
ORDER;

CREATE SEQUENCE reservacion_sec
INCREMENT BY 1
START WITH 1
NOMAXVALUE 
NOMINVALUE
NOCYCLE
ORDER;

--INDICES

CREATE INDEX IDX_cliente_apellidos
ON cliente (apellidos);

CREATE INDEX IDX_reservacion_fecha
ON reservacion (fecha);

--NUEVAS TABLAS

create table Estadohabitacion (
    idEstadoHabitacion int CONSTRAINT pk_estadoHabitacion PRIMARY KEY,
    desEstHab varchar2(50) not null
)


create table EstadoProducto (
    idEstadoProducto int CONSTRAINT pk_estadoProducto PRIMARY KEY,
    desEstProd varchar2(50) not null
)

create table tipoComprobante(
    idTipoComprobante int CONSTRAINT pk_tipoComprobante PRIMARY KEY,
    desTipoComprobante varchar2(50) not null
)
--MODIFICACIONES
alter table habitacion
add idEstadoHabitacion int;

alter table Producto
add idEstadoProducto int;

alter table comprobante_pago
add idTipoComprobante int;

--RESTRICCIONES 
alter table Habitacion
ADD CONSTRAINT fk_Habitacion_estadoHabitacion FOREIGN KEY(idEstadoHabitacion) REFERENCES Estadohabitacion(idEstadoHabitacion);
    

alter table Producto
ADD CONSTRAINT fk_Producto_estadoProducto FOREIGN KEY(idEstadoProducto) REFERENCES EstadoProducto(idEstadoProducto);

alter table comprobante_pago
ADD CONSTRAINT fk_comprobantePago_tipoComprobante FOREIGN KEY(idTipoComprobante) REFERENCES TipoComprobante(idTipoComprobante);

--PROCEDIMIENTOS

--1.Registrar cliente 
CREATE OR REPLACE
PROCEDURE REGISTRAR_CLIENTE (   P_idCliente IN cliente.idCliente%TYPE, 
				P_dni IN cliente.dni%TYPE,
				P_nombre IN cliente.nombre%TYPE,
				P_apellidos IN cliente.apellidos%TYPE,
				P_direccion IN cliente.direccion%TYPE,
				P_telefono IN cliente.telefono%TYPE)
IS
BEGIN
	INSERT INTO cliente(idCliente, dni, nombre, apellidos, direccion, telefono)
	VALUES(P_idCliente, P_dni, P_nombre, P_apellidos, P_direccion, P_telefono);
EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	DBMS_OUTPUT.PUT_LINE('Se intentó ingresar un cliente duplicado');
END REGISTRAR_CLIENTE;


--2.Registrar personal 

CREATE OR REPLACE
PROCEDURE  REGISTRAR_PERSONAL(  P_idPersonal IN personal.idPersonal%TYPE,
				P_nombre IN personal.nombre%TYPE,
				P_apellidos IN personal.apellidos%TYPE,
				P_direccion IN personal.direccion%TYPE,
				P_telefono IN personal.telefono%TYPE,
				P_sexo IN personal.sexo%TYPE,
				P_idTurno IN personal.idTurno%TYPE,
				P_idContrato IN personal.idContrato%TYPE,
				P_idCargo IN personal.idCargo%TYPE)
IS
BEGIN
	INSERT INTO personal (idPersonal, nombre, apellidos, direccion, telefono, 
			      sexo, idTurno, idContrato, idCargo)
	VALUES( P_idPersonal, P_nombre, P_apellidos, P_direccion, P_telefono,
		P_sexo, P_idTurno, P_idContrato, P_idCargo);
EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	DBMS_OUTPUT.PUT_LINE('Se intentó ingresar un empleado duplicado');
END REGISTRAR_PERSONAL;


--3.Registrar proveedor 

CREATE OR REPLACE
PROCEDURE REGISTRAR_PROVEEDOR(  P_idProveedor IN proveedor.idProveedor%TYPE,
				P_nombre IN proveedor.nombre%TYPE,
				P_direccion IN proveedor.direccion%TYPE,
				P_ciudad IN proveedor.ciudad%TYPE,
				P_telefono IN proveedor.telefono%TYPE)
IS
BEGIN
	INSERT INTO proveedor(idProveedor, nombre, direccion, ciudad, telefono)
	VALUES(P_idProveedor, P_nombre, P_direccion, P_ciudad, P_telefono);
EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	DBMS_OUTPUT.PUT_LINE('Se intentó ingresar un proveedor duplicado');
END REGISTRAR_PROVEEDOR;

--4.Registrar pedido de un personal 

CREATE OR REPLACE
PROCEDURE REGISTRAR_PEDIDO_PERSONAL (   P_idPedido IN pedido.idPedido%TYPE,
					P_fecha IN pedido.fecha%TYPE,
					P_idPersonal IN pedido.idPersonal%TYPE)
IS
BEGIN
	INSERT INTO pedido(idPedido, fecha, idPersonal)
	VALUES(P_idPedido, P_fecha, P_idPersonal);
EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	DBMS_OUTPUT.PUT_LINE('Se intentó ingresar un pedido duplicado');
END REGISTRAR_PEDIDO_PERSONAL;

--5.Registrar nuevo producto

CREATE OR REPLACE
PROCEDURE REGISTRAR_PRODUCTO(   P_idProducto IN producto.idProducto%TYPE,
				P_nombre IN producto.nombre%TYPE,
				P_precio IN producto.precio%TYPE,
				P_idCategoria IN producto.idCategoria%TYPE,
				P_idProveedor IN producto.idProveedor%TYPE)
IS
BEGIN
	INSERT INTO producto(idProducto, nombre, precio, idCategoria, idProveedor)
	VALUES(P_idProducto, P_nombre, P_precio, P_idCategoria, P_idProveedor);
EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	DBMS_OUTPUT.PUT_LINE('Se intentó ingresar un producto duplicado');
END REGISTRAR_PRODUCTO;


--6.REGISTRAR COMPROBANTE DE PAGO DE UN CLIENTE
CREATE OR REPLACE PROCEDURE registrarComprobante 
(   p_id comprobante_pago.idcomprobantepago%type,
    p_fecha comprobante_pago.fecha%type,
    p_desc comprobante_pago.descuento%type,
    p_total comprobante_pago.total%type,
    p_idreserv comprobante_pago.idreservacion%type,
    p_idconsumo comprobante_pago.idconsumo%type
    )
IS
BEGIN
    INSERT INTO comprobante_pago(idcomprobantepago, fecha, descuento, total, idreservacion,idconsumo)
	VALUES(p_id, p_fecha, p_desc, p_total, p_idreserv, p_idconsumo );
EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	DBMS_OUTPUT.PUT_LINE('Se intentó ingresar un producto duplicado');
END registrarComprobante;


--7.	Actualizar sueldo de un personal de trabajo
CREATE OR REPLACE PROCEDURE modificarSueldo 
(   p_id personal.idpersonal%type, 
    nuevoSueldo tipo_contrato.sueldo%type)
IS
    v_idtc tipo_contrato.idtipocontrato%type;
BEGIN
    SELECT tc.idtipocontrato INTO v_idtc
    FROM personal p inner join contrato c on (p.idcontrato=c.idcontrato)
                    inner join tipo_contrato tc on (c.idtipocontrato = tc.idtipocontrato)
    WHERE p.idpersonal = p_id;
    
    UPDATE tipo_contrato SET sueldo = nuevoSueldo
    WHERE idtipocontrato = v_idtc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('PERSONAL DE TRABAJO NO ENCONTRADO');
END modificarSueldo;

--8. ACTUALIZAR EL PERIODO DE HOSPEDAJE DE UNA RESERVACION
CREATE OR REPLACE PROCEDURE actualizarReservacion 
(   p_id cliente.idcliente%type,
    p_ingreso reservacion.fechaentrada%type,
    p_salida reservacion.fechasalida%type)
IS
    v_idRes reservacion.idreservacion%type;
    v_ultima reservacion.fecha%type;
BEGIN
    SELECT re.idreservacion INTO v_idres
    FROM cliente c inner join reservacion re on (c.idcliente = re.idcliente)
    WHERE c.idcliente = p_id and re.fecha = (SELECT max(re.fecha) 
                                            FROM cliente c inner join reservacion re on (c.idcliente = re.idcliente)
                                            WHERE c.idcliente = p_id );
    UPDATE reservacion 
    SET    fechaentrada = p_ingreso,
            fechasalida = p_salida    
    WHERE idreservacion = v_idRes;
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('CLIENTE NO ENCONTRADO');
END actualizarReservacion;

--9 ACTUALIZAR ESTADO DE UNA HABITACION
CREATE OR REPLACE PROCEDURE actualizarEstadoHabitacion
(   p_est estadohabitacion.desesthab%type,
    p_id    habitacion.idhabitacion%type)
IS
    v_idEst estadohabitacion.idestadohabitacion%type;
BEGIN
    SELECT idestadohabitacion INTO v_idEst
    FROM estadohabitacion 
    WHERE desesthab = p_est;
    
    UPDATE habitacion SET idestadohabitacion = v_idEst
    WHERE idhabitacion = p_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('HABITACION NO ENCONTRADA');
END actualizarEstadoHabitacion;

--10 ACTUALIZAR ESTADO DE UN PRODUCTO
CREATE OR REPLACE PROCEDURE actualizarEstadoProducto
(   p_est estadoproducto.desestprod%type,
    p_id    producto.idproducto%type)
IS
    v_idEst estadoproducto.idestadoproducto%type;
BEGIN
    SELECT idestadoproducto INTO v_idEst
    FROM estadoproducto 
    WHERE desestprod = p_est;
    
    UPDATE producto SET idestadoproducto = v_idEst
    WHERE idproducto = p_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('PRODUCTO NO ENCONTRADO');
END actualizarEstadoProducto;

--11 MODIFICAR DIA DE DESCANSO DE UN TRABAJADOR
CREATE OR REPLACE PROCEDURE actualizarTurno
(   p_id personal.idpersonal%type, 
    p_descanso turno.diadescanso%type)
IS
    v_id turno.idturno%type;
BEGIN
    SELECT t.idTurno INTO v_id
    FROM personal p inner join turno t on (p.idturno = t.idturno)
    WHERE p.idpersonal = p_id;
    
    UPDATE turno SET diadescanso = p_descanso
    WHERE idTurno = diadescanso;
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('PERSONAL NO ENCONTRADO');
END actualizarTurno;


--FUNCIONES


--1	Calcular sueldo neto (sueldoNeto = sueldo-descuento+bono) 
CREATE OR REPLACE FUNCTION calcularSueldoNeto(idPersonal number, descuento number, bono number)
RETURN number
IS
    v_sueldoNeto number(6,2);
    v_sueldo tipo_contrato.sueldo%type;
BEGIN
    SELECT tc.sueldo INTO v_sueldo
    FROM tipo_contrato tc inner join contrato c on (tc.idtipocontrato = c.idtipocontrato)
                            inner join personal p on (c.idcontrato = p.idcontrato)
    WHERE p.idpersonal = idPersonal;
        v_sueldoNeto := v_sueldo -descuento + bono;
        
    RETURN v_sueldoNeto;
END;

--2.	Calcular el bono por horas extras de un trabajador 
CREATE OR REPLACE FUNCTION calcularBonoEmpleado (idPersonal personal.idpersonal%type)
RETURN number
IS
    v_bonoTotal number(6,2);
    v_PagoPorHora int := 10 ;
    v_HorasExtra int;
BEGIN
    SELECT d.horasExtra INTO v_horasextra 
    FROM historial_asis ha inner join personal p on(ha.idhistorial = p.idhistorial )
                    inner join dia d on(ha.idDia = d.idDia)
    WHERE p.idpersonal = idPersonal;
    
    v_bonototal := v_horasextra * v_pagoporhora;
    
RETURN v_bonoTotal;
END;

--3.	Calcular descuento de salario por los dias que falto un personal de trabajo 
CREATE OR REPLACE FUNCTION calcularDescuentoEmpleado(idPersonal personal.idpersonal%type)
RETURN number
IS
    v_Descuento number(6,2);
    v_DescuentoPorDia int := 10;
    v_diasFaltados int;
BEGIN
    SELECT count(d.fecha) INTO v_diasfaltados
    FROM personal p inner join historial_asis ha on (p.idhistorial = ha.idhistorial )
                    inner join dia d on (ha.idDia = d.idDia)
                    inner join asistencia a on (d.idAsistencia = a.idAsistencia)
    WHERE p.idPersonal = idPersonal and a.desasistencia = 'falto';
    v_Descuento := v_descuentopordia * v_diasfaltados;
RETURN v_Descuento;
END;



--4.	Calcular descuento de comprobante de pago
CREATE OR REPLACE FUNCTION calcularDescuentoComprobante(idCli cliente.idcliente%type)
RETURN number
IS
    v_descuento number;
    v_total number;
BEGIN
    SELECT cp.total INTO v_total
    FROM cliente c inner join reservacion r on (c.idcliente = r.idcliente )
                    inner join comprobante_pago cp on (cp.idreservacion = r.idreservacion)
    WHERE c.idCliente = idCli;
    
    IF(v_total >=200 ) THEN
        v_descuento := v_total*0.10;
    ELSIF (v_total >=90) THEN
        v_descuento := v_total*0.05;
    ELSE
        v_descuento := 0;
    END IF;
RETURN v_descuento;
END;

--5 Calcular el consumo de un reservacion 
CREATE OR REPLACE FUNCTION calcularConsumoReservacion(idres reservacion.idreservacion%type)
RETURN number
IS
    CURSOR c1 IS
    SELECT dc.subtotal
    FROM reservacion r inner join comprobante_pago cp on (r.idreservacion = cp.idreservacion)
                    inner join consumo co on (cp.idconsumo = co.idconsumo)
                    inner join detalle_consumo dc on (dc.idconsumo = co.idconsumo)
    WHERE r.idreservacion = idres;
    
    v_total number(4,2) := 0;
    v_subtotal detalle_consumo.subtotal%type;
BEGIN
    OPEN c1;
    LOOP 
        FETCH c1 INTO v_subtotal;
        v_total := v_total+v_subtotal;
        EXIT WHEN c1%NOTFOUND;
    END LOOP;    
    CLOSE c1;
RETURN v_total;
END;



--6.	Mostrar la fecha en que se desocupa un cuarto de un tipo especifico

CREATE OR REPLACE FUNCTION fechaDesalojo (idtipo tipo_habitacion.idtipohabitacion%type)
RETURN reservacion.fechasalida%type
IS
    v_fecha reservacion.fechasalida%type;
BEGIN
    SELECT min(re.fechasalida) INTO v_fecha
    FROM reservacion re inner join habitacion h on ( re.idhabitacion = h.idhabitacion)
                    inner join tipo_habitacion th on ( h.idtipohabitacion = th.idtipohabitacion)
    WHERE th.idtipohabitacion = idtipo;
RETURN v_fecha;
END;

--7.    Cuantas faltas tiene un empleado en un mes
CREATE OR REPLACE FUNCTION faltasDelMes (idemp personal.idpersonal%type, mes int, anio int)
RETURN number
IS
    v_faltas number;
BEGIN
    SELECT count(d.iddia) INTO v_faltas
    FROM personal p inner join historial_asis ha on (p.idhistorial = ha.idhistorial)
                    inner join dia d on (ha.iddia = d.iddia)
    WHERE (p.idpersonal = idemp) and (d.idasistencia =3) and (extract(month from d.fecha) = mes) and (extract(year from d.fecha) = anio); 
    RETURN v_faltas;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Ocurrio un error');
END;

--8. Cantidad de reservas de un mes
CREATE OR REPLACE FUNCTION cantReservasMes(mes int, anio int)
RETURN number
IS
    v_cant number;
BEGIN
    SELECT count(idreservacion) INTO v_cant
    FROM reservacion
    WHERE (extract(month from fecha) = mes) and (extract(year from fecha) = anio);
    RETURN v_cant;
END;

--9. Mostrar las ganancias de un mes
CREATE OR REPLACE FUNCTION gananciasMes (mes int, anio int)
RETURN number
IS
    CURSOR c1 IS
    SELECT total 
    FROM comprobante_pago
    WHERE(extract(month from fecha) = mes) and (extract(year from fecha) = anio);
    v_ganancia number :=0;
    v_total number;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO v_total;
        v_ganancia := v_ganancia + v_total; 
        EXIT WHEN c1%NOTFOUND;
    END LOOP;
    CLOSE c1;
    RETURN v_ganancia;
END;

--10. Calcular el total de un comprobante de pago de un cliente
CREATE OR REPLACE FUNCTION pagoTotal (idcli cliente.idcliente%type)
RETURN comprobante_pago.total%type
IS
    v_pagoTotal comprobante_pago.total%type;
    v_pagoHab tipo_habitacion.precio%type;
    v_idhab habitacion.idhabitacion%type;
BEGIN
    SELECT th.precio, re.idreservacion INTO v_pagohab,v_idhab
    FROM cliente c inner join reservacion re on (c.idcliente = re.idcliente)
                    inner join habitacion h on (re.idhabitacion = h.idhabitacion)
                    inner join tipo_habitacion th on (h.idtipohabitacion = th.idtipohabitacion )
    WHERE c.idcliente = idcli;
    
    v_pagototal := v_pagohab + calcularconsumoreservacion(v_idhab);
    RETURN v_pagoTotal;
END;






