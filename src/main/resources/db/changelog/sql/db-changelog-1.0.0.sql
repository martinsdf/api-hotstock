-- liquibase formatted sql

-- changeset daniel.martins:create_oauth_tables
CREATE TABLE oauth_client_details
(
  client_id               VARCHAR(255) PRIMARY KEY,
  resource_ids            VARCHAR(255),
  client_secret           VARCHAR(255),
  scope                   VARCHAR(255),
  authorized_grant_types  VARCHAR(255),
  web_server_redirect_uri VARCHAR(255),
  authorities             VARCHAR(255),
  access_token_validity   INTEGER,
  refresh_token_validity  INTEGER,
  additional_information  VARCHAR(4096),
  autoapprove             VARCHAR(255)
);

CREATE TABLE oauth_client_token
(
  token_id          VARCHAR(255),
  token             MEDIUMBLOB,
  authentication_id VARCHAR(255) PRIMARY KEY,
  user_name         VARCHAR(255),
  client_id         VARCHAR(255)
);

CREATE TABLE oauth_access_token
(
  token_id          VARCHAR(255),
  token             MEDIUMBLOB,
  authentication_id VARCHAR(255) PRIMARY KEY,
  user_name         VARCHAR(255),
  client_id         VARCHAR(255),
  authentication    MEDIUMBLOB,
  refresh_token     VARCHAR(255)
);

CREATE TABLE oauth_refresh_token
(
  token_id       VARCHAR(255),
  token          MEDIUMBLOB,
  authentication MEDIUMBLOB
);

CREATE TABLE oauth_code
(
  code           VARCHAR(255),
  authentication MEDIUMBLOB
);

CREATE TABLE oauth_approvals
(
  userId         VARCHAR(255),
  clientId       VARCHAR(255),
  scope          VARCHAR(255),
  status         VARCHAR(10),
  expiresAt      DATETIME,
  lastModifiedAt DATETIME
);
-- rollback DROP TABLE IF EXISTS oauth_approvals;
-- rollback DROP TABLE IF EXISTS oauth_code;
-- rollback DROP TABLE IF EXISTS oauth_refresh_token;
-- rollback DROP TABLE IF EXISTS oauth_access_token;
-- rollback DROP TABLE IF EXISTS oauth_client_token;
-- rollback DROP TABLE IF EXISTS oauth_client_details;

-- changeset daniel.martins:add_client_details
INSERT INTO oauth_client_details
(client_id, client_secret, scope, authorized_grant_types, access_token_validity, refresh_token_validity)
VALUES ('bc6edfe6-988c-490f-a70f-1e4dcf0d89a5', '68ad7524-56d2-48d4-bdc6-f1c1b11615a4',
        'read,write', 'password,authorization_code,refresh_token', 86400, 2592000);
-- rollback
