CREATE TABLE t_nimbus_alerta (
    id_alerta       NUMBER(9) NOT NULL,
    ds_risco        VARCHAR2(20) NOT NULL,
    ds_tipo         VARCHAR2(20) NOT NULL,
    ds_mensagem     VARCHAR2(250) NOT NULL,
    horario_alerta  DATE NOT NULL,
    id_bairro       NUMBER(9) NOT NULL
);

ALTER TABLE t_nimbus_alerta ADD CONSTRAINT t_nimbus_alerta_pk PRIMARY KEY ( id_alerta );

CREATE TABLE t_nimbus_bairro (
    id_bairro                            NUMBER(9) NOT NULL,
    nm_logradouro                        VARCHAR2(100) NOT NULL,
    id_cidade                            NUMBER(9) NOT NULL, 
    id_localizacao                       NUMBER(9) NOT NULL
);


ALTER TABLE t_nimbus_bairro ADD CONSTRAINT t_nimbus_bairro_pk PRIMARY KEY ( id_bairro );

CREATE TABLE t_nimbus_cidade (
    id_cidade  NUMBER(9) NOT NULL,
    nm_cidade  VARCHAR2(100) NOT NULL,
    id_estado  NUMBER(9) NOT NULL
);

ALTER TABLE t_nimbus_cidade ADD CONSTRAINT t_nimbus_cidade_pk PRIMARY KEY ( id_cidade );

CREATE TABLE t_nimbus_endereco (
    id_endereco                NUMBER(9) NOT NULL,
    nr_cep                     CHAR(8) NOT NULL,
    id_bairro                  NUMBER(9) NOT NULL
);

ALTER TABLE t_nimbus_endereco ADD CONSTRAINT t_nimbus_endereco_pk PRIMARY KEY ( id_endereco );

ALTER TABLE t_nimbus_endereco ADD CONSTRAINT ck_cep CHECK(LENGTH(nr_cep) = 8);

CREATE TABLE t_nimbus_estado (
    id_estado  NUMBER(9) NOT NULL,
    nm_estado  VARCHAR2(50) NOT NULL,
    id_pais    NUMBER(9) NOT NULL
);

ALTER TABLE t_nimbus_estado ADD CONSTRAINT t_nimbus_estado_pk PRIMARY KEY ( id_estado );

CREATE TABLE t_nimbus_gp_endereco (
    id_gp_endereco                 NUMBER(9) NOT NULL,
    nm_grupo                       VARCHAR2(100) NOT NULL,
    id_usuario                     NUMBER(9) NOT NULL,
    id_endereco                    NUMBER(9) NOT NULL
);

ALTER TABLE t_nimbus_gp_endereco ADD CONSTRAINT t_nimbus_gp_endereco_pk PRIMARY KEY ( id_gp_endereco );

CREATE TABLE t_nimbus_localizacao (
    id_localizacao  NUMBER(9) NOT NULL,
    nr_longitude    NUMBER(6) NOT NULL,
    nr_latitude     NUMBER(6) NOT NULL,
    id_bairro       NUMBER(9) NOT NULL
);


ALTER TABLE t_nimbus_localizacao ADD CONSTRAINT t_nimbus_localizacao_pk PRIMARY KEY ( id_localizacao );

CREATE TABLE t_nimbus_pais (
    id_pais  NUMBER(9) NOT NULL,
    nm_pais  VARCHAR2(50) NOT NULL
);

ALTER TABLE t_nimbus_pais ADD CONSTRAINT t_nimbus_pais_pk PRIMARY KEY ( id_pais );

CREATE TABLE t_nimbus_previsao (
    id_previsao          NUMBER(9) NOT NULL,
    nm_hora              VARCHAR2(50) NOT NULL,
    nr_temperatura       NUMBER(20) NOT NULL,
    nr_chuva             NUMBER(20) NOT NULL,
    nr_codigo_chuva      NUMBER(20) NOT NULL,
    nr_velocidade_vento  NUMBER(20) NOT NULL,
    nr_rajada_vento      NUMBER(20) NOT NULL,
    nr_umidade           NUMBER(20) NOT NULL,
    id_bairro            NUMBER(9) NOT NULL
);

ALTER TABLE t_nimbus_previsao ADD CONSTRAINT t_nimbus_previsao_pk PRIMARY KEY ( id_previsao );

CREATE TABLE t_nimbus_usuario (
    id_usuario  NUMBER(9) NOT NULL,
    nm_usuario  VARCHAR2(50) NOT NULL,
    ds_email    VARCHAR2(50) NOT NULL,
    senha       VARCHAR2(12) NOT NULL
);

ALTER TABLE t_nimbus_usuario ADD CONSTRAINT t_nimbus_usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE t_nimbus_estado
    ADD CONSTRAINT relation_1 FOREIGN KEY ( id_pais )
        REFERENCES t_nimbus_pais ( id_pais );

ALTER TABLE t_nimbus_gp_endereco
    ADD CONSTRAINT relation_10 FOREIGN KEY ( id_endereco )
        REFERENCES t_nimbus_endereco ( id_endereco );

ALTER TABLE t_nimbus_cidade
    ADD CONSTRAINT relation_2 FOREIGN KEY ( id_estado )
        REFERENCES t_nimbus_estado ( id_estado );

ALTER TABLE t_nimbus_previsao
    ADD CONSTRAINT relation_23 FOREIGN KEY ( id_bairro )
        REFERENCES t_nimbus_bairro ( id_bairro );

ALTER TABLE t_nimbus_alerta
    ADD CONSTRAINT relation_24 FOREIGN KEY ( id_bairro )
        REFERENCES t_nimbus_bairro ( id_bairro );

ALTER TABLE t_nimbus_bairro
    ADD CONSTRAINT relation_3 FOREIGN KEY ( id_cidade )
        REFERENCES t_nimbus_cidade ( id_cidade );

ALTER TABLE t_nimbus_endereco
    ADD CONSTRAINT relation_4 FOREIGN KEY ( id_bairro )
        REFERENCES t_nimbus_bairro ( id_bairro );

ALTER TABLE t_nimbus_bairro
    ADD CONSTRAINT relation_7 FOREIGN KEY ( id_localizacao )
        REFERENCES t_nimbus_localizacao ( id_localizacao );

ALTER TABLE t_nimbus_gp_endereco
    ADD CONSTRAINT relation_9 FOREIGN KEY ( id_usuario )
        REFERENCES t_nimbus_usuario ( id_usuario );

