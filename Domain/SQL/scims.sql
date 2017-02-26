-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u6
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 06 Décembre 2016 à 13:03
-- Version du serveur: 5.5.52
-- Version de PHP: 5.4.45-0+deb7u5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `scims`
--

-- --------------------------------------------------------

--
-- Structure de la table `Articles`
--

CREATE TABLE IF NOT EXISTS `Articles` (
  `Id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Content` mediumtext COLLATE utf8_unicode_ci,
  `Author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LastModified` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CategoryId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `StateId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` text COLLATE utf8_unicode_ci,
  `Vues` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AUTHOR` (`Author`),
  KEY `User` (`UserId`),
  KEY `Categorie_id` (`CategoryId`),
  KEY `StateId` (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Articles`
--

INSERT INTO `Articles` (`Id`, `Content`, `Author`, `Title`, `LastModified`, `UserId`, `CategoryId`, `StateId`, `Tags`, `Vues`) VALUES
('582e0a05d0901', '                           <p>\n      Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.\n    </p>\n    <p>\n      Vbi curarum abiectis ponderibus aliis tamquam nodum et codicem difficillimum Caesarem convellere nisu valido cogitabat, eique deliberanti cum proximis clandestinis conloquiis et nocturnis qua vi, quibusve commentis id fieret, antequam effundendis rebus pertinacius incumberet confidentia, acciri mollioribus scriptis per simulationem tractatus publici nimis urgentis eundem placuerat Gallum, ut auxilio destitutus sine ullo interiret obstaculo. <br></p><p></p><br><div id="summary" contenteditable="false"><p><a href="#1">1 [Insérer le titre ici]</a></p><p><a href="#1s1">1.1 [Insérer le titre ici]</a></p><p><a href="#2">2 [Insérer le titre ici]</a></p><p><a href="#2s1">2.1 [Insérer le titre ici]</a></p><p><a href="#2s2">2.2 [Insérer le titre ici]</a></p><p><a href="#2s3">2.3 [Insérer le titre ici]</a></p><p><a href="#3">3 [Insérer le titre ici]</a></p><p><a href="#4">4 [Insérer le titre ici]</a></p><p><a href="#5">5 [Insérer le titre ici]</a></p><p><a href="#5s1">5.1 [Insérer le titre ici]</a></p><p><a href="#5s2">5.2 [Insérer le titre ici]</a></p><p><a href="#5s3">5.3 [Insérer le titre ici]</a></p></div><br><p></p><section class="disabled"><h1 id="1"><span>1</span> [Insérer le titre ici]</h1><p></p><section class="disabled"><h1 id="1s1"><span>1.1</span> [Insérer le titre ici]</h1></section><p></p><p><br></p></section><p></p><p></p><section class="disabled"><h1 id="2"><span>2</span> [Insérer le titre ici]</h1><p></p><section class="disabled"><h1 id="2s1"><span>2.1</span> [Insérer le titre ici]</h1></section><p></p><p></p><section class="disabled"><h1 id="2s2"><span>2.2</span> [Insérer le titre ici]</h1></section><p></p><p></p><section class="disabled"><h1 id="2s3"><span>2.3</span> [Insérer le titre ici]</h1></section><p></p><p><br></p></section><p></p><p></p><section class="disabled"><h1 id="3"><span>3</span> [Insérer le titre ici]</h1></section><p></p><p></p><section class="disabled"><h1 id="4"><span>4</span> [Insérer le titre ici]</h1></section><p></p><p></p><section class="disabled"><h1 id="5"><span>5</span> [Insérer le titre ici]</h1><p></p><section class="disabled"><h1 id="5s1"><span>5.1</span> [Insérer le titre ici]</h1></section><p></p><p></p><section class="disabled"><h1 id="5s2"><span>5.2</span> [Insérer le titre ici]</h1></section><p></p><p></p><section class="disabled"><h1 id="5s3"><span>5.3</span> [Insérer le titre ici]</h1></section><p></p><p><br></p></section><p></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>\n      \n      \n      \n      \n      \n      \n      \n      \n      \n      \n      \n      \n      \n      \n      \n      ', 'Stanley Kubrick', 'Article sdfsdf', '29/11/2016 16:39', '582db971830a0', '482dbb6367198', '582f1e982e161', NULL, 0),
('582e0a600dd68', ' <p>\nSuperatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.\n</p><p>\nVbi curarum abiectis ponderibus aliis tamquam nodum et codicem difficillimum Caesarem convellere nisu valido cogitabat, eique deliberanti cum proximis clandestinis conloquiis et nocturnis qua vi, quibusve commentis id fieret, antequam effundendis rebus pertinacius incumberet confidentia, acciri mollioribus scriptis per simulationem tractatus publici nimis urgentis eundem placuerat Gallum, ut auxilio destitutus sine ullo interiret obstaculo.</p><p><section class="disabled" style="text-indent: 12px;"><h1>[Insérer Le titre ici]</h1><div>fjdsncdjks</div><div><section class="disabled" style="text-indent: 12px;"><h1>[Insérer Le titre ici]</h1><div>ncjsnk</div><div><br></div><div>nkcsq</div></section>,kz</div><div><br></div></section><br></p>\n\n      ', 'Stanley Kubrick', 'Article 2', '28/11/2016 09:49', '582db971830a0', '582dbb6367190', '582f1e982e161', NULL, 1),
('582e0a6771954', '<p>\r\nUn microcontrôleur (en notation abrégée µc, ou uc ou encore MCU en anglais) est un circuit intégré qui rassemble les éléments essentiels d''un ordinateur : processeur, mémoires (mémoire morte pour le programme, mémoire vive pour les données), unités périphériques et interfaces d''entrées-sorties. Les microcontrôleurs se caractérisent par un plus haut degré d''intégration, une plus faible consommation électrique, une vitesse de fonctionnement plus faible (de quelques mégahertz jusqu''à plus d''un gigahertz1) et un coût réduit par rapport aux microprocesseurs polyvalents utilisés dans les ordinateurs personnels.\r\n</p><p>\r\nPar rapport à des systèmes électroniques à base de microprocesseurs et autres composants séparés, les microcontrôleurs permettent de diminuer la taille, la consommation électrique et le coût des produits. Ils ont ainsi permis de démocratiser l''utilisation de l''informatique dans un grand nombre de produits et de procédés.\r\n</p><p>\r\nLes microcontrôleurs sont fréquemment utilisés dans les systèmes embarqués, comme les contrôleurs des moteurs automobiles, les télécommandes, les appareils de bureau, l''électroménager, les jouets, la téléphonie mobile, etc.</p>', 'Stanley Kubrick', 'Article 3', '22/11/2016 09:30', '582db971830a0', '582dbc277a58a', '582f1e982e161', NULL, 0),
('582e0a6f61e08', '<p>\r\nLa physique est la science qui tente de comprendre, de modéliser, voire d''expliquer les phénomènes naturels de l''univers. Elle correspond à l''étude du monde qui nous entoure sous toutes ses formes, des lois de sa variation et de son évolution.\r\n</p><p>\r\nLa modélisation des systèmes peut laisser de côté les processus chimiques et biologiques ou les inclure. La physique développe des représentations du monde expérimentalement vérifiables dans un domaine de définition donné. Elle produit donc plusieurs lectures du monde, chacune n''étant considérée comme précise que jusqu''à un certain point.\r\n</p><p>\r\nLa physique telle que conceptualisée par Isaac Newton, aujourd’hui dénommé physique classique, butait sur l''explication de phénomènes naturels comme le rayonnement du corps noir (catastrophe ultraviolette) ou les anomalies de l’orbite de la planète Mercure, ce qui posait un réel problème aux physiciens. Les tentatives effectuées pour comprendre et modéliser les phénomènes nouveaux auxquels on accédait à la fin du XIXe siècle révisèrent en profondeur le modèle newtonien pour donner naissance à deux nouveaux ensembles de théories physiques. Certains diront qu''il existe donc trois ensembles de théories physiques établies, chacune valide dans le domaine d’applications qui lui est propre :\r\n</p><p>\r\n    La physique classique (monde des milieux solides, liquides et gazeux), toujours d''actualité, c''est elle qui s’applique, par exemple, à la construction des routes, des ponts et des avions. Elle utilise les anciennes notions de temps, d''espace, de matière et d''énergie telles que définies par Isaac Newton ;\r\n</p><p>\r\n    La physique quantique (monde microscopique des particules et des champs) qui s’applique, par exemple, à la technologie utilisée pour la production des composants électroniques (la diode à effet tunnel par exemple) ou encore aux lasers. Elle se fonde sur de nouvelles définitions de l''énergie et de la matière mais conserve les anciennes notions de temps et d''espace de la physique classique, ces deux dernières étant contredites par la relativité générale. La physique quantique n''a jamais été prise en défaut à ce jour ;\r\n</p><p>\r\n    La relativité générale (monde macroscopique des planètes, des trous noirs et de la gravité) qui s’applique, par exemple, à la mise au point et au traitement de l''information nécessaire au fonctionnement des systèmes GPS. Elle se fonde sur de nouvelles définitions du temps et de l''espace mais conserve les anciennes notions d''énergie et de matière de la physique classique, ces deux dernières étant contredites par la physique quantique. La relativité générale n''a jamais été prise en défaut à ce jour.\r\n</p><p>\r\nD''autres estiment que chaque branche de la physique a son importance à part entière, sans forcément s''inclure dans l''un de ces ensembles. De plus, il se trouve qu''il n''y a pas de situation physique courante où ces deux dernières théories s''appliquent en même temps. La relativité s''applique au monde macroscopique et la physique quantique au monde microscopique. Le problème actuel de la recherche en physique fondamentale est donc de tenter d''unifier ces deux dernières théories (voir Gravité quantique).</p>', 'Stanley Kubrick', 'Article 4', '22/11/2016 09:25', '582db971830a0', '582dbb81d7480', '582f1e982e161', NULL, 0),
('582e0a780e625', '<p>\r\nLa statistique est l''étude de la collecte de données, leur analyse, leur traitement, l''interprétation des résultats et leur présentation afin de rendre les données compréhensibles par tous. C''est à la fois une science, une méthode et un ensemble de techniques.\r\n</p><p>\r\nRemarquons que la statistique est parfois notée1 « la Statistique » (avec une majuscule), ce qui permet de différencier cette science avec une statistique (avec une minuscule). Le pluriel a également souvent été utilisé2 historiquement pour la désigner : « les statistiques », cela permet de montrer la diversité de cette science.\r\n</p><p>\r\nLa statistique est pour les uns un domaine des mathématiques, pour les autres (en particulier les anglo-saxons) une discipline à part entière hors des mathématiques, enfin de plus en plus, elle fait partie de ce que l''on appelle aujourd''hui la Sciences des Données (en anglais : Data Science). Elle possède une composante théorique ainsi qu''une composante appliquée. La composante théorique s''appuie sur la théorie des probabilités et forme avec cette dernière, les sciences de l''aléatoire. La statistique appliquée est utilisée dans presque tous les domaines de l''activité humaine3 : ingénierie, management, économie, biologie, informatique, etc. La statistique utilise des règles et des méthodes sur la collecte des données, pour que celles-ci puissent être correctement interprétées, souvent comme composante d''une aide à la décision. Le statisticien a pour profession la mise au point d''outils statistiques, dans le secteur privé ou le secteur public, et leur exploitation généralement dans un domaine d''expertise.</p>', 'Stanley Kubrick', 'Article 5', '22/11/2016 09:27', '582db971830a0', '582dbb6367190', '582f1e982e161', NULL, 1),
('582e0b7e665bb', '<p>\r\nLe terme probabilité possède plusieurs sens : venu historiquement du latin probabilitas, il désigne l''opposé du concept de certitude ; il est également une évaluation du caractère probable d''un événement, c''est-à-dire qu''une valeur permet de représenter son degré de certitude ; récemment, la probabilité est devenue une science mathématique et est appelée théorie des probabilités ou plus simplement probabilités; enfin une doctrine porte également le nom de probabilisme.\r\n</p><p>\r\nLa probabilité d''un événement est un nombre réel compris entre 0 et 1. Plus ce nombre est grand, plus le risque, ou la chance, que l''événement se produise est grand. L''étude scientifique des probabilités est relativement récente dans l''histoire des mathématiques. L''étude des probabilités a connu de nombreux développements depuis le XVIIIe siècle grâce à l''étude de l''aspect aléatoire et en partie imprévisible de certains phénomènes, en particulier les jeux de hasard. Ceux-ci ont conduit les mathématiciens à développer une théorie qui a ensuite eu des implications dans des domaines aussi variés que la météorologie, la finance ou la chimie.</p>', 'Stanley Kubrick', 'Article 6', '22/11/2016 09:26', '582db971830a0', '582dbb6367190', '582f1e982e161', NULL, 1),
('582ec60d3f524', '      <p>\r\nLa médecine quantique est une idée proposée par Fritz-Albert Popp en 1970 selon laquelle les cellules communiquent par signaux électromagnétiques, la biorésonance, concept pseudo-scientifique.\r\n\r\n</p><p>\r\nPour les scientifiques conventionnels, la médecine quantique ne résiste pas à l''analyse scientifique et abuse du public en reprenant la terminologie de la physique quantique pour des concepts décrits comme fantaisistes..\r\n</p>\r\n\r\n    ', 'Stanley Kubrick', 'Article 8', '22/11/2016 07:42', '582db971830a0', '582dbf57287fd', '582f1e982e161', NULL, 0),
('5832d46e097e0', '<p>La physique quantique est l''appellation générale d''un ensemble de théories physiques nées au XXe siècle qui, comme la théorie de la relativité, marque une rupture avec ce que l''on appelle maintenant la physique classique, l''ensemble des théories et principes physiques admis au XIXe siècle. Les théories dites « quantiques » décrivent le comportement des atomes et des particules — ce que la physique classique, notamment la mécanique newtonienne et la théorie électromagnétique de Maxwell, n''avait pu faire — et permettent d''élucider certaines propriétés du rayonnement électromagnétique.</p>\r\n<p>La physique quantique a apporté une révolution conceptuelle ayant des répercussions jusqu''en philosophie (remise en cause du déterminisme) et en littérature (science-fiction). Elle a permis nombre d''applications technologiques : énergie nucléaire, imagerie médicale par résonance magnétique nucléaire, diode, transistor, circuit intégré, microscope électronique et laser. Un siècle après sa conception, elle est abondamment utilisée dans la recherche en chimie théorique (chimie quantique), en physique (mécanique quantique, théorie quantique des champs, physique de la matière condensée, physique nucléaire, physique des particules, physique statistique quantique, astrophysique, gravité quantique), en mathématiques (formalisation de la théorie des champs) et, récemment, en informatique (ordinateur quantique, cryptographie quantique). Elle est considérée avec la relativité générale d''Einstein comme l''une des deux théories majeures du XXe siècle.</p>\r\n\r\n    \r\n    \r\n    \r\n    ', 'Stanley Kubrick', 'Kero''s Article longer', '21/11/2016 11:03', '582db971830a0', '582dbb81d7480', '582f1e982e161', NULL, 0),
('58334652e3269', '<p> Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.\r\n</p><p>\r\nVbi curarum abiectis ponderibus aliis tamquam nodum et codicem difficillimum Caesarem convellere nisu valido cogitabat, eique deliberanti cum proximis clandestinis conloquiis et nocturnis qua vi, quibusve commentis id fieret, antequam effundendis rebus pertinacius incumberet confidentia, acciri mollioribus scriptis per simulationem tractatus publici nimis urgentis eundem placuerat Gallum, ut auxilio destitutus sine ullo interiret obstaculo.\r\n</p>', 'Stanley Kubrick', 'Article', '21/11/2016 19:10', '582db971830a0', '582dbb6367190', '582f1e982e161', NULL, 0),
('583346ac44ca7', '       \n   <p> Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.\n</p><p>\nVbi curarum abiectis ponderibus aliis tamquam nodum et codicem difficillimum Caesarem convellere nisu valido cogitabat, eique deliberanti cum proximis clandestinis conloquiis et nocturnis qua vi, quibusve commentis id fieret, antequam effundendis rebus pertinacius incumberet confidentia, acciri mollioribus scriptis per simulationem tractatus publici nimis urgentis eundem placuerat Gallum, ut auxilio destitutus sine ullo interiret obstaculo.</p><p><br></p><p><div id="summary" contenteditable="false"><p><a href="#1">1 HELLO</a></p><p><a href="#1s1">1.1&nbsp;jhgjlhg</a></p><p><a href="#1s2">1.2 [Insérer le titre ici]</a></p><p><a href="#1s2s1">1.2.1 [Insérer le titre ici]</a></p><p><a href="#2">2 [Insérer le titre ici]</a></p></div><br></p><p><br></p><p>gjholih</p><p></p><section class="disabled"><h1 id="1"><span>1</span> HELLO</h1><div>jkhggkj</div><div>jlikh</div><p></p><section class="disabled"><h1 id="1s1"><span>1.1</span>&nbsp;jhgjlhg</h1></section><p></p><p></p><section class="disabled"><h1 id="1s2"><span>1.2</span> [Insérer le titre ici]</h1><p></p><section class="disabled"><h1 id="1s2s1"><span>1.2.1</span> [Insérer le titre ici]</h1></section><p></p><div><br></div></section><p></p><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></div></section><p></p><p></p><section class="disabled"><h1 id="2"><span>2</span> [Insérer le titre ici]</h1></section><p></p><p><br></p> \n      ', 'Stanley Kubrick', 'Article', '29/11/2016 17:50', '582db971830a0', '582dbc277a58a', '582f1e982e161', NULL, 1),
('583346bf42d22', '      \r\n    <p> Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.\r\n</p><p>\r\nVbi curarum abiectis ponderibus aliis tamquam nodum et codicem difficillimum Caesarem convellere nisu valido cogitabat, eique deliberanti cum proximis clandestinis conloquiis et nocturnis qua vi, quibusve commentis id fieret, antequam effundendis rebus pertinacius incumberet confidentia, acciri mollioribus scriptis per simulationem tractatus publici nimis urgentis eundem placuerat Gallum, ut auxilio destitutus sine ullo interiret obstaculo.\r\n</p>', 'Stanley Kubrick', 'Article', '21/11/2016 19:11', '582db971830a0', '582dbc352938f', '582f1e982e161', NULL, 0),
('583346d87f9fb', '<p>Les mathématiques sont un ensemble de connaissances abstraites résultant de raisonnements logiques appliqués à des objets divers tels que les nombres, les figures, les structures et les transformations. Les mathématiques sont aussi le domaine de recherche développant ces connaissances, ainsi que la discipline qui les enseigne.\r\n</p>\r\n<p>Elles possèdent plusieurs branches telles que : l''arithmétique, l''algèbre, l''analyse, la géométrie, la logique mathématique, etc. Il existe également une certaine séparation entre les mathématiques pures et les mathématiques appliquées.\r\n</p>\r\n<p>Les mathématiques se distinguent des autres sciences par un rapport particulier au réel car l''observation et l''expérience ne s''y portent pas sur des objets physiques. Elles sont de nature entièrement intellectuelle, fondées sur des axiomes déclarés vrais ou sur des postulats provisoirement admis. Ces axiomes en constituent les fondements et ne dépendent donc d''aucune autre proposition. Un énoncé mathématique – dénommé généralement, après être validé, théorème, proposition, lemme, fait, scholie ou corollaire – est considéré comme valide lorsque le discours formel qui établit sa vérité respecte une certaine structure rationnelle appelée démonstration, ou raisonnement logico-déductif. Un énoncé présenté comme plausible, mais qui n''a pas encore été établi comme vrai (« démontré », en langage utilisé par les mathématiciens), s''appelle une conjecture.\r\n</p>\r\n<p>Bien que les résultats mathématiques soient des vérités purement formelles, ils trouvent cependant des applications dans les autres sciences et dans différents domaines de la technique. C''est ainsi qu''Eugene Wigner parle de « la déraisonnable efficacité des mathématiques dans les sciences de la nature »1.</p>', 'Stanley Kubrick', 'Article', '22/11/2016 09:20', '582db971830a0', '582dbb6367190', '582f1e982e161', NULL, 0),
('583413236823b', '      <h1> De la NArrisation de la société, ou le conséquence du communisme sur la programmation informatique. </h1>\r\n<h2> Introduction et définition </h2>\r\n<p>\r\n    Qu''est ce que la NArrisation ? Ce terme fait peur à beaucoup, dans le monde du développement. Tout en étant complexe, ce problème peut être défini de façon très simple. Il s''agit de la complexification à l''excès d''un sujet simple, en s''éloignant des besoins primaires qui auraient du être priorisés. Cela a pour conséquences directe la création d''objets inutiles, compliqués, auxquels il faut s''adapter dans le futur, engendrant l''obligation d''utilisation de méthodes incertaines et non standards afin de se rapprocher, du mieux que l''on peut, du sujet d''origine (Voir <a href=http://scims.geoffreyspaur.fr/Article/5834185a55fca> programmation rustine </a>). \r\n</p>  \r\n    \r\n    \r\n    \r\n    ', 'Stanley Kubrick', 'De la NArrisation de la Société', '22/11/2016 10:09', '583412b76181f', '582dbc352938f', '582f1e982e161', NULL, 0),
('5834185a55fca', '<h1> De la programmation Rustine, ou la programmation de dégonflés </h1>\r\n\r\n<p> Le terme de programmation Rustine est utilisé pour décrire une situation où par faute de temps, ou par contrainte, une équipe de développement doit adapter, de façon bancale et précipitée, un code existant, et mal fait. Cela implique l''utilisation de "bidouilles" et de caches misères. </p>\r\n<p>Cette pratique, aussi appelée modestement du "bricolage", entraine une non SOLIDité des applications développées. Cette négligence met en péril la sécurité de tout à chacun et à terme entraine une instabilité du système.</p>', 'Stanley Kubrick', 'Programmation Rustine.', '23/11/2016 19:02', '583412b76181f', '582dbc352938f', '582f1e982e161', NULL, 0),
('5834351b63b8e', '<p>Les mathématiques financières sont une branche des mathématiques appliquées ayant pour but la modélisation, la quantification et la compréhension des phénomènes régissant les opérations financières d''une certaine durée (emprunts et placements / investissements) et notamment les marchés financiers. Elles font jouer le facteur temps et utilisent principalement des outils issus de l''actualisation, de la théorie des probabilités, du calcul stochastique, des statistiques et du calcul différentiel.</p>\r\n<p>L''observation empirique du cours des actifs financiers montre que ceux-ci ne sont pas déterminés de façon certaine par leur histoire. En effet, les nombreuses opérations d''achat ou de vente ne sont pas prévisibles, elles font souvent intervenir des éléments nouveaux. Le cours de l''actif financier est donc souvent représenté par un processus stochastique. Benoit Mandelbrot a établi par des considérations statistiques qu''un modèle aléatoire ordinaire, par exemple gaussien, ne convient pas. L''aléa reste cependant souvent modélisé par un mouvement brownien1, bien que des modèles plus élaborés (par exemple, le modèle de Bates) tiennent compte de la non-continuité des cours (présence de sauts (gaps) dus à des chocs boursiers), ou de la non-symétrie des mouvements à la baisse et à la hausse.</p>\r\n<p>L''une des hypothèses fondamentales des modèles usuels est qu''il n''existe aucune stratégie financière permettant, pour un coût initial nul, d''acquérir une richesse certaine dans une date future. Cette hypothèse est appelée absence d''opportunités d''arbitrage. Elle est justifiée théoriquement par l''unicité des prix caractérisant un marché en concurrence pure et parfaite. Pratiquement, il existe des arbitrages qui disparaissent très rapidement du fait de l''existence d''arbitragistes, acteurs sur les marchés dont le rôle est de détecter ce type d''opportunités et d''en profiter. Ces acteurs créent alors normalement une force qui tend à faire évoluer le prix de l''actif vers son prix de non-arbitrage. Ces opérations d''arbitrage sont effectuées instantanément et ne doivent pas être confondues avec des opérations par lesquelles un investisseur joue le retour à moyen ou long terme d''un actif vers des fondamentaux historiques. En conséquence, l''existence de bulles et de krachs ne remet pas en cause cette hypothèse (mais elle remet en revanche en cause l''hypothèse d''efficience des marchés).\r\n</p>', 'Stanley Kubrick', 'Model économique', '22/11/2016 12:09', '582db971830a0', '582dbb6367190', '582f1e982e161', NULL, 1),
('583737554f18c', 'Il existe plusieurs types de calligraphie. Et c''est vraiment joli. Le principe de base de la calligraphie "moderne" dirons nous et qui vous permettra d''améliorer vos écrits est le suivant : <b>Les traits ascendants sont fins et les traits descendants sont épais.</b> Voila voila<b> </b><br>Bon je vous laisse j''ai des achats a faire<br> ', 'Lily', 'La Calligraphie, ou l''art de faire genre on sait écrire', '24/11/2016 18:58', '5837371edfaf5', '482dbb6367198', '582f1e982e161', NULL, 6),
('5837f61a70499', ' <div>&lt;iframe width="560" height="315" src="https://www.youtube.com/embed/-Ujj06NWOuo" frameborder="0" allowfullscreen&gt;&lt;/iframe&gt;<br></div> \n      ', 'Guile', 'For victory', '02/12/2016 14:03', '583412b76181f', '482dbb6367198', '582f1e982e161', NULL, 1),
('583d8153daf4e', '<section class="disabled"><h1><span>1</span> titre 1qsdsd</h1><p>qsdsqkjqksjhkjqdshqsd</p><p>qsdqsdsdqsdqsd</p><p>qsdqsdqsd<br></p></section><section class="disabled"><h1><span>2</span> titre 2</h1><p>qsdqsd</p><section class="disabled"><h1><span>2.1</span> s2</h1><p>qsdqsdqsd<br></p></section><section class="disabled"><h1><span>2.2</span> ok2.2</h1><p><br></p></section><p><br></p></section><section class="disabled"><h1><span>3</span> titre 3</h1><p>skjdhqskjdhqljsh</p><section class="disabled"><h1><span>3.1</span> titre</h1><p>qsdqsd<br></p></section><p><br></p></section>qsdqsdqsd<br><br><br> \n      \n      ', 'Test', 'New testing', '29/11/2016 13:36', '582db971830a0', '482dbb6367198', '582f1eb418e05', NULL, 0),
('584012716c45b', '<p><div id="summary" contenteditable="false"><p><a href="#1">1 Théorie des groupes</a></p><p><a href="#1s1">1.1 Définition</a></p></div><br></p><section class="disabled"><h1 id="1"><span>1</span> Théorie des groupes</h1><p></p><section class="disabled"><h1 id="1s1"><span>1.1</span> Définition</h1><p>Soit $E$ un ensemble non vide. On munit $E$ d''une opération $* : E\\times E \\to E$. On dit que $(E,*)$ est un groupe si :</p><p>\\begin{itemize}</p><p>\\item $*$ est une lci.\\</p><p>\\item $*$ est associative.\\</p><p>\\item $*$ possède un élément neutre $e$.\\</p><p>\\item $\\forall x \\in E$, $\\exists a \\in E$, tel que $xa = ax = e$.<br></p><p>\\end{itemize}<br></p></section><p></p><p><br></p></section><p></p> \n      ', 'Gallois', 'La théorie des groupes', '01/12/2016 12:12', '5840124e3148c', '582dbb6367190', '582f1e982e161', NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Categories`
--

CREATE TABLE IF NOT EXISTS `Categories` (
  `Id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Categories`
--

INSERT INTO `Categories` (`Id`, `Name`, `Color`) VALUES
('482dbb6367198', 'Art', '#0a767e'),
('582dbb6367190', 'Mathématique', '#df4f1f'),
('582dbb81d7480', 'Physique', '#4f9f1f'),
('582dbc131273c', 'Chimie', '#1f4fcf'),
('582dbc277a58a', 'Electronique', '#af1f4f'),
('582dbc352938f', 'Informatique', '#4f1f9f'),
('582dbf57287fd', 'Médecine', '#1fcf4f');

-- --------------------------------------------------------

--
-- Structure de la table `States`
--

CREATE TABLE IF NOT EXISTS `States` (
  `Id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `States`
--

INSERT INTO `States` (`Id`, `Name`) VALUES
('582f1e982e161', 'Public'),
('582f1eb418e05', 'Private');

-- --------------------------------------------------------

--
-- Structure de la table `Status`
--

CREATE TABLE IF NOT EXISTS `Status` (
  `Id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Status`
--

INSERT INTO `Status` (`Id`, `Name`) VALUES
('583c3910594bb', 'Administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `Id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `StatusId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `STATUS` (`StatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Users`
--

INSERT INTO `Users` (`Id`, `Email`, `Password`, `StatusId`, `Pseudo`) VALUES
('582db971830a0', 'a@a.c', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '583c3910594bb', 'a'),
('582db9c3e5276', 'b', 'e9d71f5ee7c92d6dc9e92ffdad17b8bd49418f98', NULL, 'b'),
('5834126d19dbd', 'nic.gille', '48d6d78bcb1c6b5cd7b858fc7cd3ed0303b8889a', NULL, 'Kero76'),
('583412b76181f', 'test@test.lol', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', NULL, 'TeeGreg'),
('5837371edfaf5', 'l@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', NULL, 'Lily'),
('5838496946dee', 'blobl.tru@free.fr', 'aad74c683606fcb5d323e7632caf1e53501bb86d', NULL, 'mathii'),
('5840124e3148c', 'lucas.reding@etu.univ-rouen.fr', 'a222cbcec666e8268ed0b032ddfccbc0e85e36c8', NULL, 'Princess_Twilight');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Articles`
--
ALTER TABLE `Articles`
  ADD CONSTRAINT `Articles_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Articles_ibfk_2` FOREIGN KEY (`CategoryId`) REFERENCES `Categories` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Articles_ibfk_3` FOREIGN KEY (`StateId`) REFERENCES `States` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`StatusId`) REFERENCES `Status` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
