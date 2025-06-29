﻿#language: ru


@tree

Функционал: полная проверка документа РасходТовара

Как Тестировщик я хочу
проверить заполнение, проведение и движение документа Расход товара
чтобы проверить функционал документа   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	
Сценарий: Создание Продажи Товара
        И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
    * Создание документа Продажа Товара
        Когда открылось окно "Продажи товара"
        И я нажимаю на кнопку с именем 'ФормаСоздать'
        Тогда открылось окно "Продажа товара (создание)"

    * Проверка доступности Валюты взаиморасчетов в зависимости от выбранной организации	
        И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
        И элемент формы "Валюта взиморасчетов" отсутствует на форме
        И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
        И элемент формы "Валюта взиморасчетов" присутствует на форме
        
    * Проверка заполнения Вида цен    
        И из выпадающего списка с именем 'Покупатель' я выбираю точное значение 'Корнет ЗАО'
        Тогда элемент формы с именем 'ВидЦен' стал равен "Закупочная"       
        И из выпадающего списка с именем 'Покупатель' я выбираю точное значение 'Магазин "Бытовая техника"'
        Тогда элемент формы с именем 'ВидЦен' стал равен "Мелкооптовая"       
        И из выпадающего списка с именем 'Покупатель' я выбираю точное значение 'Магазин "Продукты"'
        Тогда элемент формы с именем 'ВидЦен' стал равен "Оптовая"       
        И из выпадающего списка с именем 'Покупатель' я выбираю точное значение 'ЭлектроБыт ЗАО'
        Тогда элемент формы с именем 'ВидЦен' стал равен "Розничная" 

    * Заполнение шапки документа
        Когда открылось окно "Продажа товара (создание) *"
        И из выпадающего списка с именем 'Организация' я выбираю точное значение 'ООО "Товары"'
        Когда открылось окно "Продажа товара (создание) *"
        И я нажимаю кнопку выбора у поля с именем 'Покупатель'
        Тогда открылось окно "Контрагенты"
        И в таблице 'Список' я перехожу к строке:
        	| "Код"       | "Наименование" |
        	| "000000012" | "Мосхлеб ОАО"  |
        Когда открылось окно "Контрагенты"
        И я нажимаю на кнопку с именем 'ФормаВыбрать'
        
        Тогда элемент формы с именем 'ВидЦен' стал равен "Оптовая"
        И из выпадающего списка с именем 'Склад' я выбираю точное значение "Большой"
        И элемент формы "Валюта взиморасчетов" присутствует на форме
        И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"

    * Заполнение табличной части
    //Добавление товара по кнопке Добавить
        Когда открылось окно "Продажа товара (создание) *"
        И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
        И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
        Тогда открылось окно "Товары"
        И в таблице 'Список' я перехожу к строке:
            | "Код"       | "Наименование" |
            | "000000011" | "Продукты"     |
        И в таблице 'Список' я выбираю текущую строку
        И в таблице 'Список' я перехожу к строке:
            | "Артикул" | "Код"       | "Наименование" |
            | "Kol67"   | "000000030" | "Колбаса"      |
        И в таблице 'Список' я выбираю текущую строку   
        И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "250,00"  
        И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "10,00"  
    //Добавление товара по кнопке Подбор    
        Когда открылось окно "Продажа товара (создание) *"
        И в таблице 'Товары' я нажимаю на кнопку с именем 'КомандаПодбор'
        Тогда открылось окно "Подбор товара"
        И в таблице 'ДеревоТоваров' я разворачиваю текущую строку
        И в таблице 'ДеревоТоваров' я перехожу к строке:
            | "Наименование" |
            | "Продукты"     |
        И в таблице 'ДеревоТоваров' я разворачиваю текущую строку
        И в таблице 'СписокТоваров' я перехожу к строке:
            | "Код"       | "Наименование" | "Цена"  |
            | "000000029" | "Хлеб"         | "20,00" |
        И в таблице 'СписокТоваров' я выбираю текущую строку
        И я нажимаю на кнопку с именем 'ОК'    
        И в таблице 'Товары' я перехожу к строке:
            | 'N' | 'Товар' | 'Цена'  | 'Количество' | 'Сумма' |
            | '2' | 'Хлеб'  | '20,00' | '1,00'       | '20,00' |
        И в таблице 'Товары' я выбираю текущую строку 
        И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "15,00"
        И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "15,00"
        И в таблице 'Товары' я завершаю редактирование строки 
    
    * Проверка итогового количества и итоговой суммы
        И таблица 'Товары' стала равной:
            | 'N' | 'Товар'   | 'Цена'   | 'Количество' | 'Сумма'    |
            | '1' | 'Колбаса' | '250,00' | '10,00'      | '2 500,00' |
            | '2' | 'Хлеб'    | '15,00'  | '15,00'      | '225,00'   |
        И элемент формы с именем 'ТоварыИтогКоличество' стал равен "25"
        И элемент формы с именем 'ТоварыИтогСумма' стал равен "2 725"

    * Проверка заполнения вкладки Прочее
        Когда открылось окно "Продажа товара (создание) *"
        И я перехожу к закладке с именем 'Прочее'
        И в поле с именем 'ОбоснованиеОтгрузки' я ввожу текст "Обоснование отгрузки"
    
    * Проведение документа и проверка присвоения номера и даты
        И я нажимаю на кнопку с именем 'ФормаЗаписать'
        И поле "Дата" заполнено
        И я запоминаю значение поля "Номер" как "$$НомерДокумента$$"
        И я нажимаю на кнопку с именем 'ФормаПровестиИзакрыть'
        И таблица "Список" содержит строки:
            | 'Номер'              |
            | '$$НомерДокумента$$' |
                    
    * Открытие созданного документа 
        И в таблице "Список" я перехожу к строке:
            | 'Номер'              |
            | '$$НомерДокумента$$' |
        И в таблице "Список" я выбираю текущую строку 
        И я закрываю текущее окно
        И я закрываю все окна клиентского приложения 
        

Сценарий: Проверка движений по регистрам
        И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
        И в таблице "Список" я перехожу к строке:
            | 'Номер'              |
            | '$$НомерДокумента$$' |
        И в таблице "Список" я выбираю текущую строку 
        И я запоминаю значение поля "Дата" как "Период"	
        И я запоминаю заголовок формы в переменную "Регистратор"	

    * Проверка движений по регистру взаиморасчетов с контрагентами
        И В текущем окне я нажимаю кнопку командного интерфейса "Регистр взаиморасчетов с контрагентами"
        Тогда таблица 'Список' стала равной:
            | 'Период'   | 'Регистратор'   | 'Номер строки' | 'Контрагент'  | 'Сумма'    | 'Валюта' |
            | '$Период$' | '$Регистратор$' | '1'            | 'Мосхлеб ОАО' | '2 725,00' | 'Рубли'  |

    * Проверка движений в регистре продаж    
        И В текущем окне я нажимаю кнопку командного интерфейса "Регистр продаж"
        Тогда таблица 'Список' стала равной:
            | 'Период'   | 'Регистратор'   | 'Номер строки' | 'Покупатель'  | 'Товар'   | 'Количество' | 'Сумма'    |
            | '$Период$' | '$Регистратор$' | '1'            | 'Мосхлеб ОАО' | 'Колбаса' | '10,00'      | '2 500,00' |
            | '$Период$' | '$Регистратор$' | '2'            | 'Мосхлеб ОАО' | 'Хлеб'    | '15,00'      | '225,00'   |
        
    * Проверка движений по регистру товарных запасов            
        И В текущем окне я нажимаю кнопку командного интерфейса "Регистр товарных запасов"
        Тогда таблица 'Список' стала равной:
            | 'Период'   | 'Склад'   | 'Регистратор'   | 'Номер строки' | 'Товар'   | 'Количество' |
            | '$Период$' | 'Большой' | '$Регистратор$' | '1'            | 'Колбаса' | '10,00'      |
            | '$Период$' | 'Большой' | '$Регистратор$' | '2'            | 'Хлеб'    | '15,00'      |
        И я закрываю текущее окно
        И я закрываю все окна клиентского приложения 

Сценарий: Проверка печатной формы
        И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
        И в таблице "Список" я перехожу к строке:
            | 'Номер'              |
            | '$$НомерДокумента$$' |
        И в таблице "Список" я выбираю текущую строку 
        И я запоминаю значение поля "Номер" как "НомерДокумента"
        И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
        И я жду когда в табличном документе "SpreadsheetDocument" заполнится ячейка "R7C3" в течение 20 секунд  
        И я закрываю все окна клиентского приложения 

Сценарий: Проверка Создать на основании (создание Поступления денег)
        И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
        И в таблице "Список" я перехожу к строке:
            | 'Номер'              |
            | '$$НомерДокумента$$' |
        И в таблице "Список" я выбираю текущую строку 
        И я нажимаю на кнопку с именем 'ФормаДокументПоступлениеДенегСоздатьНаОсновании'
        Тогда открылось окно "Поступление денег (создание)"
        И из выпадающего списка с именем 'РасчетныйСчетПокупателя' я выбираю точное значение "Основной"
        И из выпадающего списка с именем 'РасчетныйСчет' я выбираю точное значение "Вспомогательный"
        И в поле с именем 'Сумма' я ввожу текст "2 725,00"
        И я нажимаю на кнопку с именем 'ФормаПровести'
        Тогда открылось окно "Поступление денег * от *"
        И не появилось окно предупреждения системы    
        И я запоминаю значение поля "Номер" как "НомерДокументаПоступленияДенег"
        И элемент формы с именем 'Номер' стал равен "$НомерДокументаПоступленияДенег$"
    //Проверка наличия созданного документа в Поступлении денег
        И Я открываю навигационную ссылку "e1cib/list/Документ.ПоступлениеДенег"
        И таблица "Список" содержит строки:
            | 'Номер'                            |
            | '$НомерДокументаПоступленияДенег$' |
        И я закрываю текущее окно 
        И я закрываю все окна клиентского приложения 

Сценарий: Проверка Остатки по складу
        И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
        И в таблице "Список" я перехожу к строке:
            | 'Номер'              |
            | '$$НомерДокумента$$' |
        И в таблице "Список" я выбираю текущую строку 
        И я нажимаю на кнопку с именем 'ОстаткиПоСкладу'
        Тогда открылось окно "Остатки товаров (Установлен дополнительный отбор)"
        И я нажимаю на кнопку с именем 'ФормаСформировать'
    //Остатки по складу сформировались
        И я закрываю текущее окно 
        И я закрываю все окна клиентского приложения 

//Документ полностью проверен