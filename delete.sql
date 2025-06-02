CREATE OR REPLACE PROCEDURE delete_gp_endereco(p_id_pais IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_gp_endereco
    WHERE id_endereco IN (
        SELECT e.id_endereco
        FROM t_nimbus_endereco e
        JOIN t_nimbus_bairro b ON e.id_bairro = b.id_bairro
        JOIN t_nimbus_cidade c ON b.id_cidade = c.id_cidade
        JOIN t_nimbus_estado es ON c.id_estado = es.id_estado
        WHERE es.id_pais = p_id_pais
    );
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_endereco(p_id_pais IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_endereco
    WHERE id_bairro IN (
        SELECT b.id_bairro
        FROM t_nimbus_bairro b
        JOIN t_nimbus_cidade c ON b.id_cidade = c.id_cidade
        JOIN t_nimbus_estado es ON c.id_estado = es.id_estado
        WHERE es.id_pais = p_id_pais
    );
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_bairro(p_id_pais IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_bairro
    WHERE id_cidade IN (
        SELECT c.id_cidade
        FROM t_nimbus_cidade c
        JOIN t_nimbus_estado es ON c.id_estado = es.id_estado
        WHERE es.id_pais = p_id_pais
    );
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_cidade(p_id_pais IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_cidade
    WHERE id_estado IN (
        SELECT id_estado FROM t_nimbus_estado WHERE id_pais = p_id_pais
    );
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_estado(p_id_pais IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_estado WHERE id_pais = p_id_pais;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_pais(p_id_pais IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_pais WHERE id_pais = p_id_pais;
    COMMIT;
END;
/

BEGIN
    delete_gp_endereco(1);
    delete_endereco(1);
    delete_bairro(1);
    delete_cidade(1);
    delete_estado(1);
    delete_pais(1);
END;
/

CREATE OR REPLACE PROCEDURE delete_alerta(p_id_localizacao IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_alerta
    WHERE id_localizacao = p_id_localizacao;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_localizacao(p_id_localizacao IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_gp_endereco
    WHERE id_usuario IN (
        SELECT id_usuario
        FROM t_nimbus_usuario
        WHERE id_localizacao = p_id_localizacao
    );

    DELETE FROM t_nimbus_endereco
    WHERE id_bairro IN (
        SELECT id_bairro
        FROM t_nimbus_bairro
        WHERE id_localizacao = p_id_localizacao
    );

    DELETE FROM t_nimbus_usuario WHERE id_localizacao = p_id_localizacao;
    DELETE FROM t_nimbus_bairro  WHERE id_localizacao = p_id_localizacao;
    DELETE FROM t_nimbus_localizacao WHERE id_localizacao = p_id_localizacao;

    COMMIT;
END;
/

BEGIN
    delete_alerta(1);
    delete_localizacao(1);
END;
/

CREATE OR REPLACE PROCEDURE delete_usuario(p_ds_email IN VARCHAR2, p_senha IN VARCHAR2) AS
    v_id_usuario NUMBER;
BEGIN
    SELECT id_usuario INTO v_id_usuario
    FROM t_nimbus_usuario
    WHERE ds_email = p_ds_email AND senha = p_senha;

    DELETE FROM t_nimbus_gp_endereco WHERE id_usuario = v_id_usuario;
    DELETE FROM t_nimbus_usuario WHERE id_usuario = v_id_usuario;

    COMMIT;
END;
/

BEGIN
    delete_usuario('maalbuquerque@gmail.com', '787596321429');
END;
/

