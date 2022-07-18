--
-- User java
--

create user 'cineadmin'@'%' identified by 'juanponzi';
GRANT SELECT, INSERT, UPDATE, DELETE ON `Cine_TpJava`.* TO 'cineadmin'@'%';
