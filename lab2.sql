CREATE DATABASE test_db;

CREATE TABLE IF NOT EXISTS `loginForm` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `username` varchar(50) NOT NULL,
 `email` varchar(50) NOT NULL,
 `password` varchar(50) NOT NULL,
 `date` datetime NOT NULL,
 PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `complaint_form` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `comment_id` int(11) NOT NULL,
 `name` varchar(50) NOT NULL,
 `email` varchar(50) NOT NULL,
 `comment_text` varchar(2000) NOT NULL,
 `date` date NOT NULL,
 `time` time NOT NULL,
 `timestamp` varchar(15) NOT NULL,
 PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `status` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `complaint_id` int(11) NOT NULL,
 `completed` varchar(50) NOT NULL,
 `inprogress` varchar(50) NOT NULL,
 `stuck` varchar(50) NOT NULL,
 `date` date NOT NULL,
 `time` time NOT NULL,
 `timestamp` varchar(15) NOT NULL,
 PRIMARY KEY (`id`),
 FOREIGN KEY (complaint_id) REFERENCES complaint_form(id)
);
 