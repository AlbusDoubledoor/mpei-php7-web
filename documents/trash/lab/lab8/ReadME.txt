!!! ��� ������� ����� ������ ��� ���������� � ����� ������ (�����, ������������, ������) ����� ������������ ���� config.txt



!!! ���������� mysqli, �������������� � PHP 7, ���� �� ������������ caching_sha2_password ��������������, ������� ��� ������ � mysql 8.0
(��� ������ ���� 8.0 ������ ���������� �� �����) ��� ������������, � ������� ����� �������� ������, 
����� ��������� ������� (� mysql �������):

ALTER USER 'mysqlUsername'@'localhost' IDENTIFIED WITH mysql_native_password BY 'mysqlUsernamePassword';


����� ����� � my.ini ��������� default_authentication_plugin �� mysql_native_password (�� ������ ������ � ������).