﻿#language: ru



Функционал: создание документа Поступления товаров

Как Менеджер по закупкам я хочу
создание документов поступления товаров
чтобы поставить товар на учет

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий


Сценарий: создание документа поступления товаров
// Создание док 
* Открытие формы создание документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Закупки" "Поступления товаров"
	Тогда открылось окно "Поступления товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Поступление товара (создание)"
* Заполнение шапки документа
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"1000 мелочей\""
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Склад отдела продаж"
	И из выпадающего списка с именем 'Поставщик' я выбираю точное значение "Магазин \"Бытовая техника\""
* Заполнение ТЧ документа
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю по строке "а"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "1,00"
	И в таблице 'Товары' я завершаю редактирование строки
*Проверка заполнения ТЧ
	Тогда таблица 'Список' содержит строки:
		| 'Дата'                      | 'Поставщик'                 | 'Склад'               | 'Организация'        | 'Валюта взаиморасчетов' |
		| 'Животноводство ООО '       | ''                          | ''                    | ''                   | ''                      |
		| 'Корнет ЗАО'                | ''                          | ''                    | ''                   | ''                      |
		| 'Магазин "Бытовая техника"' | ''                          | ''                    | ''                   | ''                      |
		| '23.05.2025 18:05:55'       | 'Магазин "Бытовая техника"' | 'Склад отдела продаж' | 'ООО "1000 мелочей"' | ''                      |
		| '23.05.2025 18:20:51'       | 'Магазин "Бытовая техника"' | 'Склад отдела продаж' | 'ООО "1000 мелочей"' | ''                      |
		| '23.05.2025 18:26:32'       | 'Магазин "Бытовая техника"' | 'Склад отдела продаж' | 'ООО "1000 мелочей"' | ''                      |
		| '23.05.2025 18:31:15'       | 'Магазин "Бытовая техника"' | 'Склад отдела продаж' | 'ООО "1000 мелочей"' | ''                      |
		| '23.05.2025 18:31:43'       | 'Магазин "Бытовая техника"' | 'Склад отдела продаж' | 'ООО "1000 мелочей"' | ''                      |
		| 'Магазин "Продукты"'        | ''                          | ''                    | ''                   | ''                      |
		| 'Мосхлеб ОАО'               | ''                          | ''                    | ''                   | ''                      |
		| 'Пантера АО'                | ''                          | ''                    | ''                   | ''                      |
		| 'Скороход АО'               | ''                          | ''                    | ''                   | ''                      |
		| 'Шлюзовая ООО'              | ''                          | ''                    | ''                   | ''                      |
		| 'ЭлектроБыт ЗАО'            | ''                          | ''                    | ''                   | ''                      |
	
		
	И я нажимаю на кнопку 'Записать'
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Поступление товара (создание) *" в течение 20 секунд
*Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'  |
	 



Сценарий: проверка наличия справочника номенклатуры торт
	И В командном интерфейсе я выбираю "Продажи" "Товары"
	Тогда открылось окно "Товары"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Торт'  |