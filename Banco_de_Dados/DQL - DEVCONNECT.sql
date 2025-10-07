--DQL

USE Devconnect

--Listar usuario em ordem crescente
SELECT nome_completo
FROM  tb_usuario
ORDER BY id ASC;

--Listar em ordem decrescente
SELECT nome_completo
FROM tb_usuario
ORDER BY id DESC;


