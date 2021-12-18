CREATE DATABASE test_db;

CREATE TABLE IF NOT EXISTS `users` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `username` varchar(50) NOT NULL,
 `email` varchar(50) NOT NULL,
 `password` varchar(50) NOT NULL,
 `create_datetime` datetime NOT NULL,
 PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `complaint_form` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `user_id` int(11) NOT NULL,  
 `comment_text` text NOT NULL,
 `date` date NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `time` time NOT NULL,
 `timestamp` varchar(15) NOT NULL,
 PRIMARY KEY (`id`),
 FOREIGN KEY(user_id) REFERENCES users(id)
);
