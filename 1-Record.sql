SELECT * FROM CLIENTE;
DECLARE 

TYPE datos_cliente IS RECORD(
    rut_cliente varchar2(12),
    nombre_cliente varchar(80),
    email_cliente varchar2(150)
);

registro_cliente datos_cliente;


BEGIN 
SELECT RUT, NOMBRE, EMAIL INTO registro_cliente.rut_cliente, registro_cliente.nombre_cliente, registro_cliente.email_cliente FROM CLIENTE WHERE CLIENTE_ID = 2;

DBMS_OUTPUT.PUT_LINE('Los datos del cliente 2 son ' || ' ' || registro_cliente.rut_cliente || ' ' || registro_cliente.nombre_cliente || ' ' || registro_cliente.email_cliente);
    null;
END;
/
SELECT RUT, NOMBRE, EMAIL FROM CLIENTE WHERE CLIENTE_ID = 2;



--SELECT * FROM CLIENTE;
--DECLARE 
--    v_rut CLIENTE.RUT%TYPE;
--    v_nombre CLIENTE.NOMBRE%TYPE;
--    v_email CLIENTE.EMAIL%TYPE;
--BEGIN 
--    SELECT RUT, NOMBRE, EMAIL INTO v_rut, v_nombre, v_email FROM CLIENTE WHERE CLIENTE_ID = 2;
--
--    DBMS_OUTPUT.PUT_LINE('El rut del usuario 2 es ' || v_rut);
--    null;
--END;
--/
--SELECT RUT, NOMBRE, EMAIL FROM CLIENTE WHERE CLIENTE_ID = 2;