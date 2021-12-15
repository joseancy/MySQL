CREATE DATABASE test_db;

CREATE TABLE IF NOT EXISTS `loginForm` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `username` varchar(50) NOT NULL,
 `email` varchar(50) NOT NULL,
 `password` varchar(50) NOT NULL,
 `create_datetime` datetime NOT NULL,
 PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `complaint_form` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `complaint_id` int(11) NOT NULL,
 `comment_id` int(11) NOT NULL,
 `name` varchar(50) NOT NULL,
 `email` varchar(50) NOT NULL,
 `comment_text` varchar(2000) NOT NULL,
 `date` date NOT NULL,
 `time` time NOT NULL,
 `timestamp` varchar(15) NOT NULL,
 PRIMARY KEY (`id`)
);
