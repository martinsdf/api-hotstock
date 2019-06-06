-- liquibase formatted sql

-- changeset daniel.martins:create_user_table
CREATE TABLE `user`
(
  `id`        BIGINT       NOT NULL AUTO_INCREMENT,
  `username`  VARCHAR(20) NOT NULL,
  `password`  VARCHAR(20) NOT NULL,
  `role`      VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `uq_user_username` UNIQUE (`username`)
);
-- rollback DROP TABLE `user`;

-- changeset daniel.martins:add_users context:dev
INSERT INTO `user`(`username`, `password`, `role`)
VALUES ('admin', 'admin', 'ADMIN'),
       ('user', 'user', 'USER');
-- rollback DELETE FROM `user` WHERE username IN ('admin', 'user');

-- changeset daniel.martins:create_department_table context:dev
CREATE TABLE `department`
(
  `id`        BIGINT       NOT NULL AUTO_INCREMENT,
  `name`  	  VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `uq_department_name` UNIQUE (`name`)
);
-- rollback DROP TABLE `department`;

-- changeset daniel.martins:department context:dev
INSERT INTO `department`(`name`)
VALUES ('Branding'),
       ('Eventos'),
       ('Facilities'),
       ('Talentos'),
       ('Techops');
-- rollback DELETE FROM `department`;

-- changeset daniel.martins:create_product_table context:dev
CREATE TABLE `product`
(
  `id`           BIGINT       NOT NULL AUTO_INCREMENT,
  `name`  	     VARCHAR(200) NOT NULL,
  `barcode`      VARCHAR(20)  NOT NULL,
  `department`   BIGINT       NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (department)
        REFERENCES department(id),
  CONSTRAINT `uq_product_barcode` UNIQUE (`barcode`)
);
-- rollback DROP TABLE `product`;

-- changeset daniel.martins:create_department_product_table context:dev
CREATE TABLE `department_product`
(
  `id`         BIGINT       NOT NULL AUTO_INCREMENT,
  `product`    BIGINT       NOT NULL,
  `department` BIGINT       NOT NULL,
  `quantity`   DECIMAL(4,2) NULL DEFAULT 0,
  FOREIGN KEY (product)
        REFERENCES product(id),
   FOREIGN KEY (department)
        REFERENCES department(id),
  PRIMARY KEY (`id`)
);
-- rollback DROP TABLE `department_product`;

-- changeset daniel.martins:create_order_table context:dev
CREATE TABLE `order`
(
  `id`           BIGINT       NOT NULL AUTO_INCREMENT,
  `user`         BIGINT       NOT NULL,
  `status`       VARCHAR(50)  NOT NULL DEFAULT 'OPEN',
  `create_date`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user)
        REFERENCES user(id),
  PRIMARY KEY (`id`)
);
-- rollback DROP TABLE `order`;

-- changeset daniel.martins:create_order_product_table context:dev
CREATE TABLE `order_product`
(
  `id`           BIGINT       NOT NULL AUTO_INCREMENT,
  `order`        BIGINT       NOT NULL,
  `product`      BIGINT       NOT NULL,
  `quantity`     DECIMAL(4,2) NOT NULL,
  FOREIGN KEY (`order`)
        REFERENCES `order`(id),
  FOREIGN KEY (product)
        REFERENCES product(id),
  PRIMARY KEY (`id`)
);
-- rollback DROP TABLE `order_product`;