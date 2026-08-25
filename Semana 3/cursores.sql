
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

