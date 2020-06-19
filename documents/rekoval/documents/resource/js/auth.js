// Validate auth form input
function validate() {
	let username = document.getElementById('username').value;
	let password = document.getElementById('password').value;
	let regex = /[a-zA-Z0-9_]+/;
	function test_regex(str,regex) {
		return (str.replace(regex,"$REGEX_PASS$") == "$REGEX_PASS$")
	}
	if (!test_regex(username,regex))
	{
		alert('Логин может содержать только латиниские символы, цифры и нижнее подчёркивание.');
		return false;
	}
	if (!test_regex(password,regex))
	{
		alert('Пароль может содержать только латинские символы, цифры и нижнее подчёркивание.');
		return false;
	}
	return true;	
}
