-- liquibase formatted sql

-- changeset daniel.martins:create_user_table
CREATE TABLE `user`
(
  `id`        BIGINT       NOT NULL AUTO_INCREMENT,
  `username`  VARCHAR(200) NOT NULL,
  `password`  VARCHAR(200) NOT NULL,
  `role`      VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `uq_user_username` UNIQUE (`username`)
);
-- rollback DROP TABLE `user`;

-- changeset daniel.martins:add_users context:dev
INSERT INTO `user`(`username`, `password`, `role`)
VALUES ('user1', '123456', 'USER'),
       ('user2', '123456', 'USER');
-- rollback DELETE FROM `user` WHERE username IN ('user1', 'user2');