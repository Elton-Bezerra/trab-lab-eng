-- Generation Time: 22-Nov-2017 às 03:43
-- Versão do servidor: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teams`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `elenco`
--


DROP TABLE IF EXISTS `elenco`;
CREATE TABLE IF NOT EXISTS `elenco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `posicao` varchar(255) DEFAULT NULL,
  `idTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7BDFE01CE78CDFFE` (`idTime`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


--
-- Extraindo dados da tabela `elenco`
--

INSERT INTO `elenco` (`id`, `nome`, `posicao`, `idTime`) VALUES
(1, 'Jô', 'Atacante', 1),
(2, 'Lucas Pratto', 'Atacante', 2),
(4, 'Alisson', 'Atacante', 3),
(10, 'Fabio Carille', 'Técnico', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `times`
--

DROP TABLE IF EXISTS `times`;
CREATE TABLE IF NOT EXISTS `times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `dataFundacao` date DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estadio` varchar(255) DEFAULT NULL,
  `patrimonio` decimal(15,2) DEFAULT NULL,
  `qtdSocios` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `times`
--

INSERT INTO `times` (`id`, `nome`, `dataFundacao`, `cidade`, `estadio`, `patrimonio`, `qtdSocios`) VALUES
(1, 'Sport Club Corinthians Paulista', '1910-09-01', 'São Paulo', 'Arena Corinthians', '1000000.00', 15000),

(2, 'São Paulo Futebol Clube', '1997-10-28', 'São Paulo', 'Cícero Pompeu de Toledo', '800000.00', 100),
(3, 'Santos', '1980-11-21', 'Santos', 'Vila Belmiro', '19000.00', 29090);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `elenco`
--
ALTER TABLE `elenco`
  ADD CONSTRAINT `FK7BDFE01CE78CDFFE` FOREIGN KEY (`idTime`) REFERENCES `times` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
