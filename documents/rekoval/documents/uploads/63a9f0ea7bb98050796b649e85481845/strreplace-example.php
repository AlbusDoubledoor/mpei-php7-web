<?php
	date_default_timezone_set("Europe/Moscow");
	// Установка временной зоны
	$responseTemplate = <<<START
Здравствуйте, {username}. Ваше обращение #{ticketId} было рассмотрено в {considerTime}.
Сверка заявки:
<b>Номер:</b> {ticketId}
<b>Время обращения:</b> {ticketTime}
<b>Пользователь:</b> {username}
<b>Суть обращения:</b> 
{ticketDescription}
	
<b>Ответ по заявке:</b>
{ticketResponse}

<b>Обработал:</b> {manager}
<b>Время:</b> {considerTime}
START;

$username = "vasya_pupkin";
$ticketId = "123456";
$considerTime = date("d.m.Y H:i",time());    
// Формат 00.00.0000 00:00
$ticketTime = date("d.m.Y H:i",time()-7200); 
// Два часа назад
$ticketDescription = "Не работает интернет. Просьба позвонить по телефону 8-999-999-99-99";
$ticketResponse = "Здравствуйте, Василий. Тех. работы завершены. Ваше оборудование подключено";
$manager = "Петр Смирнов, менеджер тех. поддержки";

$response = str_replace("{username}",$username,$responseTemplate); 
// Сначала замена в шаблоне
$response = str_replace("{ticketId}",$ticketId,$response); 
// Затем замена в строке, которая будет итоговой
$response = str_replace("{considerTime}",$considerTime,$response);
$response = str_replace("{ticketTime}",$ticketTime,$response);
$response = str_replace("{ticketDescription}",$ticketDescription,$response);
$response = str_replace("{ticketResponse}",$ticketResponse,$response);
$response = str_replace("{manager}",$manager,$response);
$response = nl2br($response); 
// Замена переносов строк на тег <br /> для отображения в HTML

echo $response;
?>