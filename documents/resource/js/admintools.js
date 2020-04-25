// Add/delete register record
var rec_count = 1;
function add_record() {
	let register = document.getElementById('register');
	let record_instance = document.createElement('div');
	let index = rec_count;
	++rec_count;
	record_instance.index = index;
	record_instance.className="register-instance";
	record_instance.innerHTML += '<div class="field"><label>Логин:</label><input type=text name="username"><img onclick="delete_record('+index+')" class="delete-icon" src="/resource/icon/delete.png" alt="X"></div>'
	record_instance.innerHTML += '<div class="field"><label>Пароль:</label> <input type=password name="password"></div>'
	record_instance.innerHTML += '<div class="field"><label>Роль:</label><input type=text name="role"></div>';
	register.appendChild(record_instance);
}
function delete_record(element_index) {
	let register = document.getElementById('register');
	let records = document.getElementsByClassName('register-instance');
	if (records.length == 1) {
		alert('Нельзя удалить единственную форму регистрации.');
		return;
	}
	for(let inst of records)
	{
		if (inst.index == element_index) 
		{
			let inst_to_remove = inst;
			register.removeChild(inst_to_remove);
			--rec_count;
			return;
		}
	}
}

// Send register-user message // Available only for role==admin
function create_array(htmlElement) {
	let array = [];
	if (htmlElement.length === undefined)
	{
		array.push(htmlElement.value);
	}
	else
	{
		for(let idx = 0; idx < htmlElement.length; ++idx) array.push(htmlElement[idx].value);
	}
	return array;
}

function clear_values(htmlElement) {
		if (htmlElement.length === undefined)
		{
			htmlElement.value = "";
		}
		else
		{
			for(let idx = 0; idx < htmlElement.length; ++idx) htmlElement[idx].value = "";
		}		
}	

function test_regex(str,regex) {
	return (str.replace(regex,"$REGEX_PASS$") == "$REGEX_PASS$")
}
	
function register() {	
	let register = document.getElementById('register');
	
	let username = create_array(register.elements.username);
	let password = create_array(register.elements.password);
	let role = create_array(register.elements.role);
	if (!(username.length == password.length && username.length == role.length))
	{
		alert('Ошибка: массивы из значений полей должны быть одной длины');
	}
	
	for(let inst in role) inst.value = inst.toLowerCase();
	
	let regex = /[a-zA-Z0-9_]+/;
	let role_regex = /[a-z]+/;	
	
	for(let idx=0; idx<username.length; ++idx)
	{
		if (!test_regex(username[idx],regex)||!test_regex(password[idx],regex))
		{
			alert('Имя и пароль могут содержать только латинские символы, цифры и нижнее подчеркивание.');
			return
		}
		if (!test_regex(role[idx],role_regex))
		{
			alert('Роль может содержать только латинские символы.');
			return
		}
	}
	
	let registerData = new FormData();
	for(let idx=0; idx<username.length; ++idx)
	{
		registerData.append('username['+idx+']',username[idx]);
		registerData.append('password['+idx+']',password[idx]);
		registerData.append('role['+idx+']',role[idx]);
	}
	
	let url = "register.php";
	let xhr = new XMLHttpRequest();
	xhr.open('POST',url);
	xhr.send(registerData);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			if (xhr.status != 200) {
				alert(`Ошибка ${xhr.status}: ${xhr.statusText}`);
			} else {
				alert(xhr.response);
			}
			clear_values(register.elements.username);
			clear_values(register.elements.password);
			clear_values(register.elements.role);
		}
	} 
}