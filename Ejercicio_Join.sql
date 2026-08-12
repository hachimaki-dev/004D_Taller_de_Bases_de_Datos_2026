--Una plataforma de venta de entradas necesita generar un resumen de una transacción. Para una transacción determinada se necesita conocer el nombre del cliente, el monto bruto de la compra, el descuento aplicado, el monto final pagado y el estado del pago.


SELECT * FROM CLIENTE;
SELECT * FROM TRANSACCION_PAGO;
SELECT * FROM RESERVA_TEMPORAL;

SELECT c.NOMBRE , rt.ESTADO AS ESTADO_DE_LA_RESERVA , tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_DE_LA_TRANSACCION  FROM CLIENTE c 
INNER JOIN RESERVA_TEMPORAL rt ON c.CLIENTE_ID = rt.CLIENTE_ID
INNER JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.CLIENTE_ID
WHERE c.CLIENTE_ID = 1;

DECLARE 
    TYPE boleta_cliente IS RECORD(
        nombre_cliente CLIENTE.NOMBRE%TYPE,
        estado_reserva RESERVA_TEMPORAL.ESTADO%TYPE,
        monto_bruto TRANSACCION_PAGO.MONTO_BRUTO%TYPE,
        descuento_transaccion TRANSACCION_PAGO.DESCUENTO%TYPE,
        monto_final TRANSACCION_PAGO.MONTO_FINAL%TYPE,
        estado_trasaccion TRANSACCION_PAGO.ESTADO%TYPE
    );

    v_boleta boleta_cliente;
BEGIN
    SELECT c.NOMBRE , rt.ESTADO AS ESTADO_DE_LA_RESERVA , tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_DE_LA_TRANSACCION INTO v_boleta.nombre_cliente, v_boleta.estado_reserva, v_boleta.monto_bruto, v_boleta.descuento_transaccion, v_boleta.monto_final, v_boleta.estado_trasaccion FROM CLIENTE c 
    INNER JOIN RESERVA_TEMPORAL rt ON c.CLIENTE_ID = rt.CLIENTE_ID
    INNER JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.CLIENTE_ID
    WHERE c.CLIENTE_ID = 1;
    

    DBMS_OUTPUT.PUT_LINE('************ BOLETA PUNTO TICKET *****************');
    DBMS_OUTPUT.PUT_LINE('NOMBRE CLIENTE : ' || v_boleta.nombre_cliente);
    DBMS_OUTPUT.PUT_LINE('MONTO BRUTO : ' || v_boleta.monto_bruto);
    DBMS_OUTPUT.PUT_LINE('MONTO BRUTO : ' || v_boleta.estado_reserva);
    DBMS_OUTPUT.PUT_LINE('DESCUENTO : ' || v_boleta.descuento_transaccion);
    DBMS_OUTPUT.PUT_LINE('NOMBRE CLIENTE : ' || v_boleta.monto_final);
    DBMS_OUTPUT.PUT_LINE('NOMBRE CLIENTE : ' || v_boleta.estado_trasaccion);

    DBMS_OUTPUT.PUT_LINE('************ RAZON SOCIAL *****************');
END;