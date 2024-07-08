-- APS Kevin Azevedo Lopes,  Mariana da Costa Zatta, Marcos Henrique Gomes Vieira Saito

-- Seleciona todos os registros da tabela Livro
SELECT * FROM Livro;

-- Seleciona todos os registros da tabela Usuario
SELECT * FROM Usuario;

-- Seleciona todos os registros da tabela Funcionario
SELECT * FROM Funcionario;

-- Inserção de dados na tabela Emprestimo
-- Cada linha representa um empréstimo de um livro por um usuário com a ajuda de um funcionário
INSERT INTO Emprestimo (usuario_id, livro_id, funcionario_id, data_emprestimo, data_devolucao) VALUES
(1, 1, 1, '2024-06-01', '2024-06-15'),  -- Alice Silva emprestou Dom Casmurro com o funcionário João Pereira
(2, 2, 2, '2024-06-02', '2024-06-16'),  -- Marco Santos emprestou Memórias Póstumas de Brás Cubas com a funcionária Maria Oliveira
(3, 3, 3, '2024-06-03', NULL),  -- Carlos Oliveira emprestou O Guarani com o funcionário Pedro Lima (ainda não devolvido)
(4, 4, 4, '2024-06-04', '2024-06-18'),  -- Daniela Almeida emprestou Iracema com a funcionária Ana Souza
(1, 5, 1, '2024-06-05', NULL),  -- Alice Silva emprestou Capitães da Areia com o funcionário João Pereira (ainda não devolvido)
(2, 6, 2, '2024-06-06', NULL),  -- Marco Santos emprestou Grande Sertão: Veredas com a funcionária Maria Oliveira (ainda não devolvido)
(3, 7, 3, '2024-06-07', '2024-06-21'),  -- Carlos Oliveira emprestou A Moreninha com o funcionário Pedro Lima
(4, 8, 4, '2024-06-08', '2024-06-22');  -- Daniela Almeida emprestou Senhora com a funcionária Ana Souza

-- Inserção de dados na tabela Reserva
-- Cada linha representa uma reserva de um livro por um usuário com a ajuda de um funcionário
INSERT INTO Reserva (usuario_id, livro_id, funcionario_id, data_reserva) VALUES
(1, 2, 2, '2024-07-01'),  -- Alice Silva reservou Memórias Póstumas de Brás Cubas com a funcionária Maria Oliveira
(2, 3, 3, '2024-07-02'),  -- Marco Santos reservou O Guarani com o funcionário Pedro Lima
(3, 4, 4, '2024-07-03'),  -- Carlos Oliveira reservou Iracema com a funcionária Ana Souza
(4, 5, 1, '2024-07-04'),  -- Daniela Almeida reservou Capitães da Areia com o funcionário João Pereira
(1, 6, 2, '2024-07-05'),  -- Alice Silva reservou Grande Sertão: Veredas com a funcionária Maria Oliveira
(2, 7, 3, '2024-07-06'),  -- Marco Santos reservou A Moreninha com o funcionário Pedro Lima
(3, 8, 4, '2024-07-07'),  -- Carlos Oliveira reservou Senhora com a funcionária Ana Souza
(4, 1, 1, '2024-07-08');  -- Daniela Almeida reservou Dom Casmurro com o funcionário João Pereira

-- Seleciona todos os registros da tabela Emprestimo
SELECT * FROM Emprestimo;

-- Seleciona todos os registros da tabela Reserva
SELECT * FROM Reserva;

-- Seleciona todos os registros da tabela Auditoria_Emprestimo
SELECT * FROM Auditoria_Emprestimo;

-- Verifica o plano de execução da consulta para verificar se o índice está sendo usado
EXPLAIN ANALYZE SELECT * FROM Usuario WHERE nome = 'Alice Silva';

-- Verifica o plano de execução da consulta para verificar se o índice está sendo usado
EXPLAIN ANALYZE SELECT * FROM Livro WHERE categoria = 'Ficção';

-- Verifica o plano de execução da consulta para verificar se o índice está sendo usado
EXPLAIN ANALYZE SELECT * FROM Livro WHERE titulo = 'Dom Casmurro';

-- Chama a função obter_livros_por_autor para obter todos os livros de um determinado autor
SELECT * FROM obter_livros_por_autor('Machado de Assis');

-- Chama a função total_emprestimos_por_usuario para obter o total de empréstimos de um usuário
SELECT total_emprestimos_por_usuario(1);

-- Chama a função livros_emprestados_por_usuario para obter todos os livros emprestados por um usuário
SELECT * FROM livros_emprestados_por_usuario(1);

-- Seleciona todos os registros da visão livros_emprestados
SELECT * FROM livros_emprestados;

-- Seleciona todos os registros da visão reservas_ativas
SELECT * FROM reservas_ativas;

-- Seleciona todos os registros da visão livros_disponiveis
SELECT * FROM livros_disponiveis;

-- Atualiza a data de devolução de um empréstimo específico e verifica a tabela de auditoria
UPDATE Emprestimo SET data_devolucao = '2024-07-10' WHERE emprestimo_id = 1;

SELECT * FROM auditoria_emprestimo;

-- Seleciona todos os registros da tabela Auditoria_Emprestimo para verificar o log após a atualização
SELECT * FROM Auditoria_Emprestimo;

-- Deleta um empréstimo específico e verifica a tabela de auditoria
DELETE FROM Emprestimo WHERE emprestimo_id = 1;

-- Seleciona todos os registros da tabela Auditoria_Emprestimo para verificar o log após a exclusão
SELECT * FROM Auditoria_Emprestimo;

