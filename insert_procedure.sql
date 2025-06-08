CREATE OR REPLACE PROCEDURE inserir_pais (
    p_nm_pais IN t_nimbus_pais.nm_pais%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_pais (nm_pais) VALUES (p_nm_pais);
    COMMIT;
END;
/

BEGIN
    inserir_pais('Brasil');
    inserir_pais('M�xico');
    inserir_pais('Brasil');
    inserir_pais('Brasil');
    inserir_pais('Brasil');
END;
/

CREATE OR REPLACE PROCEDURE inserir_estado (
    p_nm_estado IN t_nimbus_estado.nm_estado%TYPE,
    p_id_pais   IN t_nimbus_estado.id_pais%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_estado (nm_estado, id_pais) VALUES (p_nm_estado, p_id_pais);
    COMMIT;
END;
/

BEGIN
    inserir_estado('S�o Paulo', 1);
    inserir_estado('Rio de Janeiro', 2);
    inserir_estado('Amazonas', 3);
    inserir_estado('Rio Grande do Sul', 4);
    inserir_estado('Goi�s', 5);
END;
/

CREATE OR REPLACE PROCEDURE inserir_cidade (
    p_nm_cidade IN t_nimbus_cidade.nm_cidade%TYPE,
    p_id_estado IN t_nimbus_cidade.id_estado%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_cidade (nm_cidade, id_estado) VALUES (p_nm_cidade, p_id_estado);
    COMMIT;
END;
/

BEGIN
    inserir_cidade('Osasco', 1);
    inserir_cidade('Maca�', 2);
    inserir_cidade('Anori', 3);
    inserir_cidade('Novo Hamburgo', 4);
    inserir_cidade('Trindade', 5);
END;
/

CREATE OR REPLACE PROCEDURE inserir_localizacao (
    p_nr_longitude   IN t_nimbus_localizacao.nr_longitude%TYPE,
    p_nr_latitude    IN t_nimbus_localizacao.nr_latitude%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_localizacao (nr_longitude, nr_latitude) 
    VALUES (p_nr_longitude, p_nr_latitude);
    COMMIT;
END;
/

BEGIN
    inserir_localizacao(-46.6333, -23.5505);
    inserir_localizacao(-43.1964, -22.9083);
    inserir_localizacao(-43.9333, -19.9167);
    inserir_localizacao(-38.5014, -12.9714);
    inserir_localizacao(-49.2733, -25.4284);
    inserir_localizacao(-51.2177, -30.0346);
END;
/

CREATE OR REPLACE PROCEDURE inserir_bairro (
    p_nm_bairro      IN t_nimbus_bairro.nm_bairro%TYPE,
    p_id_cidade      IN t_nimbus_bairro.id_cidade%TYPE,
    p_id_localizacao IN t_nimbus_bairro.id_localizacao%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_bairro (nm_bairro, id_cidade, id_localizacao) VALUES (p_nm_bairro, p_id_cidade, p_id_localizacao);
    COMMIT;
END;
/

BEGIN
    inserir_bairro('Vila Yara', 1, 1);
    inserir_bairro('Cavaleiros', 2, 2);
    inserir_bairro('Centro', 3, 3);
    inserir_bairro('Centro', 4, 4);
    inserir_bairro('Centro', 5, 5);
END;
/

CREATE OR REPLACE PROCEDURE inserir_endereco (
    p_nr_cep        IN t_nimbus_endereco.nr_cep%TYPE,
    p_id_bairro     IN t_nimbus_endereco.id_bairro%TYPE,
    p_nm_logradouro IN t_nimbus_endereco.nm_logradouro%TYPE,
    p_nr_logradouro IN t_nimbus_endereco.nr_logradouro%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_endereco (nr_cep, id_bairro, nm_logradouro, nr_logradouro) 
    VALUES (p_nr_cep, p_id_bairro, p_nm_logradouro, p_nr_logradouro);
    COMMIT;
END;
/

BEGIN
    inserir_endereco('01001000', 1, 'Pra�a da S�', 100); 
    inserir_endereco('22070002', 2, 'Av. Atl�ntica', 3000); 
    inserir_endereco('30130174', 3, 'Rua Pernambuco', 1000); 
    inserir_endereco('40026010', 4, 'Largo do Pelourinho', 50); 
    inserir_endereco('80420090', 5, 'Av. do Batel', 1868); 
END;
/

CREATE OR REPLACE PROCEDURE inserir_usuario (
    p_nm_usuario IN t_nimbus_usuario.nm_usuario%TYPE,
    p_ds_email   IN t_nimbus_usuario.ds_email%TYPE,
    p_senha      IN t_nimbus_usuario.senha%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_usuario (nm_usuario, ds_email, senha) VALUES (p_nm_usuario, p_ds_email, p_senha);
    COMMIT;
END;
/

BEGIN
    inserir_usuario('Vanessa Lima', 'vanssalima@gmail.com', '106587423988');
    inserir_usuario('Matheus Albuquerque', 'maalbuquerque@gmail.com', '787596321429');
    inserir_usuario('Luisa Almeida', 'lualmeida@gmail.com', '963325895410');
    inserir_usuario('Tiago dos Santos', 'tiagosantos@gmail.com', '385696321470');
    inserir_usuario('Amélia Montenegro', 'ameliamont@gmail.com', '098756369855');
END;
/

CREATE OR REPLACE PROCEDURE inserir_gp_endereco (
    p_nm_grupo       IN t_nimbus_gp_endereco.nm_grupo%TYPE,
    p_id_usuario     IN t_nimbus_gp_endereco.id_usuario%TYPE,
    p_id_endereco    IN t_nimbus_gp_endereco.id_endereco%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_gp_endereco (nm_grupo, id_usuario, id_endereco) VALUES (p_nm_grupo, p_id_usuario, p_id_endereco);
    COMMIT;
END;
/

BEGIN
    inserir_gp_endereco('Fam�lia', 1, 1);
    inserir_gp_endereco('Casa', 2, 2);
    inserir_gp_endereco('Casa M�e', 3, 3);
    inserir_gp_endereco('Casa V�', 4, 4);
    inserir_gp_endereco('Trabalho', 5, 5);
END;
/

-- 9. Alerta
CREATE OR REPLACE PROCEDURE inserir_alerta (
    p_ds_risco       IN t_nimbus_alerta.ds_risco%TYPE,
    p_ds_tipo        IN t_nimbus_alerta.ds_tipo%TYPE,
    p_ds_mensagem    IN t_nimbus_alerta.ds_mensagem%TYPE,
    p_horario_alerta IN t_nimbus_alerta.horario_alerta%TYPE,
    p_id_bairro      IN t_nimbus_alerta.id_bairro%TYPE
) IS
BEGIN
    INSERT INTO t_nimbus_alerta (ds_risco, ds_tipo, ds_mensagem, horario_alerta, id_bairro) 
    VALUES (p_ds_risco, p_ds_tipo, p_ds_mensagem, p_horario_alerta, p_id_bairro);
    COMMIT;
END;
/

BEGIN
    inserir_alerta('ALTO', 'CHUVA_FORTE', 'Alerta de chuva intensa na região 1', TO_DATE('2024-05-29 10:09:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
    inserir_alerta('ALTO', 'CHUVA_FORTE', 'Alerta de chuva intensa na região 2', TO_DATE('2025-03-16 13:42:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
    inserir_alerta('ALTO', 'CHUVA_FORTE', 'Alerta de chuva intensa na região 3', TO_DATE('2025-06-01 09:25:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
    inserir_alerta('ALTO', 'CHUVA_FORTE', 'Alerta de chuva intensa na região 4', TO_DATE('2025-04-20 11:32:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
    inserir_alerta('ALTO', 'CHUVA_FORTE', 'Alerta de chuva intensa na região 5', TO_DATE('2024-05-25 07:12:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
END;
/

CREATE OR REPLACE PROCEDURE inserir_previsao (
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
    INSERT INTO t_nimbus_previsao (nm_hora, nr_temperatura, nr_chuva, nr_codigo_chuva,
                                          nr_velocidade_vento, nr_rajada_vento, nr_umidade, id_bairro) 
    VALUES (p_nm_hora, p_nr_temperatura, p_nr_chuva, p_nr_codigo_chuva,
            p_nr_velocidade_vento, p_nr_rajada_vento, p_nr_umidade, p_id_bairro);
    COMMIT;
END;
/

BEGIN
    inserir_previsao('12:00', 30, 5, 101, 15, 20, 80, 1);
    inserir_previsao('13:00', 28, 10, 102, 18, 25, 85, 2);
    inserir_previsao('14:00', 29, 8, 103, 12, 22, 70, 3);
    inserir_previsao('15:00', 27, 6, 104, 10, 18, 75, 4);
    inserir_previsao('16:00', 26, 4, 105, 9, 16, 72, 5);
END;
/