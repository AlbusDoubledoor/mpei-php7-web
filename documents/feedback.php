<link rel=stylesheet type='text/css' href='/resource/css/feedback_form.css'>
<div class='feedback main-button'>
	<h3>Форма обратной связи</h3>
	<form class='feedback-form' action="putfeedback.php" method=POST target=putFeedback onsubmit="if (validateFeedback()) window.open('about:blank','putFeedback','width=375,height=400'); else return false">
		<div class='feedback-field'>
			<label>От кого:</label>
			<input type=text id='from' name='from' />
		</div>
		<div class='feedback-field'>
			<label>Тема:</label>
			<input type=text id='subject' name='subject' />
		</div>
		<div class='feedback-field'>
			<textarea id='message' name='message' rows=15 placeholder='Оставьте своё сообщение'></textarea>
		</div>
		<input class='special-button' type='submit' value='Отправить' />
	</form>
</div>