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

// Tabs interface
var tabContainers = undefined;
var tabButtons = undefined;

function openTabContainer(tabContainerId,tabButton) {
	if (tabContainers == undefined)
		tabContainers = document.getElementsByClassName('tab-container');
	if (tabButtons == undefined)
	{
		tabButtons = document.getElementsByClassName('tab-button');
		for(let idxButton = 0; idxButton < tabButtons.length; ++idxButton) {
			if (tabButtons[idxButton].classList.contains('selected'))
				tabButtons[idxButton].selected = true;
			else
				tabButtons[idxButton].selected = false;
		}
	}
	for(let idxButton = 0; idxButton < tabButtons.length; ++idxButton) {
		if (tabButtons[idxButton] == tabButton)
		{
			if (!tabButtons[idxButton].selected)
			{
				tabButtons[idxButton].selected = true;
				tabButtons[idxButton].classList.toggle('selected');
			}
		}
		else {
			if (tabButtons[idxButton].selected) {
				tabButtons[idxButton].selected = false;
				tabButtons[idxButton].classList.toggle('selected');
			}
		}
	}
	for(let idx = 0; idx < tabContainers.length; ++idx)
	{
		if (tabContainers[idx].id == tabContainerId)
		{
			tabContainers[idx].style.visibility='visible';
			tabContainers[idx].style.maxHeight='100%';
		}
		else
		{
			tabContainers[idx].style.visibility='hidden';
			tabContainers[idx].style.maxHeight='0';
		}
	}
}

// Load containers wrapper
function loadContainers() {
	loadRecords("containers");
}

// Load records ajax
function loadRecords(type,id) {
	let url = "loadrecords.php";
	let xhr = new XMLHttpRequest();
	let loadRequest = new FormData();
	loadRequest.append("type",type);
	if (type == "article") loadRequest.append("article_id",id);
	if (type == "board") loadRequest.append("board_id",id);
	xhr.open('POST',url);
	xhr.send(loadRequest);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			if (xhr.status != 200) {
				alert('Ошибка '+xhr.status+': '+xhr.statusText);
			} else {
				if (type == "containers")
					loadContainersMap(xhr.responseText);
				if (type == "article")
					article_editor.setData(xhr.responseText);
				if (type == "board")
					board_editor.setData(xhr.responseText);
			}
		}
	} 
}

var container_count = 0;
// Load containers
function loadContainersMap(loadResponse) {
	if (loadResponse.indexOf('SUCCESS_LOAD') != -1) {
		let mappedResponse = loadResponse.split('\n');
		let targetElem = document.getElementById('containersLoadTarget');
		targetElem.style.visibility = "inherit";
		let containersApiElems = document.getElementsByClassName('containers-api');
		for(let elem = 0; elem < containersApiElems.length; ++elem)
			containersApiElems[elem].style.visibility = "inherit";
		targetElem.style.maxHeight = "100%";
		targetElem.innerHTML="<thead style='font-weight: bold;'><tr><td>ID</td><td>Заголовок</td><td>Порядок сортировки</td><td>Удалить</td></tr></thead>";
		targetElem.appendChild(document.createElement('tbody'));
		targetElem = targetElem.tBodies[0];
		container_count = 0;
		for(let record = 0; record < mappedResponse.length; ++record) {
			if (mappedResponse[record].indexOf("SUCCESS_LOAD") != -1 || mappedResponse[record] == "")
				continue;
			let parsedRecord = mappedResponse[record].split('%delimiter%');
			let index = container_count;
			++container_count;
			let tr = document.createElement('tr');
			tr.index = index;
			let iconDel = '<img onclick="deleteContainer('+index+')" style="cursor: pointer" src="/resource/icon/delete.png" alt="X">';
			tr.innerHTML+="<td>"+parsedRecord[0]+"</td><td><input type=text value='"+parsedRecord[1]+"'></td><td><input type=text value='"+parsedRecord[2]+"'</td><td>"+iconDel+"</td>";
			targetElem.appendChild(tr);
		}
		if (container_count == 0) targetElem.style.visibility = "hidden";
	}
}

// Store records ajax
function storeRecords(storeRequest,type) {
	let url = "storerecords.php";
	let xhr = new XMLHttpRequest();
	xhr.open('POST',url);
	xhr.send(storeRequest);
	xhr.onreadystatechange = function() {1
		if (xhr.readyState == 4) {
			if (xhr.status != 200) {
				alert("Ошибка "+xhr.status+": "+xhr.statusText);
			} else {
				alert(xhr.response);
				if (type == "containers") loadContainers();
				if (type == "article_delete") location.href = "?mode=admintools";
				if (type == "board_delete") location.href = "?mode=admintools&tab=boardmanager";
			}
		}
	} 
}

// Store containers
function storeContainers() {
	let storeRequest = new FormData();
	let rows = document.getElementById('containersLoadTarget').tBodies[0].getElementsByTagName('tr');
	let idx = 0;
	for(let row = 0; row < rows.length; ++row) {
		let cells = rows[row].getElementsByTagName('td');
		storeRequest.append("id["+idx+"]",cells[0].textContent);
		let title = cells[1].getElementsByTagName('input');
		title = title[0].value;
		if (!title.length == 0) storeRequest.append("title["+idx+"]",title);
		else {alert('Заголовок не может быть пустым.');return}
		let sortOrder = cells[2].getElementsByTagName('input');
		sortOrder = sortOrder[0].value;
		storeRequest.append("sort_order["+idx+"]",sortOrder);
		++idx;
	}
	storeRequest.append("type","containers");
	storeRecords(storeRequest,"containers");
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
	tr.innerHTML+="<td>TBD</td><td><input type=text value=''></td><td><input type=text value=''</td><td>"+iconDel+"</td>";
	targetElem.appendChild(tr);
}
function deleteContainer(elementIdx) {
	let targetElem = document.getElementById('containersLoadTarget');
	let rows = targetElem.tBodies[0].getElementsByTagName('tr');
	for(let row=0; row < rows.length; ++row)
	{
		if (rows[row].index == elementIdx) 
		{
			let rowRemovable = rows[row];
			targetElem.tBodies[0].removeChild(rowRemovable);
			--container_count;
			if (container_count==0)  targetElem.style.visibility = "hidden";
			return;
		}
	}
}

// Add/delete file instance
var file_count = { 'value': 1, 'name': 'filecounter' };
var file_count_board = { 'value':1, 'name':'boardfilecounter'};
var counters = [file_count,file_count_board];
function getobjcounter(counterName) {
	for(let idx = 0; idx < counters.length; ++idx)
	{
		if (counters[idx].name == counterName)
			return counters[idx];
	}
	return null;
}

function add_file(wrapper,counter) {
	let fileWrapper = document.getElementById(wrapper);
	let newFile = document.createElement('div');
	let index = counter.value;
	++counter.value;
	newFile.index = index;
	newFile.className="file-instance";
	newFile.innerHTML += '<div class="file-field"><input name="userfile[]" type="file" /><img onclick="delete_file(`'+wrapper+'`,getobjcounter(`'+counter.name+'`),'+index+')" class="delete-icon" src="/resource/icon/delete.png" alt="X"></div>'
	fileWrapper.appendChild(newFile);
}

function delete_file(wrapper,counter,element_index) {
	let fileWrapper = document.getElementById(wrapper);
	let instances = fileWrapper.getElementsByClassName('file-instance');
	if (instances.length == 1) {
		alert('Нельзя удалить единственную форму выбора файла.');
		return;
	}
	for(let inst=0;inst < instances.length; ++inst)
	{
		if (instances[inst].index == element_index) 
		{
			let inst_to_remove = instances[inst];
			fileWrapper.removeChild(inst_to_remove);
			--counter.value;
			return;
		}
	}
}

function validate_my_files(formid) {
	let thisForm = document.getElementById(formid);
	let userfile = create_array(thisForm.elements['userfile[]']);
	for(let idx = 0; idx < userfile.length; ++idx)
		if (userfile[idx].length == 0) {
			alert('Файл не выбран');
			return false;
		}
	return true;
}

var articleMode = 0;
// New article
function newArticle() {
	if (articleMode == 0) document.getElementById('sendArticle').style.visibility = "inherit";
	let newArticle = document.getElementById('newArticle');
	newArticle.style.visibility = "inherit";
	newArticle.style.maxHeight = "300px";
	articleMode = 1;
	let editArticle = document.getElementById('editArticle');
	editArticle.style.visibility = "hidden";
	editArticle.style.maxHeight = "0";
}
// Edit article
function editArticle() {
	if (articleMode == 0) document.getElementById('sendArticle').style.visibility = "inherit";
	let newArticle = document.getElementById('newArticle');
	newArticle.style.visibility = "hidden";
	newArticle.style.maxHeight = "0";
	articleMode = 2;
	let editArticle = document.getElementById('editArticle');
	editArticle.style.visibility = "inherit";
	editArticle.style.maxHeight = "300px";
	refreshArtList();
}
// dynamic list
function refreshArtList() {
	let editArtList = document.getElementById('editArtList');
    let editArtContList = document.getElementById('editArtContList');
	let opts = editArtContList.getElementsByTagName('option');
	let contId = "0";
	for(let opt=0; opt < opts.length; ++opt)
	{
		if (opts[opt].selected == true) {
			contId = opts[opt].id;
			break;
		}
	}
	opts = editArtList.getElementsByTagName('option');
	for(let opt=0; opt < opts.length; ++opt) {
		let elem = opts[opt];
		if (opts[opt].getAttribute('containerid') == contId) {opts[opt].selected = false; opts[opt].removeAttribute('hidden'); opts[opt].removeAttribute('disabled')}
		else if (opts[opt].value != 'placeholder') {opts[opt].hidden = true;opts[opt].setAttribute('disabled','disabled');} else opts[opt].selected = true;
	}
}

// Load containers wrapper
function loadArticleContent(id) {
	loadRecords("article",id);
}

var articleIdShare = "";
// Load article content
function loadContent() {
	let selector = document.getElementById('editArtList');
	let editArtWrapper = document.getElementById('editArtWrapper');
	delArticle.style.visibility = 'hidden';
	editArtWrapper.style.visibility = 'hidden';
	editArtWrapper.style.maxHeight = '0';
	if (selector.value=="" || selector.value == 'placeholder')
	{
		selector.style.border="2px solid red";
		setTimeout(function (){selector.style.border=""},2000);
		return;
	}
	let selectedOpt = selector.options[selector.options['selectedIndex']];
	articleIdShare = selectedOpt.getAttribute('articleid');
	loadArticleContent(articleIdShare);
	delArticle.style.visibility = 'inherit';
	editArtWrapper.style.visibility = 'inherit';
	editArtWrapper.style.maxHeight = '100%';
	editArtTitle.value = selectedOpt.value;
	articleSortOrder.value = selectedOpt.getAttribute('sortorder');
	let opts = editArtContChanged.options;
	let contId = editArtContList.options[editArtContList['selectedIndex']].id;
	for(let opt=0; opt < opts.length; ++opt)
	{
		if (opts[opt].getAttribute('containerid') == contId)
			opts[opt].selected = true;
		else
			opts[opt].selected = false;
	}
}

// Store article
function storeArticle() {
	let storeRequest = new FormData();
	storeRequest.append("type","article");
	let articlePutMode = "";
	let sortOrder = "";
	let containerId = "";
	let artTitle = "";
	if (articleMode == 0)
		return;
	if (articleMode == 1) {
		articlePutMode = "create";
		containerId = createArticleContainer.options[createArticleContainer.options['selectedIndex']].getAttribute('containerid'); 
		artTitle = newArtTitle.value;
	}
	if (articleMode == 2)
	{
		articlePutMode = "refresh";
		artTitle = editArtTitle.value;
		containerId = editArtContChanged.options[editArtContChanged.options['selectedIndex']].getAttribute('containerid'); 
		sortOrder = articleSortOrder.value;
		storeRequest.append("article_id",articleIdShare);
	}
	if (artTitle.length == 0)
	{
		alert('Поле [Заголовок] не может быть пустым');
		return;
	}
	storeRequest.append("mode",articlePutMode);
	storeRequest.append("sort_order",sortOrder);
	storeRequest.append("container_id",containerId);
	storeRequest.append("article_title",artTitle);
	storeRequest.append("content",article_editor.getData());
	storeRecords(storeRequest,"article");
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
	for(let inst =0; inst < records.length; ++inst)
	{
		if (records[inst].index == element_index) 
		{
			let inst_to_remove = records[inst];
			register.removeChild(inst_to_remove);
			--rec_count;
			return;
		}
	}
}

// Send register-user message
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
				alert("Ошибка "+xhr.status+": "+xhr.statusText);
			} else {
				alert(xhr.response);
				if (xhr.response.indexOf("Успешная регистрация") != -1)
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

function foldMessage(runner) {
	if (runner.folded == undefined)
		runner.folded = true;
	let slave = document.getElementById(runner.getAttribute('slaveid'));
	if (runner.folded) {
		slave.style.display = 'block';
		runner.folded = false;
	}
	else {
		slave.style.display = 'none';
		runner.folded = true;
	}
}

var boardMode = 0;
function editBoard() {
	boardMode = 2;
	let editBoardWrapper = document.getElementById('editBoardWrapper');
	editBoardWrapper.style.visibility = 'inherit';
	editBoardWrapper.style.maxHeight = '100%';
	newBoardWrapper.style.visibility = 'hidden';
	newBoardWrapper.style.maxHeight = '0';
}
function newBoard() {
	boardMode = 1;
	let newBoardWrapper = document.getElementById('newBoardWrapper');
	newBoardWrapper.style.visibility = 'inherit';
	newBoardWrapper.style.maxHeight = '100%';
	editBoardWrapper.style.visibility = 'hidden';
	editBoardWrapper.style.maxHeight = '0';
}
var boardIdShare = "";

function loadBoardContent() {
	let selector = document.getElementById('boardArticleContainer');
	if (selector.value=="" || selector.value == 'placeholder')
	{
		selector.style.border="2px solid red";
		setTimeout(function (){selector.style.border=""},2000);
		return;
	}
	let selectedOpt = selector.options[selector.options['selectedIndex']];
	boardIdShare = selectedOpt.getAttribute('boardid');
	loadRecords("board",boardIdShare);
	delBoard.style.visibility = 'inherit';
	editBoardFields.style.visibility = 'inherit';
	editBoardFields.style.maxHeight = '100%';
	editBoardTitle.value = selectedOpt.value;
	editBoardDate.value = selectedOpt.getAttribute('date');
	boardSortOrder.value = selectedOpt.getAttribute('sortorder');
}

function storeBoard() {
	let storeRequest = new FormData();
	storeRequest.append("type","board");
	let boardPutMode = "";
	let sortOrder = "";
	let boardDate = "";
	let boardTitle = "";
	if (boardMode == 0)
		return;
	if (boardMode == 1) {
		boardPutMode = "create";
		boardDate = newBoardDate.value;
		boardTitle = newBoardTitle.value;
	}
	if (boardMode == 2)
	{
		boardPutMode = "refresh";
		boardTitle = editBoardTitle.value;
		boardDate = editBoardDate.value; 
		sortOrder = boardSortOrder.value;
		storeRequest.append("board_id",boardIdShare);
	}
	if (boardDate.length == 0 || boardTitle.length == 0)
	{
		alert('Поля [Дата] и [Заголовок] не могут быть пустыми');
		return;
	}
	storeRequest.append("mode",boardPutMode);
	storeRequest.append("sort_order",sortOrder);
	storeRequest.append("date",boardDate);
	storeRequest.append("board_title",boardTitle);
	storeRequest.append("content",board_editor.getData());
	storeRecords(storeRequest,"board");
}

function deleteBoard() {
	let storeRequest = new FormData();
	storeRequest.append("type","board_delete");
	storeRequest.append("board_id",boardIdShare);
	storeRecords(storeRequest,"board_delete");
}

function deleteArticle() {
	let storeRequest = new FormData();
	storeRequest.append("type","article_delete");
	storeRequest.append("article_id",articleIdShare);
	storeRecords(storeRequest,"board_delete");
}