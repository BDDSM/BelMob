&НаКлиенте
Процедура ВвестиГолосом(Команда)
	#Если МобильноеПриложениеКлиент Тогда
	НовВз = Новый ЗапускПриложенияМобильногоУстройства("android.speech.action.RECOGNIZE_SPEECH");
	
	Если НовВз.Запустить(Истина) = 0 Тогда
		Сообщить("Не поддерживается на вашем устройстве!");
	Иначе
		Объект.Комментарий = НовВз.ДополнительныеДанные.Получить("query").Значение;
	КонецЕсли;
	#КонецЕсли
КонецПроцедуры

&НаКлиенте
Процедура Очистить(Команда)
	Объект.Комментарий = "";
КонецПроцедуры

&НаКлиенте
Процедура ИмуществоПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
	Отказ = Истина;
	ОпЗакрытия = Новый ОписаниеОповещения("ПриЗакрытииСозданияСтроки",ЭтаФорма,Истина);
	ОткрытьФорму("Документ.уи_ИнвентаризацияИмущества.Форма.ФормаСтроки",,,,,,ОпЗакрытия);
КонецПроцедуры

&НаКлиенте
Процедура ПриЗакрытииСозданияСтроки(Результат, Параметр) Экспорт
	
	Если НЕ ЗначениеЗаполнено(Результат) Тогда Возврат КонецЕсли;
	
	Нов = Объект.Имущество.Добавить();
	ЗаполнитьЗначенияСвойств(Нов, Результат);
КонецПроцедуры

&НаКлиенте
Процедура ИмуществоПередНачаломИзменения(Элемент, Отказ)
	Отказ = Истина;
	Структура = Новый Структура("UID, Имущество, НаличиеФактическое");
	ЗаполнитьЗначенияСвойств(Структура, Элементы.Имущество.ТекущиеДанные);

	ОпЗакрытия = Новый ОписаниеОповещения("ПриЗакрытииРедактированияСтроки",ЭтаФорма,Истина);
	ОткрытьФорму("Документ.уи_ИнвентаризацияИмущества.Форма.ФормаСтроки",Новый Структура("Входящие", Структура),,,,,ОпЗакрытия);
КонецПроцедуры

&НаКлиенте
Процедура ПриЗакрытииРедактированияСтроки(Результат, Параметр) Экспорт
	
	Если НЕ ЗначениеЗаполнено(Результат) Тогда Возврат КонецЕсли;
	
	Нов = Элементы.Имущество.ТекущиеДанные;
	ЗаполнитьЗначенияСвойств(Нов, Результат);
КонецПроцедуры
