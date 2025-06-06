CREATE OR REPLACE PROCEDURE atualizar_pais (
    p_id_pais IN t_nimbus_pais.id_pais%TYPE,
    p_nm_pais IN t_nimbus_pais.nm_pais%TYPE
) IS
BEGIN
    UPDATE t_nimbus_pais
    SET nm_pais = p_nm_pais
    WHERE id_pais = p_id_pais;
    COMMIT;
END;
/

BEGIN
    atualizar_pais(2, 'Brasil');
END;
/

CREATE OR REPLACE PROCEDURE atualizar_estado (
    p_id_estado IN t_nimbus_estado.id_estado%TYPE,
    p_nm_estado IN t_nimbus_estado.nm_estado%TYPE,
    p_id_pais   IN t_nimbus_estado.id_pais%TYPE
) IS
BEGIN
    UPDATE t_nimbus_estado
    SET nm_estado = p_nm_estado
    WHERE id_estado = p_id_estado;
    COMMIT;
END;
/

BEGIN
    atualizar_estado(2, 'Alagoas', 3);
END;
/

CREATE OR REPLACE PROCEDURE atualizar_cidade (
    p_id_cidade IN t_nimbus_cidade.id_cidade%TYPE,
    p_nm_cidade IN t_nimbus_cidade.nm_cidade%TYPE,
    p_id_estado IN t_nimbus_cidade.id_estado%TYPE
) IS
BEGIN
    UPDATE t_nimbus_cidade
    SET nm_cidade = p_nm_cidade
    WHERE id_cidade = p_id_cidade;
    COMMIT;
END;
/

BEGIN
    atualizar_cidade(2, 'Maceió', 2);
END;
/

CREATE OR REPLACE PROCEDURE atualizar_localizacao (
    p_id_localizacao IN t_nimbus_localizacao.id_localizacao%TYPE,
    p_nr_longitude   IN t_nimbus_localizacao.nr_longitude%TYPE,
    p_nr_latitude    IN t_nimbus_localizacao.nr_latitude%TYPE
) IS
BEGIN
    UPDATE t_nimbus_localizacao
    SET nr_longitude = p_nr_longitude, nr_latitude = p_nr_latitude
    WHERE id_localizacao = p_id_localizacao;
    COMMIT;
END;
/

BEGIN
    atualizar_localizacao(1, -616587, -374397);
    atualizar_localizacao(2, -511333, -296880);
    atualizar_localizacao(3, -494981, -166492);
    atualizar_localizacao(4, -467664, -235475);
    atualizar_localizacao(5, -357020, -966212);
END;
/

CREATE OR REPLACE PROCEDURE atualizar_bairro (
    p_id_bairro      IN t_nimbus_bairro.id_bairro%TYPE,
    p_nm_logradouro  IN t_nimbus_bairro.nm_logradouro%TYPE,
    p_id_cidade      IN t_nimbus_bairro.id_cidade%TYPE,
    p_id_localizacao IN t_nimbus_bairro.id_localizacao%TYPE
) IS
BEGIN
    UPDATE t_nimbus_bairro
    SET nm_logradouro = p_nm_logradouro
    WHERE id_bairro = p_id_bairro;
    COMMIT;
END;
/

BEGIN
    atualizar_bairro(2, 'Ponta Verde', 2, 2);
END;
/

CREATE OR REPLACE PROCEDURE atualizar_endereco (
    p_id_endereco IN t_nimbus_endereco.id_endereco%TYPE,
    p_nr_cep      IN t_nimbus_endereco.nr_cep%TYPE
) IS
BEGIN
    UPDATE t_nimbus_endereco
    SET nr_cep = p_nr_cep
    WHERE id_endereco = p_id_endereco;
    COMMIT;
END;
/

BEGIN
    atualizar_endereco(1, '69440959');
    atualizar_endereco(2, '93510660');
    atualizar_endereco(3, '75388620');
    atualizar_endereco(4, '06029902');
    atualizar_endereco(5, '57035000');
END;
/

CREATE OR REPLACE PROCEDURE atualizar_usuario (
    p_id_usuario IN t_nimbus_usuario.id_usuario%TYPE,
    p_ds_email   IN t_nimbus_usuario.ds_email%TYPE
) IS
BEGIN
    UPDATE t_nimbus_usuario
    SET ds_email = p_ds_email
    WHERE id_usuario = p_id_usuario;
    COMMIT;
END;
/

BEGIN
    atualizar_usuario(1, 'nessalima@gmail.com');
END;
/

CREATE OR REPLACE PROCEDURE atualizar_gp_endereco (
    p_id_gp_endereco IN t_nimbus_gp_endereco.id_gp_endereco%TYPE,
    p_nm_grupo       IN t_nimbus_gp_endereco.nm_grupo%TYPE
) IS
BEGIN
    UPDATE t_nimbus_gp_endereco
    SET nm_grupo = p_nm_grupo
    WHERE id_gp_endereco = p_id_gp_endereco;
    COMMIT;
END;
/

BEGIN
    atualizar_gp_endereco(3, 'Familia');
    atualizar_gp_endereco(4, 'Familia');
END;
/

CREATE OR REPLACE PROCEDURE atualizar_alerta (
    p_ds_risco    IN t_nimbus_alerta.ds_risco%TYPE,
    p_ds_tipo     IN t_nimbus_alerta.ds_tipo%TYPE,
    p_ds_mensagem IN t_nimbus_alerta.ds_mensagem%TYPE
) IS
BEGIN
    UPDATE t_nimbus_alerta
    SET ds_risco = p_ds_risco,
        ds_tipo = p_ds_tipo,
        ds_mensagem = p_ds_mensagem;
    COMMIT;
END;
/

BEGIN
    atualizar_alerta('BAIXO', 'Chuva fraca', 'Sem alertas ativos');
END;
/

CREATE OR REPLACE PROCEDURE atualizar_previsao (
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
    UPDATE t_nimbus_previsao
    SET nm_hora = p_nm_hora,
        nr_temperatura = p_nr_temperatura,
        nr_chuva = p_nr_chuva,
        nr_codigo_chuva = p_nr_codigo_chuva,
        nr_velocidade_vento = p_nr_velocidade_vento,
        nr_rajada_vento = p_nr_rajada_vento,
        nr_umidade = p_nr_umidade,
        id_bairro = p_id_bairro
    WHERE id_previsao = p_id_previsao;
    COMMIT;
END;
/

BEGIN
    atualizar_previsao(1, '17:00', 31, 6, 201, 16, 21, 82, 1);
    atualizar_previsao(2, '18:00', 27, 11, 202, 19, 26, 87, 2);
    atualizar_previsao(3, '19:00', 30, 9, 203, 13, 23, 73, 3);
    atualizar_previsao(4, '20:00', 28, 7, 204, 11, 19, 78, 4);
    atualizar_previsao(5, '21:00', 25, 5, 205, 10, 17, 74, 5);
END;
/
