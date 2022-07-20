--
-- User java
--

create user 'cineadmin'@'%' identified by 'juanponzi';
GRANT SELECT, INSERT, UPDATE, DELETE ON `cine_tpjava`.* TO 'cineadmin'@'%';
