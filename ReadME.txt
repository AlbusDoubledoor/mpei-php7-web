!!! ƒл€ удобной смены данных дл€ соединени€ с базой данных (адрес, пользователь, пароль) можно использовать файл config.txt



!!! –асширение mysqli, использующеес€ в PHP 7, пока не поддерживает caching_sha2_password аутентификацию, поэтому дл€ работы с mysql 8.0
(дл€ версий ниже 8.0 ничего исправл€ть не нужно) дл€ пользовател€, с которым будет работать скрипт, 
нужно выполнить команду (в mysql клиенте):

ALTER USER 'mysqlUsername'@'localhost' IDENTIFIED WITH mysql_native_password BY 'mysqlUsernamePassword';


“акже можно в my.ini поправить default_authentication_plugin на mysql_native_password (но должно помочь и первое).