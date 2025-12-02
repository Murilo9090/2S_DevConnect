USE db_Devconnect_;

-- Exiba todos os nomes dos seguidores de quem esta seguindo e de quem será seguido
SELECT 
    seguir.nomeDeUsuario AS nome_seguidor,
    seguida.nomeDeUsuario AS nome_seguida
FROM tb_seguidor S
INNER JOIN tb_usuario seguir ON S.id_usuario_seguidor = seguir.id_usuario
INNER JOIN tb_usuario seguida ON S.id_usuario_seguido = seguida.id_usuario;


-- Exiba quando seguidores possui um respectivo usuário
SELECT 
    U.nomeDeUsuario,
    COUNT(S.id_usuario_seguidor) AS qtd_seguidores
FROM tb_seguidor S
INNER JOIN tb_usuario U ON S.id_usuario_seguido = U.id_usuario
GROUP BY U.nomeDeUsuario;



-- Exiba todas as publicações contendo a descrição, o caminho de imagem, o nome de usuário
SELECT 
    U.nomeDeUsuario,
    P.descricao,
    P.imagemUrl
FROM tb_publicacao P
INNER JOIN tb_usuario U ON P.id_usuario = U.id_usuario;



-- Exiba todos os comentários com o nome e o texto de respectiva publicação
SELECT 
    U.nomeDeUsuario AS nome_comentador,
    C.texto,
    P.imagemUrl,
    Pub.nomeDeUsuario AS nome_publicador
FROM tb_comentario C
INNER JOIN tb_usuario U ON C.id_usuario = U.id_usuario
INNER JOIN tb_publicacao P ON C.id_publicacao = P.id_publicacao
INNER JOIN tb_usuario Pub ON P.id_usuario = Pub.id_usuario;



-- Exiba a quantidade de curtidas de uma respectiva publicação
SELECT 
    U.nomeDeUsuario AS publicador,
    P.imagemUrl,
    COUNT(Cur.id_usuario) AS qnt_curtidas
FROM tb_curtida Cur
INNER JOIN tb_publicacao P ON Cur.id_publicacao = P.id_publicacao
INNER JOIN tb_usuario U ON P.id_usuario = U.id_usuario
GROUP BY P.imagemUrl, U.nomeDeUsuario;


-- Exiba todos usuários que não chegaram a fazer publicações
SELECT 
    U.nomeDeUsuario, 
    P.id_publicacao AS Publicacoes
FROM tb_publicacao P
RIGHT JOIN tb_usuario U ON P.id_usuario = U.id_usuario
WHERE P.id_publicacao IS NULL;



-- Exiba todos usuários que não chegaram a fazer reações
SELECT 
    U.nomeDeUsuario, 
    Cur.id_curtida AS Curtidas
FROM tb_curtida Cur
RIGHT JOIN tb_usuario U ON Cur.id_usuario = U.id_usuario
WHERE Cur.id_curtida IS NULL;

