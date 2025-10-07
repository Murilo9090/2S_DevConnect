--DML
USE Devconnect;

INSERT INTO tb_usuario (nome_completo,nome_usuario,email,senha,foto_perfil_url)
VALUES('Tupac Shakur', '2pac' , '2pac@gmail.com', 123, '2pac' );

SELECT * FROM tb_usuario

INSERT INTO tb_publi (descricao,imagem_url,data_publi)
VALUES('2pac' , '2pac.url', '2025-01-11' );

SELECT * FROM tb_publi

INSERT INTO tb_comentario(texto, data_comentario, id_usuario, id_publi)
VALUES('2PAC', '2025-01-11', '4', '1')

SELECT * FROM tb_comentario

DELETE FROM tb_comentario
WHERE id = 1