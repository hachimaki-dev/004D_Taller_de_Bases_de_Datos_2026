
--Cursor simple tabla cliente
SELECT * FROM CLIENTE;

DECLARE 
    CURSOR c_clientes IS 
        SELECT * FROM CLIENTE;
BEGIN
    FOR cada_cliente IN c_clientes LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre ' || cada_cliente.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('RUT ' || cada_cliente.RUT);
    END LOOP;
    null; 
END;
/




--Cursor con where

SELECT * FROM CLIENTE 
where NOMBRE LIKE '%a%';

declare
    CURSOR c_nombre_a is
        SELECT * FROM CLIENTE 
        where NOMBRE LIKE '%a%';

    v_contador number:= 1;
begin

    FOR nombre_a IN c_nombre_a LOOP
        
        DBMS_OUTPUT.PUT_LINE('Vuelta: ' || v_contador);
        DBMS_OUTPUT.PUT_LINE('Nombre: '|| nombre_a.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('Nombre: '|| nombre_a.RUT);
        v_contador:= v_contador + 1;
    END LOOP;
    null;
end;
/


--CUrsor con JOIN
SELECT c.NOMBRE , rt.ESTADO AS ESTADO_DE_LA_RESERVA , tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_DE_LA_TRANSACCION  FROM CLIENTE c 
INNER JOIN RESERVA_TEMPORAL rt ON c.CLIENTE_ID = rt.CLIENTE_ID
INNER JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.CLIENTE_ID
WHERE tp.ESTADO = 'APROBADO' ;

--Generar un reporte con todas las transacciones aprobadas
DECLARE 
    CURSOR c_transacciones_aprobadas IS 
        SELECT c.NOMBRE , C.RUT, rt.ESTADO AS ESTADO_DE_LA_RESERVA , tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_DE_LA_TRANSACCION  FROM CLIENTE c 
        INNER JOIN RESERVA_TEMPORAL rt ON c.CLIENTE_ID = rt.CLIENTE_ID
        INNER JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.CLIENTE_ID
        WHERE tp.ESTADO = 'APROBADO' ;
BEGIN

    FOR por_cada_transaccion IN c_transacciones_aprobadas LOOP 
        DBMS_OUTPUT.PUT_LINE('********REPORTE TRANSACCIONES APROBADAS*********');
        DBMS_OUTPUT.PUT_LINE('Nombre ' || por_cada_transaccion.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('RUT ' || por_cada_transaccion.RUT);
        DBMS_OUTPUT.PUT_LINE('Monto final ' || por_cada_transaccion.MONTO_FINAL);
        DBMS_OUTPUT.PUT_LINE('Estado Transacción ' || por_cada_transaccion.ESTADO_DE_LA_TRANSACCION);
    END LOOP;
    null; 
END;
/

--CURSOR CON PARAMETROS - CURSORES COMPLEJOS
--Antes de, insertemos unos varguitas

INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO) VALUES ('11.111.111-1', 'Fernandito', 'Vargas', 'fvargas@gmail.com', '+5611111111', SYSTIMESTAMP);

INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO) VALUES ('22.222.222-2', 'Luciana', 'Vargas', 'lvargas@gmail.com', '+56922222222', SYSTIMESTAMP);

INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO) VALUES ('33.333.333-6', 'Ricardito', 'Vargas', 'rvargas@gmail.com', '+5633333333',  SYSTIMESTAMP);
COMMIT;
SELECT * FROM CLIENTE;

DECLARE
    CURSOR c_clientes_por_apellido(p_apellido VARCHAR2) IS
            SELECT cliente_id, nombre, apellido, email
            FROM CLIENTE
            WHERE APELLIDO = p_apellido;

BEGIN
    FOR un_cliente IN c_clientes_por_apellido('Vargas')
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            un_cliente.nombre
        );
    END LOOP;
END;
/