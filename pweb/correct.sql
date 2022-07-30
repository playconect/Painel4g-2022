-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 29/06/2022 às 20:33
-- Versão do servidor: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- Versão do PHP: 8.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sshplus`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `servidores`
--

CREATE TABLE `servidores` (
  `id` int(11) NOT NULL,
  `Name` varbinary(50) NOT NULL,
  `TYPE` varchar(20) NOT NULL DEFAULT 'premium',
  `FLAG` varchar(20) NOT NULL DEFAULT 'br.png',
  `ServerIP` varchar(100) NOT NULL,
  `CheckUser` varchar(200) NOT NULL,
  `ServerPort` varchar(5) NOT NULL DEFAULT '22',
  `SSLPort` varchar(5) NOT NULL DEFAULT '443',
  `USER` varchar(20) NOT NULL,
  `PASS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `servidores`
--

INSERT INTO `servidores` (`id`, `Name`, `TYPE`, `FLAG`, `ServerIP`, `CheckUser`, `ServerPort`, `SSLPort`, `USER`, `PASS`) VALUES
(1, 0xe29aa1204d4555205345525649444f5220303120e29aa1, 'premium', 'br.png', 'meudominio.xyz', 'http://meudominio.xyz:8080/checkUser', '22', '443', '', ''),
(2, 0xe29aa1204d4555205345525649444f5220303220e29aa1, 'premium', 'br.png', 'meudominio.xyz', 'http://meudominio.xyz:8080/checkUser', '22', '443', '', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `servidores`
--
ALTER TABLE `servidores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `servidores`
--
ALTER TABLE `servidores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
