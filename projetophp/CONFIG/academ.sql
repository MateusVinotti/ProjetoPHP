-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 19/06/2024 às 00:53
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `academ`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno_treinos`
--

CREATE TABLE `aluno_treinos` (
  `id` int(11) NOT NULL,
  `aluno_id` int(11) DEFAULT NULL,
  `treino_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `treinos`
--

CREATE TABLE treinos (
    'treino_id' INT AUTO_INCREMENT PRIMARY KEY,
    'nome' VARCHAR(255) NOT NULL,
    'descricao' TEXT,
    'criador_id' INT NOT NULL,
    FOREIGN KEY (criador_id) REFERENCES usuarios(usuario_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE usuarios (
    'usuario_id'INT AUTO_INCREMENT PRIMARY KEY,
    'nome' VARCHAR(100) NOT NULL,
    'email' VARCHAR(100) NOT NULL,
    'senha' VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome_usuario`, `senha`) VALUES
(1, 'alantrizoti9090@gmail.com', '$2y$10$8kkTq8xhbfkTryInXS.CBune4fJezEhrq5JZPuUhIoy50apZ04NCC'),
(3, '@gmail.com', '$2y$10$pQh/akVnq8AGnJ4FvYj2YeQQKIP87a9dwDs49KPAgYvN9QhflIscy'),
(4, 'Brunão', '$2y$10$70L5ZsvvbT2zGYu59ktkJukTm3yXqH9naBC2py3d/noLPoskGZGDC'),
(6, 'Alan', '$2y$10$n1VNPWELc4iJjzFsd2kk6uJAyOFMVVu6ko2zu3byqcOJmVvubc53i'),
(7, 'Alan11', '$2y$10$e0FifRb23zcoobUmE5Apw.m58JvvY9RDNGBAnUngIOlLgHC5hMohq');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno_treinos`
--
ALTER TABLE `aluno_treinos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aluno_id` (`aluno_id`),
  ADD KEY `treino_id` (`treino_id`);

--
-- Índices de tabela `treinos`
--
ALTER TABLE `treinos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criador_id` (`criador_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_usuario` (`nome_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno_treinos`
--
ALTER TABLE `aluno_treinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `treinos`
--
ALTER TABLE `treinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno_treinos`
--
ALTER TABLE `aluno_treinos`
  ADD CONSTRAINT `aluno_treinos_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `aluno_treinos_ibfk_2` FOREIGN KEY (`treino_id`) REFERENCES `treinos` (`id`);

--
-- Restrições para tabelas `treinos`
--
ALTER TABLE `treinos`
  ADD CONSTRAINT `treinos_ibfk_1` FOREIGN KEY (`criador_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
