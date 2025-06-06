CREATE OR REPLACE PROCEDURE inserir_pais (
    p_id_pais IN t_nimbus_pais.id_pais%TYPE,
    p_nm_pais IN t_nimbus_pais.nm_pais%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_pais VALUES (p_id_pais, p_nm_pais);
    COMMIT;
END;
/

BEGIN
    inserir_pais(1, 'Brasil');
    inserir_pais(2, 'México');
    inserir_pais(3, 'Brasil');
    inserir_pais(4, 'Brasil');
    inserir_pais(5, 'Brasil');
END;
/

CREATE OR REPLACE PROCEDURE inserir_estado (
    p_id_estado IN t_nimbus_estado.id_estado%TYPE,
    p_nm_estado IN t_nimbus_estado.nm_estado%TYPE,
    p_id_pais   IN t_nimbus_estado.id_pais%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_estado VALUES (p_id_estado, p_nm_estado, p_id_pais);
    COMMIT;
END;
/

BEGIN
    inserir_estado(1, 'São Paulo', 1);
    inserir_estado(2, 'Rio de Janeiro', 2);
    inserir_estado(3, 'Amazonas', 3);
    inserir_estado(4, 'Rio Grande do Sul', 4);
    inserir_estado(5, 'Goiás', 5);
END;
/

CREATE OR REPLACE PROCEDURE inserir_cidade (
    p_id_cidade IN t_nimbus_cidade.id_cidade%TYPE,
    p_nm_cidade IN t_nimbus_cidade.nm_cidade%TYPE,
    p_id_estado IN t_nimbus_cidade.id_estado%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_cidade VALUES (p_id_cidade, p_nm_cidade, p_id_estado);
    COMMIT;
END;
/

BEGIN
    inserir_cidade(1, 'Osasco', 1);
    inserir_cidade(2, 'Macaé', 2);
    inserir_cidade(3, 'Anori', 3);
    inserir_cidade(4, 'Novo Hamburgo', 4);
    inserir_cidade(5, 'Trindade', 5);
END;
/

CREATE OR REPLACE PROCEDURE inserir_localizacao (
    p_id_localizacao IN t_nimbus_localizacao.id_localizacao%TYPE,
    p_nr_longitude   IN t_nimbus_localizacao.nr_longitude%TYPE,
    p_nr_latitude    IN t_nimbus_localizacao.nr_latitude%TYPE,
    p_id_bairro      IN t_nimbus_localizacao.id_bairro%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_localizacao (id_localizacao, nr_longitude, nr_latitude, id_bairro) 
    VALUES (p_id_localizacao, p_nr_longitude, p_nr_latitude, p_id_bairro);
    COMMIT;
END;
/

BEGIN
    inserir_localizacao(1, -642589, 517026, 1);
    inserir_localizacao(2, 742203, 680369, 2);
    inserir_localizacao(3, 917114, -574969, 3);
    inserir_localizacao(4, -3345, 760431, 4);
    inserir_localizacao(5, -278195, 627319, 5);
END;
/

CREATE OR REPLACE PROCEDURE inserir_bairro (
    p_id_bairro      IN t_nimbus_bairro.id_bairro%TYPE,
    p_nm_logradouro  IN t_nimbus_bairro.nm_logradouro%TYPE,
    p_id_cidade      IN t_nimbus_bairro.id_cidade%TYPE,
    p_id_localizacao IN t_nimbus_bairro.id_localizacao%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_bairro VALUES (p_id_bairro, p_nm_logradouro, p_id_cidade, p_id_localizacao);
    COMMIT;
END;
/

BEGIN
    inserir_bairro(1, 'Vila Yara', 1, 1);
    inserir_bairro(2, 'Cavaleiros', 2, 2);
    inserir_bairro(3, 'Centro', 3, 3);
    inserir_bairro(4, 'Centro', 4, 4);
    inserir_bairro(5, 'Centro', 5, 5);
END;
/

CREATE OR REPLACE PROCEDURE inserir_endereco (
    p_id_endereco IN t_nimbus_endereco.id_endereco%TYPE,
    p_nr_cep      IN t_nimbus_endereco.nr_cep%TYPE,
    p_id_bairro   IN t_nimbus_endereco.id_bairro%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_endereco VALUES (p_id_endereco, p_nr_cep, p_id_bairro);
    COMMIT;
END;
/

BEGIN
    inserir_endereco(1, '10000001', 1);
    inserir_endereco(2, '10000002', 2);
    inserir_endereco(3, '10000003', 3);
    inserir_endereco(4, '10000004', 4);
    inserir_endereco(5, '10000005', 5);
END;
/

CREATE OR REPLACE PROCEDURE inserir_usuario (
    p_id_usuario IN t_nimbus_usuario.id_usuario%TYPE,
    p_nm_usuario IN t_nimbus_usuario.nm_usuario%TYPE,
    p_ds_email   IN t_nimbus_usuario.ds_email%TYPE,
    p_senha      IN t_nimbus_usuario.senha%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_usuario VALUES (p_id_usuario, p_nm_usuario, p_ds_email, p_senha);
    COMMIT;
END;
/

BEGIN
    inserir_usuario(1, 'Vanessa Lima', 'vanssalima@gmail.com', '106587423988');
    inserir_usuario(2, 'Matheus Albuquerque', 'maalbuquerque@gmail.com', '787596321429');
    inserir_usuario(3, 'Luisa Almeida', 'lualmeida@gmail.com', '963325895410');
    inserir_usuario(4, 'Tiago dos Santos', 'tiagosantos@gmail.com', '385696321470');
    inserir_usuario(5, 'Amélia Montenegro', 'ameliamont@gmail.com', '098756369855');
END;
/

CREATE OR REPLACE PROCEDURE inserir_gp_endereco (
    p_id_gp_endereco IN t_nimbus_gp_endereco.id_gp_endereco%TYPE,
    p_nm_grupo       IN t_nimbus_gp_endereco.nm_grupo%TYPE,
    p_id_usuario     IN t_nimbus_gp_endereco.id_usuario%TYPE,
    p_id_endereco    IN t_nimbus_gp_endereco.id_endereco%TYPE
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

-- 9. Alerta
CREATE OR REPLACE PROCEDURE inserir_alerta (
    p_id_alerta      IN t_nimbus_alerta.id_alerta%TYPE,
    p_ds_risco       IN t_nimbus_alerta.ds_risco%TYPE,
    p_ds_tipo        IN t_nimbus_alerta.ds_tipo%TYPE,
    p_ds_mensagem    IN t_nimbus_alerta.ds_mensagem%TYPE,
    p_horario_alerta IN t_nimbus_alerta.horario_alerta%TYPE,
    p_id_bairro      IN t_nimbus_alerta.id_bairro%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_alerta VALUES (p_id_alerta, p_ds_risco, p_ds_tipo, p_ds_mensagem, p_horario_alerta, p_id_bairro);
    COMMIT;
END;
/

BEGIN
    inserir_alerta(1, 'ALTO', 'Chuva Forte', 'Alerta de chuva intensa na região 1', TO_DATE('2024-05-29 10:09:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
    inserir_alerta(2, 'ALTO', 'Chuva Forte', 'Alerta de chuva intensa na região 2', TO_DATE('2025-03-16 13:42:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
    inserir_alerta(3, 'ALTO', 'Chuva Forte', 'Alerta de chuva intensa na região 3', TO_DATE('2025-06-01 09:25:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
    inserir_alerta(4, 'ALTO', 'Chuva Forte', 'Alerta de chuva intensa na região 4', TO_DATE('2025-04-20 11:32:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
    inserir_alerta(5, 'ALTO', 'Chuva Forte', 'Alerta de chuva intensa na região 5', TO_DATE('2024-05-25 07:12:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
END;
/

CREATE OR REPLACE PROCEDURE inserir_previsao (
    p_id_previsao         IN t_nimbus_previsao.id_previsao%TYPE,
    p_nm_hora             IN t_nimbus_previsao.nm_hora%TYPE,
    p_nr_temperatura      IN t_nimbus_previsao.nr_temperatura%TYPE,
    p_nr_chuva            IN t_nimbus_previsao.nr_chuva%TYPE,
    p_nr_codigo_chuva     IN t_nimbus_previsao.nr_codigo_chuva%TYPE,
    p_nr_velocidade_vento IN t_nimbus_previsao.nr_velocidade_vento%TYPE,
    p_nr_rajada_vento     IN t_nimbus_previsao.nr_rajada_vento%TYPE,
    p_nr_umidade          IN t_nimbus_previsao.nr_umidade%TYPE,
    p_id_bairro           IN t_nimbus_previsao.id_bairro%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_previsao VALUES (p_id_previsao, p_nm_hora, p_nr_temperatura, p_nr_chuva, p_nr_codigo_chuva,
                                          p_nr_velocidade_vento, p_nr_rajada_vento, p_nr_umidade, p_id_bairro);
    COMMIT;
END;
/

BEGIN
    inserir_previsao(1, '12:00', 30, 5, 101, 15, 20, 80, 1);
    inserir_previsao(2, '13:00', 28, 10, 102, 18, 25, 85, 2);
    inserir_previsao(3, '14:00', 29, 8, 103, 12, 22, 70, 3);
    inserir_previsao(4, '15:00', 27, 6, 104, 10, 18, 75, 4);
    inserir_previsao(5, '16:00', 26, 4, 105, 9, 16, 72, 5);
END;
/
