set serveroutput on


DECLARE 
    CURSOR c_grupos IS
        SELECT 
            gp.nm_grupo,
            e.nr_cep
        FROM 
            T_NIMBUS_GP_ENDERECO gp
        INNER JOIN 
            T_NIMBUS_ENDERECO e ON gp.id_endereco = e.id_endereco
        ORDER BY 
            e.nr_cep DESC;

    v_nm_grupo T_NIMBUS_GP_ENDERECO.nm_grupo%TYPE;
    v_nr_cep   T_NIMBUS_ENDERECO.nr_cep%TYPE;
BEGIN
    OPEN c_grupos;
    LOOP
        FETCH c_grupos INTO v_nm_grupo, v_nr_cep;
        EXIT WHEN c_grupos%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Grupo: ' || v_nm_grupo || ' | CEP: ' || v_nr_cep);
    END LOOP;
    CLOSE c_grupos;
END;
/


BEGIN
    FOR rec IN (
        SELECT 
            b.nm_bairro,
            a.ds_risco,
            a.ds_tipo,
            a.horario_alerta
        FROM 
            T_NIMBUS_BAIRRO b
        INNER JOIN 
            T_NIMBUS_ALERTA a ON b.id_bairro = a.id_bairro
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Logradouro: ' || rec.nm_bairro ||
            ' | Risco: ' || rec.ds_risco ||
            ' | Tipo: ' || rec.ds_tipo ||
            ' | Data: ' || TO_CHAR(rec.horario_alerta, 'DD/MM/YYYY HH24:MI')
        );
    END LOOP;
END;
/


DECLARE
    CURSOR cursor2 IS
    SELECT u.nm_usuario, gp.nm_grupo
    FROM 
        T_NIMBUS_USUARIO u
    INNER JOIN
        T_NIMBUS_GP_ENDERECO gp ON u.id_usuario = gp.id_usuario;
    
BEGIN
    FOR i IN cursor2 LOOP
        dbms_output.put_line('Usuário: ' || i.nm_usuario || ' | Grupo: ' || i.nm_grupo);
    
    END LOOP;
END;

--relatório
SELECT 
    a.ds_tipo,
    a.ds_risco,
    COUNT(*) AS total_alertas
FROM 
    T_NIMBUS_ALERTA a
JOIN 
    T_NIMBUS_BAIRRO b ON a.id_bairro = b.id_bairro
GROUP BY 
    a.ds_tipo, a.ds_risco
ORDER BY 
    total_alertas DESC;


SELECT 
    c.nm_cidade,
    COUNT(DISTINCT gp.id_gp_endereco) AS total_grupos
FROM 
    T_NIMBUS_GP_ENDERECO gp
JOIN 
    T_NIMBUS_ENDERECO e ON gp.id_endereco = e.id_endereco
JOIN 
    T_NIMBUS_BAIRRO b ON e.id_bairro = b.id_bairro
JOIN 
    T_NIMBUS_CIDADE c ON b.id_cidade = c.id_cidade
GROUP BY 
    c.nm_cidade
ORDER BY 
    total_grupos DESC;


SELECT 
    c.nm_cidade,
    SUM(p.nr_chuva) AS soma_chuva,
    SUM(p.nr_velocidade_vento) AS soma_vento
FROM 
    T_NIMBUS_PREVISAO p
JOIN 
    T_NIMBUS_BAIRRO b ON p.id_bairro = b.id_bairro
JOIN 
    T_NIMBUS_CIDADE c ON b.id_cidade = c.id_cidade
GROUP BY 
    c.nm_cidade
ORDER BY 
    soma_chuva DESC;
    
    

SELECT 
    b.nm_bairro,
    AVG(p.nr_rajada_vento) AS media_rajada
FROM 
    T_NIMBUS_PREVISAO p
JOIN 
    T_NIMBUS_BAIRRO b ON p.id_bairro = b.id_bairro
GROUP BY 
    b.nm_bairro
ORDER BY 
    media_rajada DESC;
    

SELECT 
    b.nm_bairro,
    AVG(p.nr_temperatura) AS media_temperatura
FROM 
    T_NIMBUS_PREVISAO p
JOIN 
    T_NIMBUS_BAIRRO b ON p.id_bairro = b.id_bairro
GROUP BY 
    b.nm_bairro;



    



