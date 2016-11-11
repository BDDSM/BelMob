
&НаКлиенте
Процедура ПроверитьСоединение(Команда)
	Попытка
		
		Элементы.ПроверитьСоединение.Видимость = Ложь;
		Элементы.АнимацияОбновления.Видимость = Истина;
		Элементы.ДекорацияПодключение.Видимость = Истина;
		Элементы.ДекорациСоединениеУспешно.Видимость = Ложь;
		Элементы.ДекорацияРазрывСоединения.Видимость = Ложь;
		Элементы.ДекорацияПодключение.Заголовок = "Подключаемся к серверу";
		Элементы.ОтправитьОшибкуРазработчику.Видимость = Ложь;
		
		СоедниненияСБазой.ПроверкаПодключения();
		
		Элементы.ПроверитьСоединение.Видимость = Истина;
		Элементы.АнимацияОбновления.Видимость = Ложь;
		Элементы.ДекорацияПодключение.Видимость = Истина;
		Элементы.ДекорациСоединениеУспешно.Видимость = Истина;
		Элементы.ДекорацияПодключение.Заголовок = "Подключение к серверу успешно";
		
		ЭтаФорма.Закрыть();
	Исключение
		
		Элементы.ПроверитьСоединение.Видимость = Истина;
		Элементы.АнимацияОбновления.Видимость = Ложь;
		Элементы.ДекорацияПодключение.Видимость = Истина;
		Элементы.ДекорациСоединениеУспешно.Видимость = Ложь;
		Элементы.ДекорацияРазрывСоединения.Видимость = Истина;
		
		Элементы.ДекорацияПодключение.Заголовок = 
			"Ошибка подключения:
			|" + ОписаниеОшибки();
		Элементы.ОтправитьОшибкуРазработчику.Видимость = Истина;	
		
	КонецПопытки;
КонецПроцедуры

&НаКлиенте
Процедура ПриИзмененииПодключений(Элемент)
	ПриИзмененииПодключенийФрагмент();

	ОбновитьПовторноИспользуемыеЗначения();
КонецПроцедуры

&НаСервере
Процедура ПриИзмененииПодключенийФрагмент()
	
	ДанныеПодключения = РеквизитФормыВЗначение("НаборКонстант");
	ДанныеПодключения.Записать();
	ЗначениеВРеквизитФормы(ДанныеПодключения, "НаборКонстант");
	Модифицированность = Ложь;

	
КонецПроцедуры


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Набор = Константы.СоздатьНабор();
	Набор.Прочитать();
	ЗначениеВРеквизитФормы(Набор, "НаборКонстант");
КонецПроцедуры


&НаКлиенте
Процедура ПарольНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	Элементы.Пароль.РежимПароля = НЕ Элементы.Пароль.РежимПароля;
КонецПроцедуры

&НаКлиенте
Процедура ОтправитьОшибкуРазработчикуНажатие(Элемент)
	ЗапуститьПриложение("mailto:Lex@dineva.net?subject=" + "Ошибка подключения" + "&body=" + Элементы.ДекорацияПодключение.Заголовок);
КонецПроцедуры
