CREATE TABLE users ( 
    id INT NOT NULL AUTO_INCREMENT, 
    fname VARCHAR(100) NOT NULL, 
    lname VARCHAR(100), 
    ph_no VARCHAR(20) NOT NULL, 
    email_id VARCHAR(200) NOT NULL, 
    password VARCHAR(50) NOT NULL, 
    about VARCHAR(1000), 
    profile_pic VARCHAR(1000), 
    cover_pic VARCHAR(1000), 
    PRIMARY KEY (`id`)
);

CREATE TABLE posts (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT,
    post VARCHAR(1000) NOT NULL,
    post_pic VARCHAR(500),
    date_time DATETIME  NOT NULL,
    visibility ENUM('Only Me', 'Friends', 'Anyone'),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE likes (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT,
    post_id INT,
    reaction ENUM('Like', 'Love', 'Care', 'Haha', 'Wow', 'Sad', 'Angry'),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

CREATE TABLE comments (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT,
    post_id INT,
    comment VARCHAR(1000) NOT NULL,
    date_time DATE  NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);