CREATE OR REPLACE PROCEDURE delete_previsao(p_id_previsao IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_previsao WHERE id_previsao = p_id_previsao;
    COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE delete_alerta(p_id_alerta IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_alerta WHERE id_alerta = p_id_alerta;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_gp_endereco(p_id_gp_endereco IN NUMBER) AS
BEGIN
        DELETE FROM t_nimbus_gp_endereco WHERE id_gp_endereco = p_id_gp_endereco;
        
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_endereco(p_id_endereco IN NUMBER) AS
BEGIN
        DELETE FROM t_nimbus_endereco WHERE id_endereco = p_id_endereco;

    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_bairro(p_id_bairro IN NUMBER) AS
BEGIN
       DELETE FROM t_nimbus_bairro WHERE id_bairro = p_id_bairro;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_cidade(p_id_cidade IN NUMBER) AS
BEGIN
        DELETE FROM t_nimbus_cidade WHERE id_cidade = p_id_cidade;

    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_estado(p_id_estado IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_estado WHERE id_estado = p_id_estado;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE delete_pais(p_id_pais IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_pais WHERE id_pais = p_id_pais;
    COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE delete_localizacao(p_id_localizacao IN NUMBER) AS
BEGIN
    DELETE FROM t_nimbus_localizacao WHERE id_localizacao = p_id_localizacao;
    
    COMMIT;
END;
/

BEGIN
    delete_previsao(1);
    delete_previsao(2);
    delete_alerta(1);
    delete_alerta(2);
    delete_gp_endereco(1);
    delete_endereco(1);
    delete_bairro(1);
    delete_cidade(1);
    delete_estado(1);
    delete_pais(1);
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
