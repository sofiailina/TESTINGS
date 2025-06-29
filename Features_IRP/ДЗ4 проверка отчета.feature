﻿#language: ru

@tree

Функционал: отображение возвратов в отчете D2001 Продажи.

Как Тестировщик я хочу
проверить отображение возвратов в отчете
чтобы отчет работал корректно

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: отображение возвратов в отчете D2001 Продажи.
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Отчеты" "D2001 Продажи"
	Тогда открылось окно "D2001 Продажи"
	И я нажимаю на кнопку с именем 'FormGenerate'
	Когда открылось окно "D2001 Продажи"
    И я жду когда в табличном документе "Result" заполнится ячейка "R19C3" в течение 20 секунд    
    И в табличном документе 'Result' ячейка с адресом 'R19C3' равна '2 678,00'
    Тогда табличный документ 'Result' равен:
    	| 'Параметры:'               | 'Период: 01.06.2025 - 30.06.2025'                                   | ''         | ''                  | ''             |
    	| 'Отбор:'                   | 'Вид мультивалютной аналитики Равно "en наименование не заполнено"' | ''         | ''                  | ''             |
    	| ''                         | ''                                                                  | ''         | ''                  | ''             |
    	| 'Период, месяц'            | 'Итого'                                                             | ''         | ''                  | ''             |
    	| 'Номенклатура'             | ''                                                                  | ''         | ''                  | ''             |
    	| 'Характеристика'           | 'Количество'                                                        | 'Сумма'    | 'Сумма без налогов' | 'Сумма скидки' |
    	| 'Февраль 2021'             | '14,000'                                                            | '3 358,00' | '2 798,33'          | ''             |
    	| 'Товар с характеристиками' | '12,000'                                                            | '2 418,00' | '2 015,00'          | ''             |
    	| 'S/Красный'                | '10,000'                                                            | '1 938,00' | '1 615,00'          | ''             |
    	| 'XS/Черный'                | '2,000'                                                             | '480,00'   | '400,00'            | ''             |
    	| 'Товар без характеристик'  | '2,000'                                                             | '940,00'   | '783,33'            | ''             |
    	| 'Товар без характеристик'  | '2,000'                                                             | '940,00'   | '783,33'            | ''             |
    	| 'Март 2021'                | '-2,000'                                                            | '-680,00'  | '-566,66'           | ''             |
    	| 'Товар с характеристиками' | '-1,000'                                                            | '-190,00'  | '-158,33'           | ''             |
    	| 'S/Красный'                | '-1,000'                                                            | '-190,00'  | '-158,33'           | ''             |
    	| 'Товар без характеристик'  | '-1,000'                                                            | '-490,00'  | '-408,33'           | ''             |
    	| 'Товар без характеристик'  | '-1,000'                                                            | '-490,00'  | '-408,33'           | ''             |
    	| 'Итого'                    | '12,000'                                                            | '2 678,00' | '2 231,67'          | ''             |
    
    	