/*
    Задание 1
    Опишите модель данных, которая может лежать в основе данного приложения.
    Ожидаемый результат: ER диаграмма с пояснениями о выборе сущностей и типов данных их атрибутов. 
    Используйте реляционную СУБД.
*/

-- Таблица заявок

CREATE TABLE Applications( 
	id INT AUTO_INCREMENT PRIMARY KEY, 
	person_id INT NOT NULL, 
    params_id INT NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person(id),
    FOREIGN KEY (id) REFERENCES Params(id)
	);


-- Таблица с паспортами

CREATE TABLE Passport( 
	id INT AUTO_INCREMENT PRIMARY KEY, 
	series INT NOT NULL, 
	number INT NOT NULL, 
	issue_date DATE NOT NULL, 
	issuing_office VARCHAR(100) NOT NULL, 
	office_code VARCHAR(7) NOT NULL, 
	b_day DATE NOT NULL, 
	region VARCHAR(100) NOT NULL 
	);


-- Таблица с местом работы

CREATE TABLE Workplace(
    id INT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    inn INT NOT NULL,
    salary INT NOT NULL,
    start_date DATE NOT NULL
    );


-- Таблица с личными данными 

CREATE TABLE Person(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    second_name VARCHAR(30) NOT NULL,
    father_name VARCHAR(30),
    phone_number INT NOT NULL,
    add_phone_number INT,
    email VARCHAR(100),
    passport_id INT UNIQUE,
    workplace_id INT UNIQUE,
    FOREIGN KEY (passport_id) REFERENCES Passport(id),
    FOREIGN KEY (workplace_id) REFERENCES Workplace(id)
    );


-- Параметры заявки на займ

CREATE TABLE Params(
	id INT AUTO_INCREMENT PRIMARY KEY,
	product_type enum('cash', 'bank transfer', 'crypto') NOT NULL,  
    goal enum('treatment', 'education', 'purchase of goods/services', 'auto credit') NOT NULL,
    credit_sum INT NOT NULL,
    credit_rate FLOAT NOT NULL,
    credit_period INT NOT NULL,
    extra_services SET('life insurance', 'legal assistance'),
    result_sum INT NOT NULL
    );


INSERT INTO Passport (series, number, issue_date, issuing_office, office_code, b_day, region)
VALUES ('2222123123', '2021-01-11', 'ГУ МВД', '111-666', '1900-01-01', 'Московская облатсь');

INSERT INTO Workplace (region, name, job_title, inn, salary, start_date)
VALUES ('Московская область', 'ООО "ПЕТУШОК"', 'Менеджер', 192123, 100000, '2020-02-04');

INSERT INTO Person (first_name, second_name, father_name, phone_number, email, passport_id, workplace_id)
VALUES ('Ivan', 'Ivanov', 'Ivanovich', '111', 'abc@mail.ru', 10, 10);

INSERT INTO Params (product_type, goal, credit_sum, credit_rate, credit_period, extra_services, result_sum)
VALUES ('cash', 'auto credit', 100000, 7.7, 10, 'life insurance', 115000);

INSERT INTO Applications (person_id, params_id)
VALUES (10, 10);

/*

	Задание 2
	Напишите SQL-запрос, который бы возвращал самый популярный вид продукта за текущий год.
	Ожидаемый результат: SQL-запрос, который основывается на модели данных из задания 1, 
	и название СУБД, для которой был написан SQL-запрос.

*/

SELECT product_type, COUNT(*) applications_in_2022
FROM Applications
JOIN PARAMS DESCRITION USING(id)
WHERE YEAR(date) = 2022
GROUP BY product_type
ORDER BY applications_in_2022 DESC
LIMIT 1;














