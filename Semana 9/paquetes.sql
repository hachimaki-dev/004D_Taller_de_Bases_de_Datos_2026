--Validacion previa
--Ver si quedan entradas (obtener stock de entradas) > 0 vendo, ! no Puedo vender

--tener ua funcion que me devuelva la cantidad de entradas de una funcion en concreto ()


--Ahora que ya tengo la localidad y ademas tengo el sock de entradas.
--Procedo a vender
--Descontar el stock ( UPDATE STOCK_DISPONIBLE = STOCK_DISPONIBLE - Entradas_queCompre )



--1Determina el SPEC
CREATE OR REPLACE PACKAGE pkg_boleteria 
AS 

    g_total_entradas_vendidas NUMBER := 0;
    --El spec (o la firma) de mi funcion
    FUNCTION fn_verificar_stock( p_localidad_evento_id IN NUMBER ) RETURN NUMBER;

    PROCEDURE sp_actualizar_stock( p_localidad_evento_id IN NUMBER, p_entradas_vendidas IN NUMBER );

END pkg_boleteria;
/

--Ya tenemos declaro el spec, vamos ahora con
--EL BODY!

CREATE OR REPLACE PACKAGE BODY pkg_boleteria 
    AS
        --Declarando el body de mi funcion. Es decir la logica
        FUNCTION fn_verificar_stock( p_localidad_evento_id IN NUMBER ) RETURN NUMBER
        AS 
            v_stock NUMBER;
        BEGIN 
            SELECT STOCK_DISPONIBLE INTO v_stock FROM LOCALIDAD_EVENTO WHERE LOCALIDAD_EVENTO_ID = p_localidad_evento_id;

            RETURN v_stock;
        END fn_verificar_stock;

        --Declarar el body de mi PROCEDURE
        PROCEDURE sp_actualizar_stock( p_localidad_evento_id IN NUMBER, p_entradas_vendidas IN NUMBER )
        AS 
            v_stock NUMBER;
        BEGIN 

            v_stock := fn_verificar_stock(p_localidad_evento_id);

            IF v_stock <= 0 THEN 
                RAISE_APPLICATION_ERROR(-20001, 'Sin entradas disponibles para el evento solicitado');
            END IF;

            UPDATE LOCALIDAD_EVENTO SET STOCK_DISPONIBLE = STOCK_DISPONIBLE - p_entradas_vendidas WHERE LOCALIDAD_EVENTO_ID = p_localidad_evento_id;

            COMMIT;

            g_total_entradas_vendidas := g_total_entradas_vendidas + p_entradas_vendidas;

        END sp_actualizar_stock;

END pkg_boleteria;
/


SELECT STOCK_DISPONIBLE FROM LOCALIDAD_EVENTO WHERE LOCALIDAD_EVENTO_ID = 1;




DECLARE
    v_stock_disponible NUMBER;
BEGIN 
    v_stock_disponible := PKG_BOLETERIA.FN_VERIFICAR_STOCK(1);

    DBMS_OUTPUT.PUT_LINE('El stock es ' || v_stock_disponible);

    PKG_BOLETERIA.SP_ACTUALIZAR_STOCK(1, 1);

    DBMS_OUTPUT.PUT_LINE('El total de entradas vendidas es ' || PKG_BOLETERIA.g_total_entradas_vendidas);

END;
/