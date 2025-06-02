CREATE OR REPLACE PROCEDURE inserir_pais (
    p_id_pais    IN t_nimbus_pais.id_pais%TYPE,
    p_nm_pais    IN t_nimbus_pais.nm_pais%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_pais VALUES (p_id_pais, p_nm_pais);
    COMMIT;
END;
/

BEGIN
    INSERT INTO t_nimbus_pais VALUES (1, 'Portugal');
    INSERT INTO t_nimbus_pais VALUES (2, 'Brasil');
    INSERT INTO t_nimbus_pais VALUES (3, 'Espanha');
    INSERT INTO t_nimbus_pais VALUES (4, 'Itália');
    INSERT INTO t_nimbus_pais VALUES (5, 'França');
    
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE inserir_estado (
    p_id_estado    IN t_nimbus_estado.id_estado%TYPE,
    p_nm_estado    IN t_nimbus_estado.nm_estado%TYPE,
    p_id_pais      IN t_nimbus_estado.id_pais%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_estado VALUES (p_id_estado, p_nm_estado, p_id_pais);
    COMMIT;
END;
/

BEGIN
    INSERT INTO t_nimbus_estado VALUES (1, 'Estado_1', 2);
    INSERT INTO t_nimbus_estado VALUES (2, 'Estado_2', 3);
    INSERT INTO t_nimbus_estado VALUES (3, 'Estado_3', 4);
    INSERT INTO t_nimbus_estado VALUES (4, 'Estado_4', 5);
    INSERT INTO t_nimbus_estado VALUES (5, 'Estado_5', 1);
    
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE inserir_cidade (
    p_id_cidade    IN t_nimbus_cidade.id_cidade%TYPE,
    p_nm_cidade    IN t_nimbus_cidade.nm_cidade%TYPE,
    p_id_estado    IN t_nimbus_cidade.id_estado%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_cidade VALUES ( p_id_cidade, p_nm_cidade, p_id_estado);
    COMMIT;
END;
/

BEGIN
    INSERT INTO t_nimbus_cidade VALUES (1, 'Cidade_1', 2);
    INSERT INTO t_nimbus_cidade VALUES (2, 'Cidade_2', 3);
    INSERT INTO t_nimbus_cidade VALUES (3, 'Cidade_3', 4);
    INSERT INTO t_nimbus_cidade VALUES (4, 'Cidade_4', 5);
    INSERT INTO t_nimbus_cidade VALUES (5, 'Cidade_5', 1);
    
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE inserir_localizacao (
    p_id_localizacao  IN t_nimbus_localizacao.id_localizacao%TYPE,
    p_nr_longitude    IN t_nimbus_localizacao.nr_longitude%TYPE,
    p_nr_latitude     IN t_nimbus_localizacao.nr_latitude%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_localizacao VALUES (p_id_localizacao, p_nr_longitude, p_nr_latitude);
    COMMIT;
END;
/

BEGIN
    INSERT INTO t_nimbus_localizacao VALUES (1, -642589, 517026);
    INSERT INTO t_nimbus_localizacao VALUES (2, 742203, 680369);
    INSERT INTO t_nimbus_localizacao VALUES (3, 917114, -574969);
    INSERT INTO t_nimbus_localizacao VALUES (4, -3345, 760431);
    INSERT INTO t_nimbus_localizacao VALUES (5, -278195, 627319);
    
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE inserir_bairro (
    p_id_bairro        IN t_nimbus_bairro.id_bairro%TYPE,
    p_nm_logradouro    IN t_nimbus_bairro.nm_logradouro%TYPE,
    p_id_cidade        IN t_nimbus_bairro.id_cidade%TYPE,
    p_id_localizacao   IN t_nimbus_bairro.id_localizacao%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_bairro VALUES (p_id_bairro, p_nm_logradouro, p_id_cidade, p_id_localizacao);
    COMMIT;
END;
/

BEGIN
    INSERT INTO t_nimbus_bairro VALUES (1, 'Rua_1', 2, 1);
    INSERT INTO t_nimbus_bairro VALUES (2, 'Rua_2', 3, 2);
    INSERT INTO t_nimbus_bairro VALUES (3, 'Rua_3', 4, 3);
    INSERT INTO t_nimbus_bairro VALUES (4, 'Rua_4', 5, 4);
    INSERT INTO t_nimbus_bairro VALUES (5, 'Rua_5', 1, 5);
    
    COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE inserir_endereco (
    p_id_endereco  IN t_nimbus_endereco.id_endereco%TYPE,
    p_nr_cep       IN t_nimbus_endereco.nr_cep%TYPE,
    p_id_bairro    IN t_nimbus_endereco.id_bairro%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_endereco VALUES (p_id_endereco, p_nr_cep, p_id_bairro);
    COMMIT;
END;
/


BEGIN
    INSERT INTO t_nimbus_endereco VALUES (1, 10000001, 1);
    INSERT INTO t_nimbus_endereco VALUES (2, 10000002, 2);
    INSERT INTO t_nimbus_endereco VALUES (3, 10000003, 3);
    INSERT INTO t_nimbus_endereco VALUES (4, 10000004, 4);
    INSERT INTO t_nimbus_endereco VALUES (5, 10000005, 5);
    
    COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE inserir_alerta (
    p_id_alerta        IN t_nimbus_alerta.id_alerta%TYPE,
    p_ds_risco         IN t_nimbus_alerta.ds_risco%TYPE,
    p_ds_tipo          IN t_nimbus_alerta.ds_tipo%TYPE,
    p_ds_mensagem      IN t_nimbus_alerta.ds_mensagem%TYPE,
    p_horario_alerta   IN t_nimbus_alerta.horario_alerta%TYPE,
    p_id_localizacao   IN t_nimbus_alerta.id_localizacao%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_alerta VALUES ( p_id_alerta, p_ds_risco, p_ds_tipo, p_ds_mensagem, p_horario_alerta, p_id_localizacao);
    COMMIT;
END;
/

BEGIN
    INSERT INTO t_nimbus_alerta VALUES (1, 'ALTO     ', 'Chuva Forte  ', 'Alerta de chuva intensa na região 1', TO_DATE('2024-05-29 14:32:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
    INSERT INTO t_nimbus_alerta VALUES (2, 'ALTO     ', 'Chuva Forte  ', 'Alerta de chuva intensa na região 2', TO_DATE('2024-05-28 14:32:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
    INSERT INTO t_nimbus_alerta VALUES (3, 'ALTO     ', 'Chuva Forte  ', 'Alerta de chuva intensa na região 3', TO_DATE('2024-05-27 14:32:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
    INSERT INTO t_nimbus_alerta VALUES (4, 'ALTO     ', 'Chuva Forte  ', 'Alerta de chuva intensa na região 4', TO_DATE('2024-05-26 14:32:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
    INSERT INTO t_nimbus_alerta VALUES (5, 'ALTO     ', 'Chuva Forte  ', 'Alerta de chuva intensa na região 5', TO_DATE('2024-05-25 14:32:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
    
    COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE inserir_usuario (
    p_id_usuario      IN t_nimbus_usuario.id_usuario%TYPE,
    p_nm_usuario      IN t_nimbus_usuario.nm_usuario%TYPE,
    p_ds_email        IN t_nimbus_usuario.ds_email%TYPE,
    p_senha           IN t_nimbus_usuario.senha%TYPE,
    p_id_localizacao  IN t_nimbus_usuario.id_localizacao%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_usuario VALUES (p_id_usuario, p_nm_usuario, p_ds_email, p_senha, p_id_localizacao);
    COMMIT;
END;
/

BEGIN

    inserir_usuario(1, 'Vanessa Lima', 'vanssalima@gmail.com', '106587423988', 1);
    inserir_usuario(2, 'Matheus Albuquerque', 'maalbuquerque@gmail.com', '787596321429', 2);
    inserir_usuario(3, 'Luisa Almeida', 'lualmeida@gmail.com', '963325895410', 3);
    inserir_usuario(4, 'Tiago dos Santos', 'tiagosantos@gmail.com', '385696321470', 4);
    inserir_usuario(5, 'Amélia Montenegro', 'ameliamont@gmail.com', '098756369855', 5);

END;
/


CREATE OR REPLACE PROCEDURE inserir_gp_endereco (
    p_id_gp_endereco  IN t_nimbus_gp_endereco.id_gp_endereco%TYPE,
    p_nm_grupo        IN t_nimbus_gp_endereco.nm_grupo%TYPE,
    p_id_usuario      IN t_nimbus_gp_endereco.id_usuario%TYPE,
    p_id_endereco     IN t_nimbus_gp_endereco.id_endereco%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_gp_endereco VALUES (p_id_gp_endereco, p_nm_grupo, p_id_usuario, p_id_endereco);
    COMMIT;
END;
/

BEGIN
    
    inserir_gp_endereco(1, 'Família', 1, 1);
    inserir_gp_endereco(2, 'Casa', 2, 2);
    inserir_gp_endereco(3, 'Casa Mãe', 3, 3);
    inserir_gp_endereco(4, 'Casa Vó', 4, 4);
    inserir_gp_endereco(5, 'Trabalho', 5, 5);
    

END;
/









