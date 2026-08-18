
--Rellenar un VARRAY de forma NO PROCEDURAL
DECLARE 
    TYPE numero_asiento IS VARRAY(6) OF VARCHAR2(3);

    v_asiento numero_asiento := numero_asiento('A01', 'A02', 'A03', 'A04', 'A05', 'A06'); 
BEGIN 
    DBMS_OUTPUT.PUT_LINE('Se a asginado el asiento N°' ||  v_asiento(6));
    null;
END;
/






DECLARE 
    TYPE rut_usuarios IS VARRAY(3) OF varchar2(12);

    v_rut rut_usuarios := rut_usuarios('11.111.111-1', '22.222.222-2', '33.333.333-3');
BEGIN
    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_rut(1));
    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_rut(1));
    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_rut(3));
    null; 
END;
/



--Como seria entonces de manera procedural????
DECLARE 
    TYPE rut_usuarios IS VARRAY(3) OF varchar2(12);

    v_rut rut_usuarios := rut_usuarios();
BEGIN
    v_rut.EXTEND;
    v_rut(1) := '11.111.111-1';

    v_rut.EXTEND;
    v_rut(2) := '22.222.222-2';

    v_rut.EXTEND;
    v_rut(3) := '33.333.333-3';

    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_rut(1));
    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_rut(2));
    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_rut(3));
    
    null; 
END;
/

