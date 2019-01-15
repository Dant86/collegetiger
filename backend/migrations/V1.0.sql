CREATE TABLE blog_posts (
    id            INT          NOT NULL AUTO_INCREMENT,
    author_name   VARCHAR(128) NOT NULL,
    author_id     INT          NOT NULL,
    date_posted   DATETIME     NOT NULL,
    body          TEXT         NOT NULL,
    thumbnail_url VARCHAR(256),
FOREIGN KEY (author_id) references admins (id)
PRIMARY KEY (id)
)

CREATE TABLE admins (
    id            INT          NOT NULL AUTO_INCREMENT,
    first_name    VARCHAR(64)  NOT NULL,
    last_name     VARCHAR(64)  NOT NULL,
    email         VARCHAR(128) NOT NULL,
    password_hash VARCHAR(256) NOT NULL,
PRIMARY KEY (id)
)

CREATE TABLE transactions (
    id               INT          NOT NULL AUTO_INCREMENT,
    client_email     VARCHAR(128) NOT NULL,
    client_fname     VARCHAR(64)  NOT NULL,
    client_lname     VARCHAR(64)  NOT NULL,
    service          VARCHAR(64)  NOT NULL,
    price            FLOAT        NOT NULL,
    transaction_date DATETIME     NOT NULL,
PRIMARY KEY (id)
)
