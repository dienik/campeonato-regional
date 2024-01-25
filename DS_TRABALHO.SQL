-- Tabela ds_atleta
CREATE TABLE ds_atleta (
    id_atleta SERIAL PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cidade_natal VARCHAR(100) NOT NULL,
    posicao VARCHAR(20) NOT NULL CHECK (posicao IN ('Opener', 'Number3', 'Midle-order', 'Wicket-keeper', 'Bowlers', 'All-rounders', 'Fielders'))
);

-- Tabela ds_equipe
CREATE TABLE ds_equipe (
    id_equipe SERIAL PRIMARY KEY,
    nome_equipe VARCHAR(100) NOT NULL,
    data_fundacao DATE NOT NULL,
    cidade_origem VARCHAR(100) NOT NULL CHECK (cidade_origem IN ('Porto Alegre', 'Caxias do Sul', 'Canoas', 'Pelotas', 'Santa Maria', 'Bento Gonçalves', 'Novo Hamburgo', 'Rio Grande', 'Uruguaiana', 'Passo Fundo', 'São Leopoldo', 'Bagé', 'Erechim', 'Cachoeira do Sul', 'Santa Cruz do Sul'))
);
-- Adicionar campo qtd_campea à tabela ds_equipe
ALTER TABLE ds_equipe
ADD COLUMN qtd_campea INT DEFAULT 0 CHECK (qtd_campea >= 0);

-- Tabela ds_pertence
CREATE TABLE ds_pertence (
    id_atleta INT REFERENCES ds_atleta(id_atleta),
    id_equipe INT REFERENCES ds_equipe(id_equipe),
    data_inicio DATE NOT NULL,
    data_fim DATE,
    atleta_ativo BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (id_atleta, id_equipe)
);

-- Tabela ds_competicao
CREATE TABLE ds_competicao (
    id_competicao SERIAL PRIMARY KEY,
    cidade_sede VARCHAR(100) NOT NULL CHECK (cidade_sede IN ('Porto Alegre', 'Caxias do Sul', 'Canoas', 'Pelotas')),
    semestre INT NOT NULL CHECK (semestre IN (1, 2)),
    ano INT NOT NULL,
    nome_fantasia VARCHAR(100) NOT NULL,
    UNIQUE (cidade_sede, semestre, ano)
);

-- Tabela ds_joga
CREATE TABLE ds_joga (
    id_jogo SERIAL PRIMARY KEY,
    id_equipe_a INT REFERENCES ds_equipe(id_equipe),
    id_equipe_b INT REFERENCES ds_equipe(id_equipe),
    id_competicao INT REFERENCES ds_competicao(id_competicao),
    pontos_equipe_a INT,
    pontos_equipe_b INT,
    equipe_vencedora INT REFERENCES ds_equipe(id_equipe),
    UNIQUE (id_equipe_a, id_equipe_b, id_competicao)
);

-- Adicionar dados às tabelas

-- Tabela ds_atleta
INSERT INTO ds_atleta (nome_completo, data_nascimento, cidade_natal, posicao)
VALUES
  ('Atleta 1', '1990-01-15', 'Porto Alegre', 'Opener'),
  ('Atleta 2', '1992-05-20', 'Caxias do Sul', 'Number3'),
  ('Atleta 3', '1988-11-10', 'Canoas', 'Midle-order'),
  ('Atleta 4', '1995-03-25', 'Pelotas', 'Wicket-keeper'),
  ('Atleta 5', '1993-08-12', 'Santa Maria', 'Bowlers'),
  ('Atleta 6', '1987-04-30', 'Bento Gonçalves', 'All-rounders'),
  ('Atleta 7', '1998-09-18', 'Novo Hamburgo', 'Fielders'),
  ('Atleta 8', '1991-02-28', 'Rio Grande', 'Opener'),
  ('Atleta 9', '1989-06-15', 'Uruguaiana', 'Number3'),
  ('Atleta 10', '1994-12-05', 'Passo Fundo', 'Midle-order'),
  ('Atleta 11', '1996-07-22', 'São Leopoldo', 'Wicket-keeper'),
  ('Atleta 12', '1986-10-08', 'Bagé', 'Bowlers'),
  ('Atleta 13', '1997-01-20', 'Erechim', 'All-rounders'),
  ('Atleta 14', '1999-04-10', 'Cachoeira do Sul', 'Fielders'),
  ('Atleta 15', '1985-11-03', 'Santa Cruz do Sul', 'Opener');

-- Tabela ds_equipe
INSERT INTO ds_equipe (nome_equipe, data_fundacao, cidade_origem, qtd_campea)
VALUES
  ('Equipe 1', '2000-05-10', 'Porto Alegre', 2),
  ('Equipe 2', '1998-12-20', 'Caxias do Sul', 1),
  ('Equipe 3', '2005-08-30', 'Canoas', 0),
  ('Equipe 4', '1990-04-15', 'Pelotas', 3),
  ('Equipe 5', '2002-09-28', 'Santa Maria', 1),
  ('Equipe 6', '1997-06-03', 'Bento Gonçalves', 0),
  ('Equipe 7', '2008-01-12', 'Novo Hamburgo', 2),
  ('Equipe 8', '1994-10-25', 'Rio Grande', 1),
  ('Equipe 9', '2003-03-15', 'Uruguaiana', 0),
  ('Equipe 10', '1995-11-08', 'Passo Fundo', 2),
  ('Equipe 11', '2006-07-22', 'São Leopoldo', 1),
  ('Equipe 12', '1999-04-30', 'Bagé', 0),
  ('Equipe 13', '2004-02-18', 'Erechim', 3),
  ('Equipe 14', '1996-09-05', 'Cachoeira do Sul', 1),
  ('Equipe 15', '2007-04-15', 'Santa Cruz do Sul', 0);

-- Tabela ds_pertence
INSERT INTO ds_pertence (id_atleta, id_equipe, data_inicio, data_fim, atleta_ativo)
VALUES
  (1, 1, '2000-05-10', NULL, TRUE),
  (2, 2, '1998-12-20', '2002-09-28', FALSE),
  (3, 3, '2005-08-30', NULL, TRUE),
  (4, 4, '1990-04-15', '1995-11-08', FALSE),
  (5, 5, '2002-09-28', NULL, TRUE),
  (6, 6, '1997-06-03', '2004-02-18', FALSE),
  (7, 7, '2008-01-12', NULL, TRUE),
  (8, 8, '1994-10-25', NULL, TRUE),
  (9, 9, '2003-03-15', '2007-04-15', FALSE),
  (10, 10, '1995-11-08', NULL, TRUE),
  (11, 11, '2006-07-22', '2000-05-10', FALSE),
  (12, 12, '1999-04-30', NULL, TRUE),
  (13, 13, '2004-02-18', '2008-01-12', FALSE),
  (14, 14, '1996-09-05', NULL, TRUE),
  (15, 15, '2007-04-15', NULL, TRUE);

-- Tabela ds_competicao
INSERT INTO ds_competicao (cidade_sede, semestre, ano, nome_fantasia)
VALUES
  ('Porto Alegre', 1, 2022, 'Porto Alegre_2022'),
  ('Caxias do Sul', 2, 2022, 'Caxias do Sul_2022'),
  ('Canoas', 1, 2023, 'Canoas_2023'),
  ('Pelotas', 2, 2023, 'Pelotas_2023');

-- Tabela ds_joga
INSERT INTO ds_joga (id_equipe_a, id_equipe_b, id_competicao, pontos_equipe_a, pontos_equipe_b, equipe_vencedora)
VALUES
  (1, 2, 1, 150, 120, 1),
  (3, 4, 2, 180, 160, 4),
  (5, 6, 3, 200, 190, 5),
  (7, 8, 4, 170, 140, 7),
  (9, 10, 1, 160, 150, 9),
  (11, 12, 2, 190, 180, 11),
  (13, 14, 3, 130, 110, 13),
  (15, 1, 4, 140, 130, 1),
  (2, 3, 1, 170, 160, 2),
  (4, 5, 2, 150, 140, 4),
  (6, 7, 3, 120, 100, 6),
  (8, 9, 4, 130, 120, 8),
  (10, 11, 1, 140, 130, 10),
  (12, 13, 2, 160, 150, 12),
  (14, 15, 3, 180, 170, 14),
  (1, 2, 4, 200, 190, 1);

 -- Procedimentos de preenchimento
-- Procedimento para adicionar atleta
CREATE OR REPLACE PROCEDURE ds_adicionarAtleta(
    p_nome_completo VARCHAR(100),
    p_data_nascimento DATE,
    p_cidade_natal VARCHAR(100),
    p_posicao VARCHAR(20)
)
AS $$
BEGIN
    -- Validar se a cidade de nascimento está na lista permitida
    IF p_cidade_natal IN ('Porto Alegre', 'Caxias do Sul', 'Canoas', 'Pelotas', 'Santa Maria', 'Bento Gonçalves', 'Novo Hamburgo', 'Rio Grande', 'Uruguaiana', 'Passo Fundo', 'São Leopoldo', 'Bagé', 'Erechim', 'Cachoeira do Sul', 'Santa Cruz do Sul') THEN
        INSERT INTO ds_atleta (nome_completo, data_nascimento, cidade_natal, posicao)
        VALUES (p_nome_completo, p_data_nascimento, p_cidade_natal, p_posicao);
    ELSE
        RAISE EXCEPTION 'Cidade de nascimento não permitida. Cidades permitidas são: Porto Alegre, Caxias do Sul, Canoas, Pelotas, Santa Maria, Bento Gonçalves, Novo Hamburgo, Rio Grande, Uruguaiana, Passo Fundo, São Leopoldo, Bagé, Erechim, Cachoeira do Sul, Santa Cruz do Sul';
    END IF;
END;
$$ LANGUAGE plpgsql;


-- Procedimento para adicionar equipe
CREATE OR REPLACE PROCEDURE ds_adicionarEquipe(
    p_nome_equipe VARCHAR(100),
    p_data_fundacao DATE,
    p_cidade_origem VARCHAR(100)
)
AS $$
BEGIN
    -- Validar se a cidade de origem está na lista permitida
    IF p_cidade_origem IN ('Porto Alegre', 'Caxias do Sul', 'Canoas', 'Pelotas', 'Santa Maria', 'Bento Gonçalves', 'Novo Hamburgo', 'Rio Grande', 'Uruguaiana', 'Passo Fundo', 'São Leopoldo', 'Bagé', 'Erechim', 'Cachoeira do Sul', 'Santa Cruz do Sul') THEN
        INSERT INTO ds_equipe (nome_equipe, data_fundacao, cidade_origem)
        VALUES (p_nome_equipe, p_data_fundacao, p_cidade_origem);
    ELSE
        RAISE EXCEPTION 'Cidade de origem não permitida.';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Procedimento para adicionar competição
CREATE OR REPLACE PROCEDURE ds_adicionarCompeticao(
    p_cidade_sede VARCHAR(100),
    p_semestre INT,
    p_ano INT,
    p_nome_fantasia VARCHAR(100)
)
AS $$
BEGIN
    -- Validar se a competição já ocorreu na mesma cidade no mesmo ano
    IF NOT EXISTS (
        SELECT 1
        FROM ds_competicao
        WHERE cidade_sede = p_cidade_sede AND semestre = p_semestre AND ano = p_ano
    ) THEN
        INSERT INTO ds_competicao (cidade_sede, semestre, ano, nome_fantasia)
        VALUES (p_cidade_sede, p_semestre, p_ano, p_nome_fantasia);
    ELSE
        RAISE EXCEPTION 'Competição já ocorreu na mesma cidade no mesmo ano.';
    END IF;
END;
$$ LANGUAGE plpgsql;
-- Procedimento para atualizar pertence
CREATE OR REPLACE PROCEDURE ds_atualizarPertence(
    p_id_atleta INT,
    p_id_equipe INT,
    p_situacao BOOLEAN
)
AS $$
BEGIN
    UPDATE ds_pertence
    SET atleta_ativo = p_situacao
    WHERE id_atleta = p_id_atleta AND id_equipe = p_id_equipe;
END;
$$ LANGUAGE plpgsql;
-- Procedimento para atualizar joga
CREATE OR REPLACE PROCEDURE ds_atualizarJoga(
    p_id_equipe_a INT,
    p_id_equipe_b INT,
    p_id_competicao INT,
    p_pontos_equipe_a INT,
    p_pontos_equipe_b INT
)
AS $$
BEGIN
    -- Verificar existência antes de inserir
    IF NOT EXISTS (SELECT 1 FROM ds_joga WHERE id_equipe_a = p_id_equipe_a AND id_equipe_b = p_id_equipe_b AND id_competicao = p_id_competicao) THEN
        -- Inserir apenas se não existir
        INSERT INTO ds_joga (id_equipe_a, id_equipe_b, id_competicao, pontos_equipe_a, pontos_equipe_b)
        VALUES (p_id_equipe_a, p_id_equipe_b, p_id_competicao, p_pontos_equipe_a, p_pontos_equipe_b);
    ELSE
        -- Lidar com a existência (por exemplo, atualizar)
        UPDATE ds_joga
        SET pontos_equipe_a = p_pontos_equipe_a, pontos_equipe_b = p_pontos_equipe_b
        WHERE id_equipe_a = p_id_equipe_a AND id_equipe_b = p_id_equipe_b AND id_competicao = p_id_competicao;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Função para listar atletas da equipe
CREATE OR REPLACE FUNCTION ds_listarAtletasDaEquipe(p_id_equipe INT)
RETURNS TABLE (
    nome_atleta VARCHAR(100),
    posicao_atleta VARCHAR(20)
)
AS $$
BEGIN
    RETURN QUERY SELECT nome_completo, posicao
    FROM ds_atleta a
    JOIN ds_pertence p ON a.id_atleta = p.id_atleta
    WHERE p.id_equipe = p_id_equipe;
END;
$$ LANGUAGE plpgsql;

-- Função para listar atletas nascidos na cidade
CREATE OR REPLACE FUNCTION ds_listarAtletasNascidosNaCidade(p_cidade VARCHAR(100))
RETURNS TABLE (
    nome_atleta VARCHAR(100),
    posicao_atleta VARCHAR(20)
)
AS $$
BEGIN
    RETURN QUERY SELECT nome_completo, posicao
    FROM ds_atleta
    WHERE cidade_natal = p_cidade;
END;
$$ LANGUAGE plpgsql;

-- Função para listar jogos da competição
CREATE OR REPLACE FUNCTION ds_listarJogosDaCompeticao(p_id_competicao INT)
RETURNS TABLE (
    equipe_a VARCHAR(100),
    equipe_b VARCHAR(100),
    pontos_equipe_a INT,
    pontos_equipe_b INT
)
AS $$
BEGIN
    RETURN QUERY SELECT e1.nome_equipe AS equipe_a, e2.nome_equipe AS equipe_b, j.pontos_equipe_a, j.pontos_equipe_b
    FROM ds_joga j
    JOIN ds_equipe e1 ON j.id_equipe_a = e1.id_equipe
    JOIN ds_equipe e2 ON j.id_equipe_b = e2.id_equipe
    WHERE j.id_competicao = p_id_competicao
    ORDER BY j.pontos_equipe_a DESC, j.pontos_equipe_b DESC;
END;
$$ LANGUAGE plpgsql;
drop function ds_listarcampeas() 
-- Função para listar equipes campeãs
CREATE OR REPLACE FUNCTION ds_listarCampeas()
RETURNS TABLE (
    nome_equipe VARCHAR(100),
    qtd_campea INT
)
AS $$
BEGIN
    RETURN QUERY SELECT
        -- Renomear a variável nome_equipe usando um alias
        e.nome_equipe AS nome_equipe,
        e.qtd_campea
    FROM ds_equipe e
    WHERE e.qtd_campea > 0
    ORDER BY e.qtd_campea DESC;
END;
$$ LANGUAGE plpgsql;


-- Função para listar atletas por equipe
CREATE OR REPLACE FUNCTION ds_listarAtletasPorEquipe(p_id_equipe INT)
RETURNS TABLE (
    nome_atleta VARCHAR(100),
    posicao_atleta VARCHAR(20),
    atleta_ativo BOOLEAN
)
AS $$
BEGIN
    RETURN QUERY SELECT a.nome_completo, a.posicao, p.atleta_ativo
    FROM ds_atleta a
    JOIN ds_pertence p ON a.id_atleta = p.id_atleta
    WHERE p.id_equipe = p_id_equipe
    ORDER BY a.nome_completo;
END;
$$ LANGUAGE plpgsql;

-- Função para listar jogos das equipes
CREATE OR REPLACE FUNCTION ds_listarJogosDasEquipes(p_id_equipe_a INT, p_id_equipe_b INT)
RETURNS TABLE (
    id_competicao INT,
    pontos_equipe_a INT,
    pontos_equipe_b INT
)
AS $$
BEGIN
    RETURN QUERY SELECT id_competicao, pontos_equipe_a, pontos_equipe_b
    FROM ds_joga
    WHERE (id_equipe_a = p_id_equipe_a AND id_equipe_b = p_id_equipe_b)
        OR (id_equipe_a = p_id_equipe_b AND id_equipe_b = p_id_equipe_a)
    ORDER BY id_competicao;
END;
$$ LANGUAGE plpgsql;

-- Gatilho para garantir que a cidade de nascimento do atleta seja válida
CREATE OR REPLACE FUNCTION ds_validar_cidade_natal()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.cidade_natal NOT IN ('Porto Alegre', 'Caxias do Sul', 'Canoas', 'Pelotas', 'Santa Maria', 'Bento Gonçalves', 'Novo Hamburgo', 'Rio Grande', 'Uruguaiana', 'Passo Fundo', 'São Leopoldo', 'Bagé', 'Erechim', 'Cachoeira do Sul', 'Santa Cruz do Sul') THEN
        RAISE EXCEPTION 'Cidade de nascimento não permitida.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Gatilho para garantir que a cidade de origem da equipe seja válida
CREATE OR REPLACE FUNCTION ds_validar_cidade_origem()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.cidade_origem NOT IN ('Porto Alegre', 'Caxias do Sul', 'Canoas', 'Pelotas', 'Santa Maria', 'Bento Gonçalves', 'Novo Hamburgo', 'Rio Grande', 'Uruguaiana', 'Passo Fundo', 'São Leopoldo', 'Bagé', 'Erechim', 'Cachoeira do Sul', 'Santa Cruz do Sul') THEN
        RAISE EXCEPTION 'Cidade de origem não permitida.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Associar gatilho de validação de cidade de nascimento à tabela ds_atleta
CREATE TRIGGER validar_cidade_natal
BEFORE INSERT OR UPDATE ON ds_atleta
FOR EACH ROW EXECUTE FUNCTION ds_validar_cidade_natal();

-- Associar gatilho de validação de cidade de origem à tabela ds_equipe
CREATE TRIGGER validar_cidade_origem
BEFORE INSERT OR UPDATE ON ds_equipe
FOR EACH ROW EXECUTE FUNCTION ds_validar_cidade_origem();


-- Gatilho para garantir que a competição não ocorra na mesma cidade duas vezes no mesmo ano
CREATE OR REPLACE FUNCTION ds_validar_competicao()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM ds_competicao
        WHERE cidade_sede = NEW.cidade_sede AND semestre = NEW.semestre AND ano = NEW.ano
    ) THEN
        RAISE EXCEPTION 'Competição já ocorreu na mesma cidade no mesmo ano.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

 CREATE TRIGGER validar_competicao
BEFORE INSERT OR UPDATE ON ds_competicao
FOR EACH ROW EXECUTE FUNCTION ds_validar_competicao();

-- Gatilho para atualizar quantidade de campeonatos vencidos da equipe
CREATE OR REPLACE FUNCTION ds_atualizar_qtd_campea()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE ds_equipe
    SET qtd_campea = qtd_campea + 1
    WHERE id_equipe = NEW.equipe_vencedora;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Gatilho para garantir que uma equipe não jogue contra ela mesma
CREATE OR REPLACE FUNCTION ds_validar_equipes_jogo()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id_equipe_a = NEW.id_equipe_b THEN
        RAISE EXCEPTION 'Uma equipe não pode jogar contra ela mesma.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



-- Gatilho para identificar equipe vencedora e chamar o gatilho para atualizar quantidade de campeonatos vencidos
CREATE OR REPLACE FUNCTION ds_identificar_equipe_vencedora()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.pontos_equipe_a > NEW.pontos_equipe_b THEN
        NEW.equipe_vencedora = NEW.id_equipe_a;
    ELSIF NEW.pontos_equipe_a < NEW.pontos_equipe_b THEN
        NEW.equipe_vencedora = NEW.id_equipe_b;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

 CREATE TRIGGER validar_qtd_jogadores_equipe
BEFORE INSERT OR UPDATE ON ds_pertence
FOR EACH ROW EXECUTE FUNCTION ds_validar_qtd_jogadores_equipe();
-- Gatilho para garantir que uma equipe só participe de um campeonato se possuir no mínimo 18 jogadores contratados
CREATE OR REPLACE FUNCTION ds_validar_qtd_jogadores_equipe()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe) < 18
        OR
        (
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Opener') < 3
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Number3') < 2
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Midle-order') < 5
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Wicket-keeper') < 2
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Bowlers') < 2
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'All-rounders') < 2
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Fielders') < 2
        )
    ) THEN
        RAISE EXCEPTION 'Equipe não possui jogadores suficientes ou posições específicas.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_atletas_reserva
BEFORE INSERT OR UPDATE ON ds_pertence
FOR EACH ROW EXECUTE FUNCTION ds_validar_atletas_reserva();

-- Gatilho para garantir que há pelo menos um atleta reserva para cada posição de jogador
CREATE OR REPLACE FUNCTION ds_validar_atletas_reserva()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND atleta_ativo) < 11
        OR
        (
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Opener' AND atleta_ativo) < 2
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Number3' AND atleta_ativo) < 1
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Midle-order' AND atleta_ativo) < 4
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Wicket-keeper' AND atleta_ativo) < 1
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Bowlers' AND atleta_ativo) < 1
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'All-rounders' AND atleta_ativo) < 1
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Fielders' AND atleta_ativo) < 1
        )
    ) THEN
        RAISE EXCEPTION 'Equipe não possui jogadores reservas suficientes ou posições específicas.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Gatilho para garantir que uma equipe só participe de um campeonato se possuir no mínimo 18 jogadores contratados
CREATE OR REPLACE FUNCTION ds_validar_qtd_jogadores_equipe()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe) < 18
        OR
        (
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Opener') < 3
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Number3') < 2
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Midle-order') < 5
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Wicket-keeper') < 2
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Bowlers') < 2
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'All-rounders') < 2
            OR
            (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND posicao = 'Fielders') < 2
        )
    ) THEN
        RAISE EXCEPTION 'Equipe não possui jogadores suficientes ou posições específicas.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Gatilho para garantir que há pelo menos um atleta reserva para cada posição de jogador
CREATE OR REPLACE FUNCTION ds_validar_atletas_reserva()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        (SELECT COUNT(*) FROM ds_pertence WHERE id_equipe = NEW.id_equipe AND atleta_ativo) < 11
        OR
        (
            (SELECT COUNT(*) FROM ds_pertence 
             JOIN ds_atleta ON ds_pertence.id_atleta = ds_atleta.id_atleta
             WHERE ds_pertence.id_equipe = NEW.id_equipe AND ds_atleta.posicao = 'Opener' AND ds_pertence.atleta_ativo) < 2
            OR
            (SELECT COUNT(*) FROM ds_pertence 
             JOIN ds_atleta ON ds_pertence.id_atleta = ds_atleta.id_atleta
             WHERE ds_pertence.id_equipe = NEW.id_equipe AND ds_atleta.posicao = 'Number3' AND ds_pertence.atleta_ativo) < 1
            OR
            (SELECT COUNT(*) FROM ds_pertence 
             JOIN ds_atleta ON ds_pertence.id_atleta = ds_atleta.id_atleta
             WHERE ds_pertence.id_equipe = NEW.id_equipe AND ds_atleta.posicao = 'Midle-order' AND ds_pertence.atleta_ativo) < 4
            OR
            (SELECT COUNT(*) FROM ds_pertence 
             JOIN ds_atleta ON ds_pertence.id_atleta = ds_atleta.id_atleta
             WHERE ds_pertence.id_equipe = NEW.id_equipe AND ds_atleta.posicao = 'Wicket-keeper' AND ds_pertence.atleta_ativo) < 1
            OR
            (SELECT COUNT(*) FROM ds_pertence 
             JOIN ds_atleta ON ds_pertence.id_atleta = ds_atleta.id_atleta
             WHERE ds_pertence.id_equipe = NEW.id_equipe AND ds_atleta.posicao = 'Bowlers' AND ds_pertence.atleta_ativo) < 1
            OR
            (SELECT COUNT(*) FROM ds_pertence 
             JOIN ds_atleta ON ds_pertence.id_atleta = ds_atleta.id_atleta
             WHERE ds_pertence.id_equipe = NEW.id_equipe AND ds_atleta.posicao = 'All-rounders' AND ds_pertence.atleta_ativo) < 1
            OR
            (SELECT COUNT(*) FROM ds_pertence 
             JOIN ds_atleta ON ds_pertence.id_atleta = ds_atleta.id_atleta
             WHERE ds_pertence.id_equipe = NEW.id_equipe AND ds_atleta.posicao = 'Fielders' AND ds_pertence.atleta_ativo) < 1
        )
    ) THEN
        RAISE EXCEPTION 'Equipe não possui jogadores reservas suficientes ou posições específicas.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Gatilho para garantir que uma equipe não jogue contra ela mesma
CREATE OR REPLACE FUNCTION ds_validar_equipes_jogo()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id_equipe_a = NEW.id_equipe_b THEN
        RAISE EXCEPTION 'Uma equipe não pode jogar contra ela mesma.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Gatilho para identificar equipe vencedora e chamar o gatilho para atualizar quantidade de campeonatos vencidos
CREATE OR REPLACE FUNCTION ds_identificar_equipe_vencedora()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.pontos_equipe_a > NEW.pontos_equipe_b THEN
        NEW.equipe_vencedora = NEW.id_equipe_a;
    ELSIF NEW.pontos_equipe_a < NEW.pontos_equipe_b THEN
        NEW.equipe_vencedora = NEW.id_equipe_b;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Gatilho para garantir que uma competição não ocorra na mesma cidade duas vezes no mesmo ano
CREATE OR REPLACE FUNCTION ds_validar_competicao()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM ds_competicao
        WHERE cidade_sede = NEW.cidade_sede AND semestre = NEW.semestre AND ano = NEW.ano
    ) THEN
        RAISE EXCEPTION 'Competição já ocorreu na mesma cidade no mesmo ano.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Gatilho para atualizar quantidade de campeonatos vencidos da equipe
CREATE OR REPLACE FUNCTION ds_atualizar_qtd_campea()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE ds_equipe
    SET qtd_campea = qtd_campea + 1
    WHERE id_equipe = NEW.equipe_vencedora;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Adicionando um atleta
call  ds_adicionarAtleta('João Silva', '1990-05-15', 'Porto Alegre', 'Opener');

-- Adicionando uma equipe
SELECT ds_adicionarEquipe('Equipe A', '2000-01-01', 'Porto Alegre');

-- Adicionando uma competição
SELECT ds_adicionarCompeticao('Porto Alegre', 1, 2025, 'Competição 2025');
select * from ds_competicao dc 
-- Atualizando o status de pertence
call ds_atualizarPertence(1, 1, false);
select * from ds_pertence dp 
-- Atualizando resultados de um jogo
CALL ds_atualizarJoga(1, 2, 1, 10, 8);
select * from ds_joga dj
 -- Listando atletas de uma equipe
SELECT * FROM ds_listarAtletasDaEquipe(1);

-- Listando atletas nascidos em uma cidade
SELECT * FROM ds_listarAtletasNascidosNaCidade('Porto Alegre');
-- Listando jogos de uma competição
SELECT * FROM ds_listarJogosDaCompeticao(1);
-- Listando equipes campeãs
SELECT * FROM ds_listarCampeas();






