-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 29/06/2022 às 20:22
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
-- Estrutura para tabela `configs`
--

CREATE TABLE `configs` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `valor` varbinary(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `configs`
--

INSERT INTO `configs` (`id`, `nome`, `valor`) VALUES
(1, 'versao', 0x312e302e31),
(2, 'notas', 0xf09f918b20415455414c495a41c387c3834f20444953504f4ec38d56454c2120f09f918b),
(3, 'sms', 0x687474703a2f2f646f6d696e696f2e78797a2f736d732e706870),
(4, 'update', 0x687474703a2f2f646f6d696e696f2e78797a2f7570646174652e706870),
(5, 'email', 0x6d6575656d61696c40676d61696c2e636f6d),
(6, 'contato', 0x68747470733a2f2f742e6d652f74656c656772616d),
(7, 'termos', 0x687474703a2f2f646f6d696e696f2e78797a2f617070732f7465726d6f732e706870),
(8, 'checkuser', 0x74727565),
(9, 'msg', 0xf09f9a8020434c4951554520454d20415455414c495a415220f09f9a80),
(10, 'nsms', 0x3031);

-- --------------------------------------------------------

--
-- Estrutura para tabela `payloads`
--

CREATE TABLE `payloads` (
  `id` int(11) NOT NULL,
  `Name` varbinary(100) NOT NULL,
  `FLAG` varchar(100) NOT NULL,
  `Payload` varchar(200) NOT NULL,
  `SNI` varchar(100) NOT NULL,
  `TlsIP` varchar(100) NOT NULL,
  `ProxyIP` varchar(100) NOT NULL,
  `ProxyPort` varchar(10) NOT NULL,
  `Info` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `payloads`
--

INSERT INTO `payloads` (`id`, `Name`, `FLAG`, `Payload`, `SNI`, `TlsIP`, `ProxyIP`, `ProxyPort`, `Info`) VALUES
(1, 0xf09f929c205649564f20434c4f554420f09f929c, 'vivo', 'GET wss://api.bitso.com/ HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]Connection: Keep-Alive[crlf][crlf]', 'api.bitso.com', '172.64.195.2', '', '443', 'Tlsws'),
(2, 0xf09f929c205649564f204a4f474f5320f09f929c, 'vivo', 'GET wss://support.pokemon.com/ HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]Connection: Keep-Alive[crlf][crlf]', 'support.pokemon.com', '172.64.130.2', '', '443', 'Tlsws'),
(3, 0xf09f92992054494d20434c4f554420f09f9299, 'tim', 'GET wss://static.r4you.co  HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: websocket[crlf][crlf]', 'static.r4you.co', 'static.r4you.co', '', '443', 'Tlsws'),
(4, 0xf09f92992054494d205241494f20f09f9299, 'tim', 'GET wss://static.r4you.co  HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: websocket[crlf][crlf]', 'static.r4you.co', '104.26.5.175', '', '443', 'Tlsws'),
(5, 0xe29da4efb88f20434c41524f20535045454420e29da4efb88f, 'claro', 'GET wss://ct.livestream.com/ HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: websocket[crlf][crlf]', 'ct.livestream.com', 'ct.livestream.com', '', '443', 'Tlsws'),
(6, 0xe29da4efb88f20434c41524f20464c495820e29da4efb88f, 'claro', 'GET wss://lp.livestream.com/ HTTP/1.1[crlf]Host: [app_host][crlf]Upgrade: websocket[crlf][crlf]', 'lp.livestream.com', 'lp.livestream.com', '', '443', 'Tlsws'),
(7, 0xf09f929b204f49204641535420f09f929b, 'oi', 'GET ws://www.hbogo.com.br HTTP/1.1\nHost: [app_host]\nUpgrade: ws\n\n', 'www.hbogo.com.br', 'www.hbogo.com.br', '', '', 'Tlsws'),
(8, 0xf09f929b204f4920574f524c4420f09f929b, 'oi', 'GET ws://www.hbogo.com.br HTTP/1.1\nHost: [app_host]\nUpgrade: ws\n\n', 'www.hbogo.com.br', '104.16.53.91', '', '', 'Tlsws');

-- --------------------------------------------------------

--
-- Estrutura para tabela `portas`
--

CREATE TABLE `portas` (
  `id` int(11) NOT NULL,
  `Porta` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `portas`
--

INSERT INTO `portas` (`id`, `Porta`) VALUES
(1, '7100'),
(2, '7200'),
(3, '7300');

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

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `login` varchar(25) NOT NULL,
  `senha` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `payloads`
--
ALTER TABLE `payloads`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `portas`
--
ALTER TABLE `portas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servidores`
--
ALTER TABLE `servidores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `payloads`
--
ALTER TABLE `payloads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `portas`
--
ALTER TABLE `portas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `servidores`
--
ALTER TABLE `servidores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
