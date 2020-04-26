// Tabs interface
var tabContainers = undefined;
var tabButtons = undefined;

function openTabContainer(tabContainerId,tabButton) {
	if (tabContainers == undefined)
		tabContainers = document.getElementsByClassName('tab-container');
	if (tabButtons == undefined)
	{
		tabButtons = document.getElementsByClassName('tab-button');
		for(let idxButton of tabButtons) {
			if (idxButton.classList.contains('selected'))
				idxButton.selected = true;
			else
				idxButton.selected = false;
		}
	}
	for(let idxButton of tabButtons) {
		if (idxButton == tabButton)
		{
			if (!idxButton.selected)
			{
				idxButton.selected = true;
				idxButton.classList.toggle('selected');
			}
		}
		else {
			if (idxButton.selected) {
				idxButton.selected = false;
				idxButton.classList.toggle('selected');
			}
		}
	}
	for(let container of tabContainers)
	{
		if (container.id == tabContainerId)
		{
			container.style.visibility='visible';
			container.style.maxHeight='100%';
		}
		else
		{
			container.style.visibility='hidden';
			container.style.maxHeight='0';
		}
	}
}

// Load containers wrapper
function loadContainers() {
	loadRecords("containers");
}

// Load records ajax
function loadRecords(type) {
	let url = "loadrecords.php";
	let xhr = new XMLHttpRequest();
	let loadRequest = new FormData();
	loadRequest.append("type",type);
	xhr.open('POST',url);
	xhr.send(loadRequest);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			if (xhr.status != 200) {
				alert(`Ошибка ${xhr.status}: ${xhr.statusText}`);
			} else {
				if (type == "containers")
					loadContainersMap(xhr.responseText);
			}
		}
	} 
}

var container_count = 0;
// Load containers
function loadContainersMap(loadResponse) {
	if (loadResponse.includes('SUCCESS_LOAD')) {
		let mappedResponse = loadResponse.split('\n');
		let targetElem = document.getElementById('containersLoadTarget');
		targetElem.style.visibility = "inherit";
		let containersApiElems = document.getElementsByClassName('containers-api');
		for(let elem of containersApiElems)
			elem.style.visibility = "inherit";
		targetElem.style.maxHeight = "100%";
		targetElem.innerHTML="<thead style='font-weight: bold;'><tr><td>ID</td><td>Заголовок</td><td>Порядок сортировки</td><td>Удалить</td></tr></thead>";
		targetElem.appendChild(document.createElement('tbody'));
		targetElem = targetElem.tBodies[0];
		container_count = 0;
		for(let record of mappedResponse) {
			if (record.includes("SUCCESS_LOAD") || record == "")
				continue;
			let parsedRecord = record.split('%delimiter%');
			let index = container_count;
			++container_count;
			let tr = document.createElement('tr');
			tr.index = index;
			let iconDel = '<img onclick="deleteContainer('+index+')" style="cursor: pointer" src="/resource/icon/delete.png" alt="X">';
			tr.innerHTML+=`<td>${parsedRecord[0]}</td><td><input type=text value='${parsedRecord[1]}'></td><td><input type=text value='${parsedRecord[2]}'</td><td>${iconDel}</td>`;
			targetElem.appendChild(tr);
		}
		if (container_count == 0) targetElem.style.visibility = "hidden";
	}
}

// Store records ajax
function storeRecords(storeRequest) {
	let url = "storerecords.php";
	let xhr = new XMLHttpRequest();
	xhr.open('POST',url);
	xhr.send(storeRequest);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			if (xhr.status != 200) {
				alert(`Ошибка ${xhr.status}: ${xhr.statusText}`);
			} else {
				alert(xhr.response);
				loadContainers();
			}
		}
	} 
}

// Store containers
function storeContainers() {
	let storeRequest = new FormData();
	let rows = document.getElementById('containersLoadTarget').tBodies[0].getElementsByTagName('tr');
	let idx = 0;
	for(let row of rows) {
		let cells = row.getElementsByTagName('td');
		storeRequest.append(`id[${idx}]`,cells[0].textContent);
		let title = cells[1].getElementsByTagName('input');
		title = title[0].value;
		if (!title.length == 0) storeRequest.append(`title[${idx}]`,title);
		else {alert('Заголовок не может быть пустым.');return}
		let sortOrder = cells[2].getElementsByTagName('input');
		sortOrder = sortOrder[0].value;
		storeRequest.append(`sort_order[${idx}]`,sortOrder);
		++idx;
	}
	storeRequest.append("type","containers");
	storeRecords(storeRequest);
}
// Add container
function addContainer() {
	let targetElem = document.getElementById('containersLoadTarget');
	if (container_count == 0) targetElem.style.visibility="inherit";
	targetElem = targetElem.tBodies[0];
	let tr = document.createElement('tr');
	let index = container_count;
	tr.index = index;
	++container_count;
	let iconDel = '<img onclick="deleteContainer('+index+')" style="cursor: pointer" src="/resource/icon/delete.png" alt="X">';
	tr.innerHTML+=`<td>TBD</td><td><input type=text value=''></td><td><input type=text value=''</td><td>${iconDel}</td>`;
	targetElem.appendChild(tr);
}
function deleteContainer(elementIdx) {
	let targetElem = document.getElementById('containersLoadTarget');
	let rows = targetElem.tBodies[0].getElementsByTagName('tr');
	for(let row of rows)
	{
		if (row.index == elementIdx) 
		{
			let rowRemovable = row;
			targetElem.tBodies[0].removeChild(rowRemovable);
			--container_count;
			if (container_count==0)  targetElem.style.visibility = "hidden";
			return;
		}
	}
}

// Add/delete file instance
var file_count = 1;
function add_file() {
	let fileWrapper = document.getElementById('filewrapper');
	let newFile = document.createElement('div');
	let index = file_count;
	++file_count;
	newFile.index = index;
	newFile.className="file-instance";
	newFile.innerHTML += '<div class="file-field"><input name="userfile[]" type="file" /><img onclick="delete_file('+index+')" class="delete-icon" src="/resource/icon/delete.png" alt="X"></div>'
	fileWrapper.appendChild(newFile);
}

function delete_file(element_index) {
	let fileWrapper = document.getElementById('filewrapper');
	let instances = document.getElementsByClassName('file-instance');
	if (instances.length == 1) {
		alert('Нельзя удалить единственную форму выбора файла.');
		return;
	}
	for(let inst of instances)
	{
		if (inst.index == element_index) 
		{
			let inst_to_remove = inst;
			fileWrapper.removeChild(inst_to_remove);
			--file_count;
			return;
		}
	}
}

function validate_my_files() {
	let userfile = document.getElementsByName('userfile[]');
	for(let idx = 0; idx < userfile.length; ++idx)
		if (userfile[idx].value.length == 0) {
			alert('Файл не выбран');
			return false;
		}
	return true;
}

// New article
function newArticle() {
	let newArticle = document.getElementById('newArticle');
	newArticle.style.visibility = "inherit";
	newArticle.style.maxHeight = "200px";
	let editArticle = document.getElementById('editArticle');
	editArticle.style.visibility = "hidden";
	editArticle.style.maxHeight = "0";
}
// Edit article
function editArticle() {
	let newArticle = document.getElementById('newArticle');
	newArticle.style.visibility = "hidden";
	newArticle.style.maxHeight = "0";
	let editArticle = document.getElementById('editArticle');
	editArticle.style.visibility = "inherit";
	editArticle.style.maxHeight = "200px";
}
// dynamic list
function refreshArtList() {
	let editArtList = document.getElementById('editArtList');
    let editArtContList = document.getElementById('editArtContList');
	let contId = "0";
	for(let opt of editArtContList.getElementsByTagName('option'))
	{
		if (opt.getAttribute('selected') == true) {
			contId = opt.id;
			break;
		}
	}
	for(let opt of editArtList.getElementsByTagName('option')) {
		if (opt.getAttribute('containerid') == contId) opt.style.visibility = "visible";
		else opt.style.visibility = "hidden";
	}
}

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
				if (xhr.response.includes("Успешная регистрация"))
				{
					clear_values(register.elements.username);
					clear_values(register.elements.password);
					clear_values(register.elements.role);
					for(let idx = 1; idx < rec_count-1; ++idx)
						delete_record(idx);
				}
			}
		}
	} 
}