create database if not exists portal;
CREATE TABLE if not exists portal.articles (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ;


INSERT INTO portal.articles (`text`,name) VALUES ('<p>
	<span style="color:#008000;"><span style="font-size:16px;"><em class="emphasis" style="font-style: italic; font-weight: normal;">Что такое API?</em></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-size:16px;">Интерфейс программирования приложений, или API, определяет набор классов, методов, функций и переменных, которые можно вызывать из вашего приложения для выполнения поставленных задач. Применительно к PHP приложениям, которые должны взаимодействовать с базами данных, необходимые для этого API, как правило, представлены PHP-расширениями.</span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-size:16px;">API могут быть процедурными или объектно-ориентированными. При использовании процедурных API вы вызываете функции для выполнения каких-либо операций, а в случае объектно-ориентированных вы инстанцируете классы и затем вызываете методы созданных объектов. Второй подход, обычно, предпочтительнее, так как он более современный и способствует написанию более организованного кода.</span></p>
<p class="para">
	<em><span style="color:#008000;"><span style="font-size:16px;">API предоставляет на выбор три набора инструментов для подключения к серверу баз данных MySQL:</span></span></em></p>
<ul class="itemizedlist">
	<li class="listitem">
		<p class="para">
			<span style="font-size:16px;">Расширение PHP MySQL</span></p>
	</li>
	<li class="listitem">
		<p class="para">
			<span style="font-size:16px;">Расширение PHP mysqli</span></p>
	</li>
	<li class="listitem">
		<p class="para">
			<span style="font-size:16px;">Объекты данных PHP (PDO)(рассмотрен не будет)</span></p>
	</li>
</ul>
<p class="para">
	<span style="font-size:16px;">Каждый из них имеет свои достоинства и недостатки. Целью данного обзора является краткое описание ключевых особенностей каждого API.</span></p>
<p class="para">
	<span style="color:#008000;"><span style="font-size:16px;"><em class="emphasis">Что такое расширение PHP MySQL?</em></span></span></p>
<p class="para">
	<span style="font-size:16px;">Это оригинальное расширение позволяет разрабатывать PHP-приложения, которые могут взаимодействовать с базой данных MySQL. Расширение <em>mysql</em> предоставляет процедурный интерфейс и предназначено для использования с MySQL версии 4.1.3 или более ранними версиями. Его также можно использовать и с более свежими версиями СУБД, но в этом случае многие возможности сервера, появившиеся после версии 4.1.3, будут недоступны программисту.</span></p>
<blockquote class="note">
	<p>
		<span style="font-size:16px;"><strong class="note">Замечание</strong>:</span></p>
	<p class="para">
		<span style="font-size:16px;">Если вы работаете с сервером MySQL 4.1.3 или более поздних версий, <em class="emphasis">настоятельно</em> рекомендуется использовать расширение <em>mysqli</em>.</span></p>
	<p>
		&nbsp;</p>
</blockquote>
<p class="para">
	<span style="font-size:16px;">Исходные коды расширения <em>mysql</em> расположены в директории расширений PHP <var class="filename">ext/mysql</var>.</span></p>
<p class="para">
	<span style="font-size:16px;">Дополнительную информацию о расширении <em>mysql</em> можно почерпнуть из ресурса <a class="xref" href="https://www.php.net/manual/ru/book.mysql.php">MySQL (Original)</a>.</span></p>
<p class="para">
	<span style="color:#008000;"><span style="font-size:16px;"><em class="emphasis">Что такое PHP-расширение mysqli? </em></span></span></p>
<p class="para">
	<span style="font-size:16px;">Расширение <em>mysqli</em>, или как его еще называют <em class="emphasis">улучшенное (improved)</em> расширение MySQL, было разработано, чтобы дать возможность программистам в полной мере воспользоваться функционалом MySQL-сервера версий 4.1.3 и выше. Расширение <em>mysqli</em> включается в поставку PHP версий 5 и выше.</span></p>
<p class="para">
	<span style="font-size:16px;"><em>mysqli</em> имеет ряд преимуществ и усовершенствований по сравнению с <em>mysql</em>, которые заключаются в следующем:</span></p>
<ul class="itemizedlist">
	<li class="listitem">
		<p class="para">
			<span style="font-size:16px;">Объектно-ориентированный интерфейс</span></p>
	</li>
	<li class="listitem">
		<p class="para">
			<span style="font-size:16px;">Поддержка подготавливаемых запросов</span></p>
	</li>
	<li class="listitem">
		<p class="para">
			<span style="font-size:16px;">Поддержка мультизапросов</span></p>
	</li>
	<li class="listitem">
		<p class="para">
			<span style="font-size:16px;">Поддержка транзакций</span></p>
	</li>
	<li class="listitem">
		<p class="para">
			<span style="font-size:16px;">Улучшенные возможности отладки</span></p>
	</li>
	<li class="listitem">
		<p class="para">
			<span style="font-size:16px;">Поддержка встроенного сервера</span></p>
	</li>
</ul>
<p>
	&nbsp;</p>
<blockquote class="note">
	<p>
		<span style="font-size:16px;"><strong class="note">Замечание</strong>:</span></p>
	<p class="para">
		<span style="font-size:16px;">При работе с MySQL версий 4.1.3 и выше <em class="emphasis">настоятельно</em> рекомендуется использовать именно это расширение.</span></p>
	<p>
		&nbsp;</p>
</blockquote>
<p class="para">
	<span style="font-size:16px;">Наравне с объектно-ориентированным расширение предоставляет и процедурный интерфейс.</span></p>
<p class="para">
	<span style="font-size:16px;">Расширение <em>mysqli</em> собирается при помощи фреймворка расширений PHP, его исходный код расположен в директории <var class="filename">ext/mysqli</var>.</span></p>
<p class="para">
	<span style="font-size:16px;">За дополнительной информацией о расширении <em>mysqli</em>, обращайтесь к разделу <a class="xref" href="https://www.php.net/manual/ru/book.mysqli.php">MySQLi</a>.</span></p>
<p class="para" id="mysqli.overview.pdo">
	&nbsp;</p>
','Описание инструментов для взаимодействия PHP-приложений с базами данных MySQL.');
INSERT INTO portal.articles (text,name) VALUES ('<p>
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="color:#000000;">Расширение mysqli предоставляет двойной интерфейс программисту. Поддерживаются как процедурная, так и объектно-ориентированная парадигмы программирования.</span></span></span></p>
<p class="para">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="color:#000000;">Пользователи, переходящие со старого расширения mysql, возможно, предпочтут процедурный интерфейс. Он весьма схож с интерфейсом старого расширения, и во многих случаях функции отличаются только префиксом в имени. Некоторые mysqli-функции принимают дескриптор соединения первым аргументом, в отличие от соответствующих им функций старого расширения, которые принимают его в качестве последнего необязательного аргумента.</span></span></span></p>
<p class="para">
	&nbsp;</p>
<div class="example" id="example-1877">
	<p>
		<strong>Пример #1 Простота перехода со старого расширения mysql</strong></p>
	<p>
		&nbsp;</p>
	<hr />
	<div class="example-contents">
		<div class="phpcode">
			<span style="color:#ff0000;"><code><span style="color: #000000"><span style="color: #0000BB"><!--?php<br /-->$mysqli&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">mysqli_connect</span><span style="color: #007700">(</span><span style="color: #DD0000">&quot;example.com&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;user&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;password&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;database&quot;</span><span style="color: #007700">);</span><br />
			<span style="color: #0000BB">$res&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">mysqli_query</span><span style="color: #007700">(</span><span style="color: #0000BB">$mysqli</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;SELECT&nbsp;&#39;Пожалуйста,&nbsp;не&nbsp;используйте&nbsp;&#39;&nbsp;AS&nbsp;_msg&nbsp;FROM&nbsp;DUAL&quot;</span><span style="color: #007700">);</span><br />
			<span style="color: #0000BB">$row&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">mysqli_fetch_assoc</span><span style="color: #007700">(</span><span style="color: #0000BB">$res</span><span style="color: #007700">);<br />
			echo&nbsp;</span><span style="color: #0000BB">$row</span><span style="color: #007700">[</span><span style="color: #DD0000">&#39;_msg&#39;</span><span style="color: #007700">];</span><br />
			<br />
			<span style="color: #0000BB">$mysql&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">mysql_connect</span><span style="color: #007700">(</span><span style="color: #DD0000">&quot;example.com&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;user&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;password&quot;</span><span style="color: #007700">);</span><br />
			<span style="color: #0000BB">mysql_select_db</span><span style="color: #007700">(</span><span style="color: #DD0000">&quot;test&quot;</span><span style="color: #007700">);</span><br />
			<span style="color: #0000BB">$res&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">mysql_query</span><span style="color: #007700">(</span><span style="color: #DD0000">&quot;SELECT&nbsp;&#39;расширение&nbsp;mysql&nbsp;в&nbsp;новых&nbsp;проектах.&#39;&nbsp;AS&nbsp;_msg&nbsp;FROM&nbsp;DUAL&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #0000BB">$mysql</span><span style="color: #007700">);</span><br />
			<span style="color: #0000BB">$row&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">mysql_fetch_assoc</span><span style="color: #007700">(</span><span style="color: #0000BB">$res</span><span style="color: #007700">);<br />
			echo&nbsp;</span><span style="color: #0000BB">$row</span><span style="color: #007700">[</span><span style="color: #DD0000">&#39;_msg&#39;</span><span style="color: #007700">];</span><br />
			<span style="color: #0000BB">?&gt;</span> </span></code></span></div>
		<div class="phpcode">
			<hr />
		</div>
	</div>
	<div class="example-contents">
		<p>
			<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Результат выполнения данного примера:</span></span></p>
	</div>
	<div class="example-contents screen">
		<div class="cdata">
			<pre>
<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Пожалуйста, не используйте расширение mysql в новых проектах.
</span></span></pre>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
<p class="para">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="color:#008000;"><em class="emphasis">Объектно-ориентированный интерфейс</em></span></span></span></p>
<p class="para">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">В дополнение к процедурному пользователи могут использовать объектно-ориентированный интерфейс. Документация заточена именно под объектный интерфейс. Объектно-ориентированный интерфейс предлагает функции сгруппированные по цели их применения, что облегчает их поиск и освоение. Тем не менее, в практических примерах к функциям приводится код для обеих парадигм.</span></span></p>
<p class="para">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Каких-либо принципиальных отличий в производительности между интерфейсами нет. Пользователи вольны в выборе интерфейса, основываясь на личных предпочтениях.</span></span></p>
<p class="para">
	&nbsp;</p>
<div class="example" id="example-1878">
	<p>
		<strong>Пример #2 Объектно-ориентированный и процедурный интерфейсы</strong></p>
	<p>
		&nbsp;</p>
	<hr />
	<div class="example-contents">
		<div class="phpcode">
			<span style="color:#ff0000;"><code><span style="color: #000000"><span style="color: #0000BB"><!--?php<br /-->$mysqli&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">mysqli_connect</span><span style="color: #007700">(</span><span style="color: #DD0000">&quot;example.com&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;user&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;password&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;database&quot;</span><span style="color: #007700">);<br />
			if&nbsp;(</span><span style="color: #0000BB">mysqli_connect_errno</span><span style="color: #007700">())&nbsp;{<br />
			&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;</span><span style="color: #DD0000">&quot;Не&nbsp;удалось&nbsp;подключиться&nbsp;к&nbsp;MySQL:&nbsp;&quot;&nbsp;</span><span style="color: #007700">.&nbsp;</span><span style="color: #0000BB">mysqli_connect_error</span><span style="color: #007700">();<br />
			}</span><br />
			<br />
			<span style="color: #0000BB">$res&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">mysqli_query</span><span style="color: #007700">(</span><span style="color: #0000BB">$mysqli</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;SELECT&nbsp;&#39;Мир,&nbsp;полный&nbsp;&#39;&nbsp;AS&nbsp;_msg&nbsp;FROM&nbsp;DUAL&quot;</span><span style="color: #007700">);</span><br />
			<span style="color: #0000BB">$row&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">mysqli_fetch_assoc</span><span style="color: #007700">(</span><span style="color: #0000BB">$res</span><span style="color: #007700">);<br />
			echo&nbsp;</span><span style="color: #0000BB">$row</span><span style="color: #007700">[</span><span style="color: #DD0000">&#39;_msg&#39;</span><span style="color: #007700">];</span><br />
			<br />
			<span style="color: #0000BB">$mysqli&nbsp;</span><span style="color: #007700">=&nbsp;new&nbsp;</span><span style="color: #0000BB">mysqli</span><span style="color: #007700">(</span><span style="color: #DD0000">&quot;example.com&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;user&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;password&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;database&quot;</span><span style="color: #007700">);<br />
			if&nbsp;(</span><span style="color: #0000BB">$mysqli</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">connect_errno</span><span style="color: #007700">)&nbsp;{<br />
			&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;</span><span style="color: #DD0000">&quot;Не&nbsp;удалось&nbsp;подключиться&nbsp;к&nbsp;MySQL:&nbsp;&quot;&nbsp;</span><span style="color: #007700">.&nbsp;</span><span style="color: #0000BB">$mysqli</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">connect_error</span><span style="color: #007700">;<br />
			}</span><br />
			<br />
			<span style="color: #0000BB">$res&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">$mysqli</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">query</span><span style="color: #007700">(</span><span style="color: #DD0000">&quot;SELECT&nbsp;&#39;выбора,&nbsp;чтобы&nbsp;угодить&nbsp;всем.&#39;&nbsp;AS&nbsp;_msg&nbsp;FROM&nbsp;DUAL&quot;</span><span style="color: #007700">);</span><br />
			<span style="color: #0000BB">$row&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">$res</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">fetch_assoc</span><span style="color: #007700">();<br />
			echo&nbsp;</span><span style="color: #0000BB">$row</span><span style="color: #007700">[</span><span style="color: #DD0000">&#39;_msg&#39;</span><span style="color: #007700">];</span><br />
			<span style="color: #0000BB">?&gt;</span> </span></code></span></div>
		<div class="phpcode">
			<hr />
		</div>
	</div>
	<div class="example-contents">
		<p>
			<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Результат выполнения данного примера:</span></span></p>
	</div>
	<div class="example-contents screen">
		<div class="cdata">
			<pre>
<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Мир, полный выбора, чтобы угодить всем.
</span></span></pre>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
<p class="para">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="color:#008000;"><em class="emphasis">Смешивание стилей</em></span></span></span></p>
<p class="para">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Переключаться между стилями программирования можно сколь угодно часто и в любое время, однако делать этого не рекомендуется, так как это ухудшает читаемость кода и затрудняет его поддержку.</span></span></p>
<p class="para">
	&nbsp;</p>
<div class="example" id="example-1879">
	<p>
		<strong>Пример #3 Плохой стиль программирования</strong></p>
	<p>
		&nbsp;</p>
	<hr />
	<div class="example-contents">
		<div class="phpcode">
			<span style="color:#ff0000;"><code><span style="color: #000000"><span style="color: #0000BB"><!--?php<br /-->$mysqli&nbsp;</span><span style="color: #007700">=&nbsp;new&nbsp;</span><span style="color: #0000BB">mysqli</span><span style="color: #007700">(</span><span style="color: #DD0000">&quot;example.com&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;user&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;password&quot;</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;database&quot;</span><span style="color: #007700">);<br />
			if&nbsp;(</span><span style="color: #0000BB">$mysqli</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">connect_errno</span><span style="color: #007700">)&nbsp;{<br />
			&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;</span><span style="color: #DD0000">&quot;Не&nbsp;удалось&nbsp;подключиться&nbsp;к&nbsp;MySQL:&nbsp;&quot;&nbsp;</span><span style="color: #007700">.&nbsp;</span><span style="color: #0000BB">$mysqli</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">connect_error</span><span style="color: #007700">;<br />
			}</span><br />
			<br />
			<span style="color: #0000BB">$res&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">mysqli_query</span><span style="color: #007700">(</span><span style="color: #0000BB">$mysqli</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">&quot;SELECT&nbsp;&#39;Этот&nbsp;код&nbsp;работает,&nbsp;но&nbsp;лучше&nbsp;так&nbsp;не&nbsp;писать.&#39;&nbsp;AS&nbsp;_msg&nbsp;FROM&nbsp;DUAL&quot;</span><span style="color: #007700">);<br />
			if&nbsp;(!</span><span style="color: #0000BB">$res</span><span style="color: #007700">)&nbsp;{<br />
			&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;</span><span style="color: #DD0000">&quot;Не&nbsp;удалось&nbsp;выполнить&nbsp;запрос:&nbsp;(&quot;&nbsp;</span><span style="color: #007700">.&nbsp;</span><span style="color: #0000BB">$mysqli</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">errno&nbsp;</span><span style="color: #007700">.&nbsp;</span><span style="color: #DD0000">&quot;)&nbsp;&quot;&nbsp;</span><span style="color: #007700">.&nbsp;</span><span style="color: #0000BB">$mysqli</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">error</span><span style="color: #007700">;<br />
			}<br />
			<br />
			if&nbsp;(</span><span style="color: #0000BB">$row&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">$res</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">fetch_assoc</span><span style="color: #007700">())&nbsp;{<br />
			&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;</span><span style="color: #0000BB">$row</span><span style="color: #007700">[</span><span style="color: #DD0000">&#39;_msg&#39;</span><span style="color: #007700">];<br />
			}</span><br />
			<span style="color: #0000BB">?&gt;</span> </span></code></span></div>
		<div class="phpcode">
			<hr />
		</div>
	</div>
	<div class="example-contents">
		<p>
			<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Результат выполнения данного примера:</span></span></p>
	</div>
	<div class="example-contents screen">
		<div class="cdata">
			<pre>
<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Этот код работает, но лучше так не писать.</span></span></pre>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
<p>
	&nbsp;</p>
','Процедурный и объектно-ориентированный интерфейс');
INSERT INTO portal.articles (text,name) VALUES ('<h2 new="" style="margin: 30px 0px 15px; padding: 0px; border: 0px; border-image: none; text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times="">
	<span style="color:#008000;"><em>Варианты подключения к базе данных MySQL</em></span></h2>
<h2 new="" style="margin: 30px 0px 15px; padding: 0px; border: 0px; border-image: none; text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times="">
	<span style="color:#000000;"><span style="font-size:14px;"><span new="" style="display: inline !important; float: none; background-color: rgb(255, 255, 255);" times="">1) Подключение с помощью старого расширения&nbsp; mysql:</span></span></span></h2>
<hr />
<p>
	<span style="color:#000000;"><span style="font-size:14px;"><span new="" style="display: inline !important; float: none; background-color: rgb(255, 255, 255);" times=""><span style="background-color: rgb(255, 255, 255); color: rgb(0, 0, 255); display: inline; float: none; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">$conn=mysql_connect($db_hostname, $db_username, $db_password) or die (&quot;Нет подключения к серверу&quot;);</span></span></span></span></p>
<p>
	<span style="color:#000000;"><span style="font-size:14px;"><span new="" style="display: inline !important; float: none; background-color: rgb(255, 255, 255);" times=""><span style="background-color: rgb(255, 255, 255); color: rgb(0, 0, 255); display: inline; float: none; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">mysql_select_db($db_database,$conn) or die (&quot;Нет удалось соединиться с БД&quot;);</span></span></span></span></p>
<hr />
<p>
	<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;"><span inline="" new="" times=""><span courier="" inline=""><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">- пояснения к переменным ниже.</span></span></span></span></span></span></p>
<p style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; color: rgb(79, 79, 79); font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; margin-bottom: 15px; margin-left: 0px; margin-right: 0px; margin-top: 15px; orphans: 2; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;">При этом используются функции:</span></span></span></p>
<ul style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; color: rgb(79, 79, 79); font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; list-style-image: none; list-style-position: outside; list-style-type: disc; margin-bottom: 15px; margin-left: 40px; margin-right: 0px; margin-top: 15px; orphans: 2; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<li style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; line-height: 160%; margin-bottom: 5px; margin-left: 0px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px; padding-top: 0px;">
		<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;"><strong style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;">mysql_connect()</strong> - для подключения к серверу;</span></span></span></li>
	<li style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; line-height: 160%; margin-bottom: 5px; margin-left: 0px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px; padding-top: 0px;">
		<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;"><strong style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;">mysql_select_db()</strong> - для подключения к БД;</span></span></span></li>
</ul>
<p style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; color: rgb(79, 79, 79); font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; margin-bottom: 15px; margin-left: 0px; margin-right: 0px; margin-top: 15px; orphans: 2; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;">При этом постоянно проверяем на наличие ошибки таким способом: or die (&quot;Ошибка такая то&quot;); - переводится как или умри с такой-то ошибкой - чтобы сразу найти где ошибка.</span></span></span></p>
<h2 new="" style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; color: rgb(79, 79, 79); font-family: Georgia," times="">
	<span style="color:#000000;"><span style="font-size:14px;">2) Более прогрессивный процедурный стиль - соединение с БД при помощи mysqli:</span></span></h2>
<p style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; color: rgb(79, 79, 79); font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; margin-bottom: 15px; margin-left: 0px; margin-right: 0px; margin-top: 15px; orphans: 2; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;">Данный способ:</span></span></span></p>
<ol style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; color: rgb(79, 79, 79); font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 160%; margin-bottom: 5px; margin-left: 0px; margin-right: 0px; margin-top: 15px; orphans: 2; padding-bottom: 0px; padding-left: 20px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<li style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; line-height: 160%; margin-bottom: 5px; margin-left: 16px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;">
		<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;">удобнее;</span></span></span></li>
	<li style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; line-height: 160%; margin-bottom: 5px; margin-left: 16px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;">
		<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;">быстрее до 40 раз;</span></span></span></li>
	<li style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; line-height: 160%; margin-bottom: 5px; margin-left: 16px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;">
		<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;">повышена безопасность;</span></span></span></li>
	<li style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; line-height: 160%; margin-bottom: 5px; margin-left: 16px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;">
		<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;">есть новые возможности и функции;</span></span></span></li>
</ol>
<hr />
<p style="margin: 15px 0px; padding: 0px; border: 0px; border-image: none; text-align: left; color: rgb(79, 79, 79); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-variant: normal; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">
	<span style="color:#0000ff;"><span style="font-size:14px;"><span courier="" style="display: inline !important; float: none;">// соедения с БД</span><br courier="" style="color: rgb(84, 84, 84); font-family: Monaco,Menlo,Consolas," />
	<span courier="" style="display: inline !important; float: none;">&nbsp;&nbsp;&nbsp; $link = mysqli_connect(&#39;localhost&#39;, &#39;username&#39;, &#39;password&#39;, &#39;name-database&#39;); // тут вводим прям данные ваши: имя юзера, пароль и имя БД, первое поле обычно localhost</span><br courier="" style="color: rgb(84, 84, 84); font-family: Monaco,Menlo,Consolas," />
	<span courier="" style="display: inline !important; float: none;">&nbsp;&nbsp; &nbsp;</span><br courier="" style="color: rgb(84, 84, 84); font-family: Monaco,Menlo,Consolas," />
	<span courier="" style="display: inline !important; float: none;">&nbsp;&nbsp; &nbsp;// вывод ошибки соединения</span><br courier="" style="color: rgb(84, 84, 84); font-family: Monaco,Menlo,Consolas," />
	<span courier="" style="display: inline !important; float: none;">&nbsp;&nbsp;&nbsp; if (!$link) {</span><br courier="" style="color: rgb(84, 84, 84); font-family: Monaco,Menlo,Consolas," />
	<span courier="" style="display: inline !important; float: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;Ошибка подключения к БД. Код ошибки: &quot; . mysqli_connect_error();</span><br courier="" style="color: rgb(84, 84, 84); font-family: Monaco,Menlo,Consolas," />
	<span courier="" style="display: inline !important; float: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit;</span><br courier="" style="color: rgb(84, 84, 84); font-family: Monaco,Menlo,Consolas," />
	<span courier="" style="display: inline !important; float: none;">&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp; </span></span></span></p>
<hr />
<p style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; color: rgb(79, 79, 79); font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; margin-bottom: 15px; margin-left: 0px; margin-right: 0px; margin-top: 15px; orphans: 2; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<strong><span style="color:#000000;"><span style="font-size:14px;"><span courier="" style="display: inline !important; float: none;">3) Объектно-ориентированный метод подключения к бд MySQL - с помощью методов и классов:&nbsp;</span></span></span></strong></p>
<p style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; color: rgb(79, 79, 79); font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; margin-bottom: 15px; margin-left: 0px; margin-right: 0px; margin-top: 15px; orphans: 2; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;"><span courier="" style="display: inline !important; float: none;">Минусы: сложнее и менее восприимчив к ошибкам.</span></span></span></span></p>
<p style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; color: rgb(79, 79, 79); font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; margin-bottom: 15px; margin-left: 0px; margin-right: 0px; margin-top: 15px; orphans: 2; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;"><span courier="" style="display: inline !important; float: none;">Плюсы: краткость и удобство для программистов с опытом.</span></span></span></span></p>
<hr />
<p style="margin: 15px 0px; padding: 0px; border: 0px; border-image: none; text-align: left; color: rgb(79, 79, 79); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-variant: normal; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">
	<span style="color:#0000ff;"><span style="font-size:14px;"><span courier="" style="display: inline !important; float: none;"><span courier="" style="display: inline !important; float: none;">$conn = new mysqli($db_hostname, $db_username, $db_password, $db_database);</span><br courier="" style="color: rgb(84, 84, 84); font-family: Monaco,Menlo,Consolas," />
	<span courier="" style="display: inline !important; float: none;">&nbsp;&nbsp;&nbsp; if($conn-&gt;connect_errno){</span><br courier="" style="color: rgb(84, 84, 84); font-family: Monaco,Menlo,Consolas," />
	<span courier="" style="display: inline !important; float: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; die($conn-&gt;connect_error);</span><br courier="" style="color: rgb(84, 84, 84); font-family: Monaco,Menlo,Consolas," />
	<span courier="" style="display: inline !important; float: none;">&nbsp;&nbsp;&nbsp; } else {echo &quot;Соединение с БД успешно установлено&quot;;}</span></span></span></span></p>
<hr />
<p style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; color: rgb(79, 79, 79); font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; margin-bottom: 15px; margin-left: 0px; margin-right: 0px; margin-top: 15px; orphans: 2; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;"><span courier="" style="display: inline !important; float: none;"><span courier="" style="display: inline !important; float: none;">тут в принципе все интуитивно понятно:</span></span></span></span></span></p>
<ul style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; color: rgb(79, 79, 79); font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; list-style-image: none; list-style-position: outside; list-style-type: disc; margin-bottom: 15px; margin-left: 40px; margin-right: 0px; margin-top: 15px; orphans: 2; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<li style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; line-height: 160%; margin-bottom: 5px; margin-left: 0px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px; padding-top: 0px;">
		<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;"><span courier="" style="display: inline !important; float: none;"><span courier="" style="display: inline !important; float: none;">$db_hostname - это <strong style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;">хост</strong> (в основном localhost),</span></span></span></span></span></li>
	<li style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; line-height: 160%; margin-bottom: 5px; margin-left: 0px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px; padding-top: 0px;">
		<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;"><span courier="" style="display: inline !important; float: none;"><span courier="" style="display: inline !important; float: none;">$db_database - <strong style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;">имя БД</strong>;</span></span></span></span></span></li>
	<li style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; line-height: 160%; margin-bottom: 5px; margin-left: 0px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px; padding-top: 0px;">
		<span style="font-family:arial,helvetica,sans-serif;"><span style="color:#000000;"><span style="font-size:14px;"><span courier="" style="display: inline !important; float: none;"><span courier="" style="display: inline !important; float: none;">$db_username и $db_password - имя пользователя и пароль соответственно!</span></span></span></span></span></li>
	<li style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; line-height: 160%; margin-bottom: 5px; margin-left: 0px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px; padding-top: 0px;">
		<span style="color:#000000;"><span courier="" style="display: inline !important; float: none;"><span courier="" style="display: inline !important; float: none;"><span class="refname" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-variant: normal; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><var class="varname" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 16px; font-variant: normal; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><span style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-variant: normal; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="display: inline !important; float: none; background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-family: Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">$mysqli-&gt;connect_errno</span></span></var></span></span></span></span><span style="font-size:14px;"><span style="color:#000000;"><span courier="" style="display: inline !important; float: none;"><span courier="" style="display: inline !important; float: none;"><span fira="" inline="" sans="" source="" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: "> &mdash; </span><span class="dc-title" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">Возвращает код ошибки последней попытки соединения&nbsp;</span></span></span></span></span></li>
	<li style="border-bottom-color: currentColor; border-bottom-style: none; border-bottom-width: 0px; border-image-outset: 0; border-image-repeat: stretch; border-image-slice: 100%; border-image-source: none; border-image-width: 1; border-left-color: currentColor; border-left-style: none; border-left-width: 0px; border-right-color: currentColor; border-right-style: none; border-right-width: 0px; border-top-color: currentColor; border-top-style: none; border-top-width: 0px; line-height: 160%; margin-bottom: 5px; margin-left: 0px; margin-right: 0px; margin-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px; padding-top: 0px;">
		<span style="font-size:14px;"><span style="color:#000000;"><span courier="" style="display: inline !important; float: none;"><span courier="" style="display: inline !important; float: none;"><span class="dc-title" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">$mysqli-&gt;connect_error -&nbsp;<span class="dc-title" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">Возвращает описание последней ошибки подключения</span></span></span></span></span></span></li>
</ul>
<p style="margin: 15px 0px; padding: 0px; border: 0px; border-image: none; text-align: left; color: rgb(79, 79, 79); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Helvetica,Arial,sans-serif; font-size: 16px; font-variant: normal; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">
	&nbsp;</p>
<h3 id="Установка-кодировки" style="box-sizing: inherit; color: inherit; display: block; font-family: inherit; font-size: 20px; font-style: normal; font-variant: normal; font-weight: 700; letter-spacing: normal; line-height: 28px; margin-bottom: 10px; margin-left: 0px; margin-right: 0px; margin-top: 0px; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<span style="font-size:18px;"><em><strong><span style="color:#008000;">Установка кодировки</span></strong></em></span></h3>
<p style="box-sizing: inherit; color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Первым делом после установки соединения крайне желательно явно задать кодировку, которая будет использоваться при обмене данными с&nbsp;MySQL. Если этого не&nbsp;сделать, то&nbsp;вместо записей со&nbsp;значениями, написанными кириллицей, можно получить последовательность из&nbsp;знаков вопроса: &lsquo;?????????????????&rsquo;.<br style="box-sizing: inherit;" />
	Вызови эту функцию сразу после успешной установки соединения:</span></span></p>
<p style="box-sizing: inherit; color: rgb(51, 51, 51); font-family: ">
	<span style="color:#0000ff;"><span style="font-size:14px;"><span courier="" inline="" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: " ubuntu=""><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">mysql_set_charset(&quot;utf8&quot;); //<span segoe="" style="font-size:9.0pt;line-height:115%;&#10;font-family:">Пример (mysql процедурный)</span></span></span></span></span></p>
<p style="box-sizing: inherit; color: rgb(51, 51, 51); font-family: ">
	<span style="color:#0000ff;"><span style="font-size:14px;"><span courier="" inline="" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: " ubuntu=""><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">mysqli_set_charset($con, &quot;utf8&quot;); //<span segoe="" style="font-size:9.0pt;line-height:115%;&#10;font-family:">Пример (mysqli</span><span segoe="" style="font-size:9.0pt;line-height:115%;&#10;font-family:"> </span><span segoe="" style="font-size:9.0pt;line-height:115%;font-family:">процедурный)</span></span></span></span></span></span></p>
<p style="box-sizing: inherit; color: rgb(51, 51, 51); font-family: ">
	<span style="color:#0000ff;"><span style="font-size:14px;"><span courier="" inline="" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: " ubuntu=""><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span class="pln" style="text-align: justify; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: pre; orphans: 2; -webkit-text-stroke-width: 0px;">$mysqli</span><span class="pun" style="text-align: justify; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: pre; orphans: 2; -webkit-text-stroke-width: 0px;">-&gt;</span><span class="pln" style="text-align: justify; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: pre; orphans: 2; -webkit-text-stroke-width: 0px;">set_charset</span><span class="pun" style="text-align: justify; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: pre; orphans: 2; -webkit-text-stroke-width: 0px;">(</span><span class="str" style="text-align: justify; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: pre; orphans: 2; -webkit-text-stroke-width: 0px;">&#39;utf8&#39;</span><span class="pun" style="text-align: justify; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: pre; orphans: 2; -webkit-text-stroke-width: 0px;">); //<span segoe="" style="font-size:9.0pt;line-height:115%;&#10;font-family:">Пример (mysqli объектно-ориентированный)</span></span></span></span></span></span></p>
<p style="margin: 0px 0px 20px; text-align: left; text-transform: none; line-height: 25px; text-indent: 0px; letter-spacing: normal; font-size: 16px; font-style: normal; font-variant: normal; text-decoration: none; word-spacing: 0px; white-space: normal; box-sizing: inherit; orphans: 2; -webkit-text-stroke-width: 0px;">
	<em><span style="font-size:18px;"><span style="color:#008000;"><b>Закрытие соединения</b></span></span></em></p>
<p style="margin: 0px 0px 20px; text-align: left; text-transform: none; line-height: 25px; text-indent: 0px; letter-spacing: normal; font-size: 16px; font-style: normal; font-variant: normal; text-decoration: none; word-spacing: 0px; white-space: normal; box-sizing: inherit; orphans: 2; -webkit-text-stroke-width: 0px;">
	<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Соединение будет закрыто автоматически при завершении сценария. Чтобы закрыть подключение, выполните следующие действия.</span></span></span></p>
<p>
	<small><span style="color:#0000ff;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Verdana,sans-serif; font-variant: normal; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Consolas,courier new; font-variant: normal; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; overflow-wrap: break-word; background-color: rgb(255, 255, 255);"><span style="font-size:14px;"><span style="text-align: left; color: rgb(0, 0, 255); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Consolas,courier new; font-size: 14px; font-variant: normal; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">mysql_close($conn); //<span segoe="">Пример</span> (mysql процедурный)</span></span></span></span></span></small></p>
<p>
	<small><span style="color:#0000ff;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Verdana,sans-serif; font-variant: normal; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Consolas,courier new; font-variant: normal; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; overflow-wrap: break-word; background-color: rgb(255, 255, 255);"><span style="font-size:14px;"><span style="text-align: left; color: rgb(0, 0, 255); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Consolas,courier new; font-size: 14px; font-variant: normal; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">mysqli_close($conn); //<span segoe="">Пример</span> (mysqli процедурный)</span></span></span></span></span></small></p>
<p>
	<small><span style="color:#0000ff;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Verdana,sans-serif; font-variant: normal; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Consolas,courier new; font-variant: normal; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; overflow-wrap: break-word; background-color: rgb(255, 255, 255);"><span style="font-size:14px;"><span style="text-align: left; color: rgb(0, 0, 255); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Consolas,courier new; font-size: 14px; font-variant: normal; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">$conn-&gt;close(); //<span segoe="">Пример (mysqli объектно-ориентированный)</span></span></span></span></span></span></small></p>
<p>
	&nbsp;</p>
<p style="margin-left:&#10;">
	<span style="color:#008000;"><span style="font-size:18px;"><strong><em>Умолчания для параметров соединений</em></strong></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">В зависимости от функции, осуществляющей подключение, какие-то параметры можно не задавать. Если параметр не задан, расширение попытается использовать значение по умолчанию для этого параметра, которое задано в конфигурационном файле PHP.</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	&nbsp;</p>
<div class="example" fira="" id="mssql.mssql-select-db.example.basic" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<p style="margin-bottom: 1.5rem; margin-left: 0px; margin-right: 0px; margin-top: 0px;">
		<span style="color:#000000;"><b><font size="3">Пример задание значений по умолчанию</font></b></span></p>
	<div class="example-contents" style="margin-bottom: 1.5rem;">
		<div class="inicode" style="background-color: rgb(255, 255, 255); border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; border-top-left-radius: 0px; border-top-right-radius: 0px; box-shadow: inset 0px 0px 0px 1px rgba(0,0,0,0.15); padding-bottom: 0.75rem; padding-left: 0.75rem; padding-right: 0.75rem; padding-top: 0.75rem;">
			<pre class="inicode" style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px; white-space: pre-wrap;">
<span style="color:#0000ff;"><span style="font-size:14px;">mysqli.default_host=192.168.2.27
mysqli.default_user=root
mysqli.default_pw=&quot;&quot;
mysqli.default_port=3306
mysqli.default_socket=/tmp/mysql.sock</span></span></pre>
		</div>
	</div>
</div>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Далее, чтобы установить соединение, функция передает параметры в клиентскую библиотеку, которой пользуется расширение. Если библиотека обнаружит пустые или отсутствующие параметры, она может подставить вместо них свои встроенные значения по умолчанию.</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="color:#008000;"><span style="font-size:18px;"><strong><i>Настройки соединения</i></strong></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Настройки соединения позволяют, например, задать какие-то команды, которые нужно выполнить сразу после подключения, или отдать распоряжение использовать определенный набор символов. Настройки должны быть заданы до подключения к серверу.</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Когда требуется задать настройки соединения, операция подключения выполняется в три этапа: функцией <span style="color:#0000ff;"><span class="function"><a class="function" href="https://www.php.net/manual/ru/mysqli.init.php" style="border-bottom-color: currentColor; border-bottom-style: solid; border-bottom-width: 1px; color: rgb(51, 102, 153); text-decoration: none;">mysqli_init()</a></span></span> создается дескриптор подключения, затем подключение настраивается с помощью функции <span class="function"><a class="function" href="https://www.php.net/manual/ru/mysqli.options.php" style="border-bottom-color: currentColor; border-bottom-style: solid; border-bottom-width: 1px; color: rgb(51, 102, 153); text-decoration: none;">mysqli_options()</a></span>, и наконец устанавливается сетевое соединение с сервером посредством функции <span class="function"><a class="function" href="https://www.php.net/manual/ru/mysqli.real-connect.php" style="border-bottom-color: currentColor; border-bottom-style: solid; border-bottom-width: 1px; color: rgb(51, 102, 153); text-decoration: none;">mysqli_real_connect()</a></span>.</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	&nbsp;</p>
','Соединения');
INSERT INTO portal.articles (text,name) VALUES ('<p>
	<span style="color:#008000;"><strong><em><span style="font-size:18px;">Буферизированные и не буферизированные результаты</span></em></strong></span></p>
<p>
	<br />
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Рассмотрим небуферизированный результат. В этом случае вы можете начинать читать результаты, не дожидаясь пока mysql сервер получит результат полностью.<br />
	<br />
	Преимущества:</span></span></p>
<ul>
	<li>
		<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Результат можно начинать читать раньше, сокращается время ожидания;</span></span></li>
	<li>
		<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Результат не занимает место в оперативной памяти.</span></span></li>
</ul>
<p>
	<br />
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Недостатки:</span></span></p>
<ul>
	<li>
		<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Невозможно узнать, сколько строк получено;</span></span></li>
	<li>
		<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Невозможно передвигаться к определенному результату, то есть можно читать данные только с начала и по порядку;</span></span></li>
	<li>
		<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Нельзя выполнять других запросов, пока не закрыт этот результат.</span></span></li>
</ul>
<p>
	<br />
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Буферизированный результат лишен этих недостатков и соответственно лишен перечисленных преимуществ.</span></span></p>
<p>
	&nbsp;</p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-size:18px;"><span style="color:#008000;"><em class="emphasis" style="font-style: italic; font-weight: normal;">Буферизация результатов запроса</em></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">После выполнения запроса его результаты можно целиком буферизовать на клиенте, либо читать построчно с сервера. Буферизация на клиенте позволяет серверу как можно быстрее освобождать занятые запросом ресурсы. Построчное же чтение и дальнейшая обработка результатов клиентом довольно медленный процесс. Поэтому рекомендуется использовать буферизацию результирующих наборов. Функция <span class="function"><a class="function" href="https://www.php.net/manual/ru/mysqli.query.php" style="border-bottom-color: currentColor; border-bottom-style: solid; border-bottom-width: 1px; color: rgb(51, 102, 153); text-decoration: none;">mysqli_query()</a></span> совмещает в себе операции выполнения запроса и буферизации результирующего набора.</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">PHP-приложения могут свободно оперировать данными внутри буферизованных результирующих наборов. Быстрая навигация по строкам наборов обусловлена тем, что наборы полностью располагаются в памяти клиента. Следует помнить, что зачастую обработка результатов на клиенте проще, нежели средствами сервера.</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	&nbsp;</p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-size:18px;"><span style="color:#008000;"><em class="emphasis" style="font-style: italic; font-weight: normal;">Небуферизуемые результирующие наборы</em></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Если клиентские ресурсы ограничены, и в тоже время не требуется поддерживать низкую нагрузку на сервер, можно использовать не буферизованные результирующие наборы. Навигация по таким таблицам невозможна, потому что так или иначе должны быть обработаны все строки набора.</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span fira="" inline="" sans="" source="" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: ">За выполнение запросов отвечают функции </span><span class="function" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><a class="function" href="https://www.php.net/manual/ru/mysqli.query.php" style="border-bottom-color: currentColor; border-bottom-style: solid; border-bottom-width: 1px; color: rgb(51, 102, 153); text-decoration: none;">mysqli_query()</a></span><span fira="" inline="" sans="" source="" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: ">, </span><span class="function" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><a class="function" href="https://www.php.net/manual/ru/mysqli.real-query.php" style="border-bottom-color: currentColor; border-bottom-style: solid; border-bottom-width: 1px; color: rgb(51, 102, 153); text-decoration: none;">mysqli_real_query()</a></span><span fira="" inline="" sans="" source="" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: "> и </span><span class="function" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><a class="function" href="https://www.php.net/manual/ru/mysqli.multi-query.php" style="border-bottom-color: currentColor; border-bottom-style: solid; border-bottom-width: 1px; color: rgb(51, 102, 153); text-decoration: none;">mysqli_multi_query()</a></span><span fira="" inline="" sans="" source="" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: ">. Чаще всего применяется функция </span><span class="function" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><a class="function" href="https://www.php.net/manual/ru/mysqli.query.php" style="border-bottom-color: currentColor; border-bottom-style: solid; border-bottom-width: 1px; color: rgb(51, 102, 153); text-decoration: none;">mysqli_query()</a></span><span fira="" inline="" sans="" source="" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: ">, так как она выполняет сразу две задачи: выполняет запрос и буферизует на клиенте результат этого запроса (если он есть). Вызов </span><span class="function" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><a class="function" href="https://www.php.net/manual/ru/mysqli.query.php" style="border-bottom-color: currentColor; border-bottom-style: solid; border-bottom-width: 1px; color: rgb(51, 102, 153); text-decoration: none;">mysqli_query()</a></span><span fira="" inline="" sans="" source="" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: "> идентичен последовательному вызову функций </span><span class="function" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><a class="function" href="https://www.php.net/manual/ru/mysqli.real-query.php" style="border-bottom-color: currentColor; border-bottom-style: solid; border-bottom-width: 1px; color: rgb(51, 102, 153); text-decoration: none;">mysqli_real_query()</a></span><span fira="" inline="" sans="" source="" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: "> и </span><span class="function" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><a class="function" href="https://www.php.net/manual/ru/mysqli.store-result.php" style="border-bottom-color: currentColor; border-bottom-style: solid; border-bottom-width: 1px; color: rgb(51, 102, 153); text-decoration: none;">mysqli_store_result()</a></span><span fira="" inline="" sans="" source="" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: ">. </span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	&nbsp;</p>
<p class="para" fira="" sans="" source="">
	<span style="color:#008000;"><b><i><font size="4">Основные функции PHP для обработки запросов</font></i></b></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<em><strong><span style="color:#008000;"><span style="font-size:18px;"><span fira="" inline="" sans="" source="" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal;"><span mce_style="color: red;" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Helvetica,sans-serif; font-variant: normal; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><span class="function" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">mysqli_query();</span></span></span></span></span></strong></em></p>
<p>
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Наверно самая, часто встречающаяся функция PHP для SQL-запроса. C помощью mysqli_query(), непосредственно происходит передача, уже составленного SQL &ndash; запроса, к базе данных.</span></span></p>
<p>
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Функция принимает два аргумента. Первый аргумент содержит дескриптор соединения, возвращаемый функцией mysqli_connect(),второй аргумент - это строка со SQL-запросом.</span></span></p>
<p>
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Объектно-ориентированный стиль:</span></span></p>
<p>
	<span style="color:#0000ff;"><span style="font-size:14px;">$mysqli-&gt;query(&quot;запрос&quot;)</span></span></p>
<p>
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Процедурный стиль:</span></span></p>
<p>
	<span style="color:#0000ff;"><span style="font-size:14px;">$result&nbsp;=&nbsp;mysqli_query($link,&nbsp;&quot;запрос&quot;)</span></span></p>
<p>
	<span style="color:#0000ff;"><span style="font-size:14px;">$q = mysql_query(&quot;запрос&quot;);</span></span></p>
<p>
	&nbsp;</p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="color:#008000;"><span style="font-size:18px;">mysqli_num_rows();</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span fira="" inline="" sans="" source="" style="text-align: left; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: ">Возвращает число рядов в результирующей выборке. </span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Процедурный стиль:</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="color:#0000ff;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">$result=mysqli_query($lin,$query);</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="color:#0000ff;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">$i=mysqli_num_rows($result);</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Объектно-ориентированный стиль:</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="color:#0000ff;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">$result&nbsp;</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">=&nbsp;</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">$mysqli</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">-&gt;</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">query</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">(</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">&quot;запрос&quot;</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">);</span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="color:#0000ff;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">$row_cnt&nbsp;</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">=&nbsp;</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">$result</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">-&gt;</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">num_rows</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">;</span></span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	&nbsp;</p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="color:#008000;"><span style="font-size:18px;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">mysqli_data_seek(result,offset);</span></span></span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><span fira="" inline="" sans="" source="" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: ">Функция </span><span style="font-size:14px;"><span class="function" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><strong style="font-style: normal; font-weight: 500;">mysqli_data_seek()</strong></span></span><span fira="" inline="" sans="" source="" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: "> перемещает указатель в результате на строку, указанную в параметре </span><code class="parameter" code="" fira="" source="" style="color: rgb(51, 102, 153); cursor: pointer; font-family: ">offset</code><span fira="" inline="" sans="" source="" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: ">.</span></span></span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Процедурный стиль:</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="color:#0000ff;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">mysqli_data_seek($result,0);</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><font color="#001000"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Объектно-ориентированный стиль:</span></font></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="color:#0000ff;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">$result</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">-&gt;</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">data_seek</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">(</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">399</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">);</span></span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	&nbsp;</p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-size:18px;"><span style="color:#008000;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Arial,Verdana,sans-serif; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">mysqli_fetch_assoc($result);</span></span></span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="color:#000000;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;"><span fira="" inline="" sans="" source="" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: ">Возвращает ассоциативный массив, соответствующий результирующей выборке или </span><strong fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: "><code code="" fira="" source="" style="font-family: ">NULL</code></strong><span fira="" inline="" sans="" source="" style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: ">, если других рядов не существует. </span></span></span></span></span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Процедурный стиль:</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="color:#0000ff;"><span style="font-size:14px;">$text[]=mysqli_fetch_assoc($result)</span>;</span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Объектно-ориентированный стиль:</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="color:#0000ff;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">$row&nbsp;</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">=&nbsp;</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">$result</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">-&gt;</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">fetch_assoc</span><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-size: 13.93px; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; -webkit-text-stroke-width: 0px;">();</span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	&nbsp;</p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-size:18px;"><span style="color:#000000;"><strong><span new="" style="display: inline !important; float: none; background-color: rgb(255, 255, 255);" times="">Пример соединения с БД на php с выборкой из таблицы</span></strong></span></span></p>
<div>
	<hr />
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="color:#0000ff;"><span style="font-size:14px;">$lin=mysqli_connect(db_host,db_user,db_pass) or die (&quot;Нет соединения с сервером&quot;);</span></span></span></font></p>
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="color:#0000ff;"><span style="font-size:14px;">mysqli_select_db ($lin,db_name) or die (&quot;Нет соединения с БД&quot;);</span></span></span></font></p>
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="color:#0000ff;"><span style="font-size:14px;">mysqli_set_charset($lin, &quot;utf8&quot;);</span></span></span></font></p>
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="font-size:14px;"><span style="color:#0000ff;">$text = array();</span></span></span></font></p>
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="font-size:14px;"><span style="color:#0000ff;">$query=&quot;SELECT * FROM articles ORDER BY id;&quot;;</span></span></span></font></p>
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="font-size:14px;"><span style="color:#0000ff;">$result=mysqli_query($lin,$query);</span></span></span></font></p>
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="font-size:14px;"><span style="color:#0000ff;">for($i=0;$i<mysqli_num_rows($result);$i++)< span=""></mysqli_num_rows($result);$i++)<></span></span></span></font></p>
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="font-size:14px;"><span style="color:#0000ff;">{</span></span></span></font></p>
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="font-size:14px;"><span style="color:#0000ff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mysqli_data_seek($result,$i);</span></span></span></font></p>
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="font-size:14px;"><span style="color:#0000ff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $text[]=mysqli_fetch_assoc($result);</span></span></span></font></p>
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="font-size:14px;"><span style="color:#0000ff;">}</span></span></span></font></p>
	<p>
		<font color="#000025" size="3"><span inline="" new="" style="text-align: left; color: rgb(79, 79, 79); text-transform: none; line-height: 1.2; text-indent: 0px; letter-spacing: normal; font-family: Georgia," times=""><span style="font-size:14px;"><span style="color:#0000ff;">$text1 = $text[0][&quot;text&quot;];</span></span></span></font></p>
	<hr />
</div>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="color:#000000;">Таблица&nbsp;<span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">articles представляет собой 3 столбца (id,name,text).</span></span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="color:#000000;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Id -&nbsp; номер статьи (<span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">автоинкремент</span>)</span></span></span></span></p>
<p class="para" fira="" sans="" source="">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="color:#000000;">Name - название статьи</span></span></span></p>
<p class="para" fira="" sans="" source="">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="color:#000000;">Text - текст самой статьи</span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="color:#000000;">В результате выполнения данного примера мы получили двумерный массив $text[i][colname].</span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="color:#000000;">Обращаться к конкретной строке мы можем по номеру строки в массиве(i), а к столбцу в строке по имени столбца в базе данных(colname).</span></span></span></p>
<p class="para" fira="" sans="" source="" style="color: rgb(51, 51, 51); font-family: ">
	<br />
	&nbsp;</p>
','Выполнение и обработка запросов MySQL');
INSERT INTO portal.articles (text,name) VALUES ('<table border="1" cellpadding="0" cellspacing="0" style="width: 600px;" width="98%">
	<thead>
		<tr>
			<th style="width: 30%; background-color: rgb(0, 204, 0);">
				<p>
					<strong>ООП-интерфейс</strong></p>
			</th>
			<th style="width: 30%; background-color: rgb(0, 204, 0);">
				<p>
					<strong>Процедурный интерфейс</strong></p>
			</th>
			<th style="width: 40%; background-color: rgb(0, 204, 0);">
				<p>
					<strong>Описание</strong></p>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="3" style="background-color: rgb(255, 255, 0);">
				<p>
					<strong><span style="font-size:14px;"><em>Свойства</em></span></strong></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.current-field.php">$mysqli_result::current_field</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.current-field.php">mysqli_field_tell()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Получить смещение указателя на результат для текущего поля</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.field-count.php">$mysqli_result::field_count</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.field-count.php">mysqli_num_fields()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Получить количество полей в результате</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.lengths.php">$mysqli_result::lengths</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.lengths.php">mysqli_fetch_lengths()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Возвращает длины столбцов текущей строки в наборе результатов</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.num-rows.php">$mysqli_result::num_rows</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.num-rows.php">mysqli_num_rows()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Получает число строк в результате</span></span></p>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="background-color: rgb(255, 255, 0);">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><strong><span style="font-size:14px;"><em>Методы</em></span></strong></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.data-seek.php">mysqli_result::data_seek()</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.data-seek.php">mysqli_data_seek()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Устанавливает указатель результата на произвольную строку в результате</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-all.php">mysqli_result::fetch_all()</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-all.php">mysqli_fetch_all()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Получает все результирующие строки и возвращает массив со строками в виде ассоциативного массива и/или нумерованного массива. Доступно только с расширением <a href="https://www.php.net/manual/ru/book.mysqlnd.php">mysqlnd</a>.</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-array.php">mysqli_result::fetch_array()</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-array.php">mysqli_fetch_array()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Получает результирующую строку в виде ассоциативного массива и/или нумерованного массива</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-assoc.php">mysqli_result::fetch_assoc()</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-assoc.php">mysqli_fetch_assoc()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Получает результирующую строку в виде ассоциативного массива</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-field-direct.php">mysqli_result::fetch_field_direct()</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-field-direct.php">mysqli_fetch_field_direct()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Получает метаданные для одного поля</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-field.php">mysqli_result::fetch_field()</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-field.php">mysqli_fetch_field()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Возвращает из результата следующее поле</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-fields.php">mysqli_result::fetch_fields()</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-fields.php">mysqli_fetch_fields()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Возвращает массив объектов из полей результата</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-object.php">mysqli_result::fetch_object()</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-object.php">mysqli_fetch_object()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Возвращает текущую строку результата в виде объекта</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-row.php">mysqli_result::fetch_row()</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.fetch-row.php">mysqli_fetch_row()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Получает строку результата как нумерованный массив</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.field-seek.php">mysqli_result::field_seek()</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.field-seek.php">mysqli_field_seek()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Устанавливает смещение указателя результата на определенное поле</span></span></p>
			</td>
		</tr>
		<tr>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.free.php">mysqli_result::free()</a>, <a href="https://www.php.net/manual/ru/mysqli-result.free.php">mysqli_result::close</a>, <a href="https://www.php.net/manual/ru/mysqli-result.free.php">mysqli_result::free_result</a></span></span></p>
			</td>
			<td>
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><a href="https://www.php.net/manual/ru/mysqli-result.free.php">mysqli_free_result()</a></span></span></p>
			</td>
			<td style="width:34.92%;">
				<p>
					<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Освобождает память, связанную с результатом</span></span></p>
			</td>
		</tr>
	</tbody>
</table>
<p>
	&nbsp;</p>
','Функции для обработки запросов');
INSERT INTO portal.articles (text,name) VALUES ('<div>
	<span style="color:#008000;"><strong><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Подключение к базе данных:</span></span></strong></span></div>
<div>
	<div>
		<hr />
		<p>
			<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><!--?php</span--></span></span></p>
		<p>
			<span style="color:#0000ff;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><!--?php</span--></span></span></span></p>
		<p>
			<span style="color:#0000ff;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">define (&quot;db_host&quot;,&quot;localhost&quot;);<br />
			define (&quot;db_name&quot;,&quot;portal&quot;);<br />
			define (&quot;db_user&quot;,&quot;root&quot;);<br />
			define (&quot;db_pass&quot;,&quot;********&quot;);</span></span></span></p>
	</div>
	<div>
		<p>
			<span style="color:#0000ff;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">$lin=mysqli_connect(db_host,db_user,db_pass) or die (&quot;Нет соединения с сервером&quot;);<br />
			mysqli_select_db ($lin,db_name) or die (&quot;Нет соединения с БД&quot;);<br />
			//mysqli_query($lin,&quot;set names &#39;utf8&#39;&quot;) or die(&quot;Не удалось установить кодировку соединения&quot;);<br />
			mysqli_set_charset($lin, &quot;utf8&quot;);&nbsp;</span></span></span></p>
		<p>
			<span style="color:#0000ff;"><span style="font-size:14px;">?&gt;</span></span></p>
		<hr />
		<p>
			<span style="color:#008000;"><strong><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Вид таблицы articles в базе portal:</span></span></strong></span></p>
		<table border="1" cellpadding="1" cellspacing="0" style="width: 500px;">
			<tbody>
				<tr>
					<td style="background-color: rgb(0, 204, 0);">
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Название столбца</span></span></td>
					<td style="background-color: rgb(0, 204, 0);">
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Тип данных</span></span></td>
					<td style="background-color: rgb(0, 204, 0);">
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Описание</span></span></td>
				</tr>
				<tr>
					<td style="background-color: rgb(255, 255, 0);">
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">id</span></span></td>
					<td>
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">int</span></span></td>
					<td>
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Номер статьи в базе данных. Обладает свойством Auto Increment(автоматически увеличивается на 1 при добавлении новой записи).</span></span></td>
				</tr>
				<tr>
					<td style="background-color: rgb(255, 255, 0);">
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">text</span></span></td>
					<td>
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">TEXT</span></span></td>
					<td>
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Текст самой статьи</span></span></td>
				</tr>
				<tr>
					<td style="background-color: rgb(255, 255, 0);">
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">name</span></span></td>
					<td>
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">varchar(100)</span></span></td>
					<td>
						<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Название статьи длинной максимум 100 символов</span></span></td>
				</tr>
			</tbody>
		</table>
	</div>
	<p>
		<span style="color:#000000;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Срипт создания таблицы articles в базе portal:</span></span></span></p>
	<hr />
	<p>
		<span style="color:#ff0000;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">CREATE TABLE portal.articles (<br />
		&nbsp; id int(11) NOT NULL AUTO_INCREMENT,<br />
		&nbsp; text text NOT NULL,<br />
		&nbsp; name varchar(100) NOT NULL,<br />
		&nbsp; PRIMARY KEY (id)<br />
		);</span></span></span></p>
	<hr />
	<p>
		<span style="color:#000000;"><strong><em><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Здесь приведены пользовательские функции PHP для обновления, добавления и удаления инофрмации, используемые в этом сайте.</span></span></span></em></strong></span></p>
</div>
<div>
	<strong><span style="color:#008000;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">1) Функция обновления данных</span></span></span></strong></div>
<div>
	<hr />
	<p>
		<span style="color:#0000ff;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">function update($txt,$id,$name){</span><br style="color: rgb(34, 34, 34); font-family: Arial,Verdana,sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;" />
		<span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">&nbsp;global $lin;</span><br style="color: rgb(34, 34, 34); font-family: Arial,Verdana,sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;" />
		<span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">&nbsp;$query = &quot;UPDATE portal.articles SET text=&#39;&quot;.$txt.&quot;&#39;, name=&#39;&quot;.$name.&quot;&#39; WHERE id=&quot;.$id;</span><br style="color: rgb(34, 34, 34); font-family: Arial,Verdana,sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;" />
		<span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">&nbsp;mysqli_query($lin,$query);</span><br style="color: rgb(34, 34, 34); font-family: Arial,Verdana,sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;" />
		<span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">}</span></span></span></span></p>
	<hr />
	<p>
		<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Запрос: <span style="color:#ff0000;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">UPDATE portal.articles SET text=&#39;$txt&#39;, name=&#39;$name&#39; WHERE id=$id;</span></span></span></span></p>
</div>
<div>
	<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Параметры функции:</span></span></div>
<div>
	<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">$txt - новый текст статьи</span></span></span></div>
<div>
	<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">$id - номер сатьи в базе данных для его обновления</span></span></span></div>
<div>
	<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">$name - новое название статьи</span></span></span></span></div>
<div>
	&nbsp;</div>
<div>
	<strong><span style="color:#008000;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">2) Функция добавления данных</span></span></span></strong></div>
<div>
	<hr />
	<span style="color:#0000ff;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">function add($txt,$name){<br />
	&nbsp;global $lin;<br />
	&nbsp;$query = &quot;INSERT INTO portal.articles (text,name) VALUES (&#39;&quot;.$txt.&quot;&#39;,&#39;&quot;.$name.&quot;&#39;)&quot;;<br />
	&nbsp;mysqli_query($lin,$query);<br />
	}</span></span></span>
	<hr />
	<p>
		<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Запрос:&nbsp;<span style="color:#ff0000;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">INSERT INTO portal.articles (text,name) VALUES (&#39;$txt&#39;,&#39;$name&#39;);</span></span></span></span></p>
	<p>
		<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Параметры функции</span></span></p>
	<div style="color: rgb(34, 34, 34); font-family: Arial,Verdana,sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
		<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">$txt - текст новой статьи</span></span></span></div>
	<div style="color: rgb(34, 34, 34); font-family: Arial,Verdana,sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
		<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">$name - название новой статьи</span></span></span></span></div>
	<p>
		<strong><span style="color:#008000;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">3) Функция удаления данных</span></span></span></strong></p>
</div>
<div>
	<hr />
	<span style="color:#0000ff;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">function del($id){<br />
	&nbsp;global $lin;<br />
	&nbsp;$query = &quot;DELETE FROM portal.articles WHERE id=&quot;.$id;<br />
	&nbsp;mysqli_query($lin,$query);<br />
	}</span></span></span>
	<hr />
	<p>
		<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Запрос:&nbsp;<span style="color:#ff0000;"><span style="text-align: left; text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline !important; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">DELETE FROM portal.articles WHERE id=$id;</span></span></span></span></p>
</div>
<div style="color: rgb(34, 34, 34); font-family: Arial,Verdana,sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Параметры функции:</span></span></div>
<div style="color: rgb(34, 34, 34); font-family: Arial,Verdana,sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">
	<span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="text-align: left; color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; display: inline; white-space: normal; orphans: 2; float: none; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">$id - номер сатьи в базе данных для удаления</span></span></span></div>
<p>
	&nbsp;</p>
','Основные SQL команды и работа с ними');