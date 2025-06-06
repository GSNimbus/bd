CREATE OR REPLACE FUNCTION contador_risco(
    p_ds_risco IN VARCHAR2
) RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM T_NIMBUS_ALERTA
    WHERE ds_risco = p_ds_risco;

    RETURN v_count;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END contador_risco;
/

SELECT contador_risco('BAIXO') AS alertas FROM DUAL;
/

CREATE OR REPLACE FUNCTION localizacao_usuario(p_id_usuario IN NUMBER)
RETURN VARCHAR2
IS
    v_nr_latitude   T_NIMBUS_LOCALIZACAO.nr_latitude%TYPE;
    v_nr_longitude  T_NIMBUS_LOCALIZACAO.nr_longitude%TYPE;
    v_nm_usuario    T_NIMBUS_USUARIO.nm_usuario%TYPE;
BEGIN
    SELECT l.nr_latitude, l.nr_longitude, u.nm_usuario
    INTO v_nr_latitude, v_nr_longitude, v_nm_usuario
    FROM T_NIMBUS_USUARIO u
    JOIN T_NIMBUS_GP_ENDERECO g ON u.id_usuario = g.id_usuario
    JOIN T_NIMBUS_ENDERECO e ON g.id_endereco = e.id_endereco
    JOIN T_NIMBUS_BAIRRO b ON e.id_bairro = b.id_bairro
    JOIN T_NIMBUS_LOCALIZACAO l ON b.id_localizacao = l.id_localizacao
    WHERE u.id_usuario = p_id_usuario
    FETCH FIRST 1 ROWS ONLY;

    RETURN 'Nome: ' || v_nm_usuario || '| Latitude: ' || v_nr_latitude || '| Longitude: ' || v_nr_longitude;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Localização não definida';
END localizacao_usuario;
/

SELECT localizacao_usuario(5) AS localizacao FROM DUAL;
/
