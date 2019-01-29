TRUNCATE new_big.account CASCADE;
ALTER SEQUENCE IF EXISTS new_big.account_account_id_seq RESTART;
INSERT INTO  new_big.account(login, password, time_register, is_approved)
SELECT
	'user_'||(RANDOM()*1000000)||'_'||TRUNC(1800 + RANDOM()*100)||'@temp.tm',
	md5('p'||random()) ,
	date(now() - trunc(random()  * 365) * '1 day'::interval),
	CASE WHEN (random()>0.01) THEN TRUE ELSE FALSE END

FROM generate_series(1,3000000) --<--
ON CONFLICT DO NOTHING;
------------------------------------------------------------------------------------------------------------------------

TRUNCATE new_big.company CASCADE;
ALTER SEQUENCE IF EXISTS new_big.company_company_id_seq RESTART;
INSERT INTO  new_big.company(name, description, path_to_logo)
SELECT
	'company_'||(TRUNC(1 + RANDOM()*100000))||'_'||TRUNC(1900 + RANDOM()*118),
	temp_data.randomstr(TRUNC(20 + RANDOM()*1000)::INTEGER),
	'/parh/to/logo/'||(TRUNC(1 + RANDOM()*10000))||'.jpg'
FROM generate_series(1,1000000); --<--

------------------------------------------------------------------------------------------------------------------------

TRUNCATE new_big.acc_to_comp_permission;
ALTER SEQUENCE IF EXISTS new_big.acc_to_comp_permission_acc_to_comp_permission_id_seq RESTART;
INSERT INTO new_big.acc_to_comp_permission(name, description)
VALUES
    ('Создатель',           'Главный победитель и ROOT по жизни'),
    ('Администратор',       'Смотрящий без права просмотра откликов'),
    ('HR',                  'Человек, рулящий вакансиями в организации'),
    ('Младший помошник HR', 'Просмотр откликов без возможности редактирования');

------------------------------------------------------------------------------------------------------------------------
TRUNCATE new_big.skill;
ALTER SEQUENCE IF EXISTS new_big.skill_skill_id_seq RESTART;
INSERT INTO new_big.skill(name)
VALUES
    ('2 высших профильных образования'),
    ('английский intermediate'),
    ('опыт работы в высоконагруженных системах'),
    ('3 высших профильных образования'),
    ('английский godlike'),
    ('опыт работы в аду'),
    ('установка windows всех версий'),
    ('заправка картриджей'),
    ('настройка программ'),
    ('Программирование, Разработка'),
    ('Информационные технологии'),
    ('Интернет'),
    ('Мультимедиа'),
    ('телеком'),
    ('Компьютерная безопасность'),
    ('Сетевые технологии'),
    ('Телекоммуникации'),
    ('Поддержка'),
    ('Helpdesk'),
    ('Работа в SONY VEGAS 7'),
    ('Производство'),
    ('Технологии успеха'),
    ('Технологии');

------------------------------------------------------------------------------------------------------------------------

TRUNCATE new_big.account_to_company_relation;
TRUNCATE new_big.account_to_company_relation;
ALTER SEQUENCE IF EXISTS new_big.account_to_company_relation_account_to_company_relation_id_seq RESTART;
INSERT INTO new_big.account_to_company_relation(account_id, company_id, rights, time_updated,who_update)

SELECT
(TRUNC(1 + RANDOM()*3000000))::integer, --<--
(TRUNC(1 + RANDOM()*1000000))::integer, --<--
'{0,1}',
date(now() - trunc(random()  * 365) * '1 day'::interval),
(TRUNC(1 + RANDOM()*300000))::integer --<--
FROM generate_series(1,1000000); --<--

------------------------------------------------------------------------------------------------------------------------

TRUNCATE new_big.vacancy CASCADE;

ALTER SEQUENCE IF EXISTS new_big.vacancy_vacancy_id_seq RESTART;


INSERT INTO new_big.vacancy
(	company_id,
	position,
	description,
	salary_min, salary_max,
	wanted_experience,
	wanted_skill_ids,
	time_to_unpublish,
  time_created)
SELECT
(TRUNC(1 + RANDOM()*1000000))::integer, --<--
temp_data.randomstr(TRUNC(5 + RANDOM()*45)::INTEGER),
temp_data.randomstr(TRUNC(100 + RANDOM()*1000)::INTEGER),
TRUNC(1 + RANDOM()*25000)::integer,
TRUNC(25000 + RANDOM()*250000)::integer,
temp_data.randomstr(TRUNC(100 + RANDOM()*1000)::INTEGER),
(SELECT array_agg(gs) FROM generate_series((TRUNC(1 + RANDOM()*10))::integer,(TRUNC(10 + RANDOM()*12))::integer) as gs),
date(now() + trunc(random()  * 365) * '1 day'::interval),
date(now() - trunc(random()  * 365) * '1 day'::interval)

------------------------------------------------------------------------------------------------------------------------
TRUNCATE new_big.resume CASCADE;

ALTER SEQUENCE IF EXISTS new_big.resume_resume_id_seq RESTART;

INSERT INTO new_big.resume
(	account_id,
	position,
	fio,
	birthday,
  salary_min,
  salary_max,
  skill_ids,
  time_created,
  time_updated)
SELECT
(TRUNC(1 + RANDOM()*3000000))::integer, --<--
temp_data.randomstr(TRUNC(5 + RANDOM()*45)::INTEGER),
temp_data.randomstr(TRUNC(20 + RANDOM()*256)::INTEGER),
date(now() - trunc(random()  * 40) * '1 year'::interval),
TRUNC(1 + RANDOM()*25000)::integer,
TRUNC(25000 + RANDOM()*250000)::integer,
(SELECT array_agg(gs) FROM generate_series((TRUNC(1 + RANDOM()*10))::integer,(TRUNC(10 + RANDOM()*12))::integer) as gs),
date(now() - trunc(random()  * 365) * '1 day'::interval),
date(now() - trunc(random()  * 365) * '1 day'::interval)

FROM generate_series(1,1000000)  --<--

------------------------------------------------------------------------------------------------------------------------
TRUNCATE new_big.resume_experience CASCADE;

ALTER SEQUENCE IF EXISTS new_big.resume_experience_resume_experience_id_seq RESTART;

INSERT INTO new_big.resume_experience(
	resume_id,
	date_start,
	date_finish,
	company_name,
	position,
	description)
SELECT

(TRUNC(1 + RANDOM()*1000000))::integer, --<--
date(now() - trunc(random()  * 700) * '1 day'::interval),
date(now() - trunc(random()  * 365) * '1 day'::interval),
temp_data.randomstr(TRUNC(5 + RANDOM()*45)::INTEGER),
temp_data.randomstr(TRUNC(5 + RANDOM()*25)::INTEGER),
temp_data.randomstr(TRUNC(50 + RANDOM()*205)::INTEGER)

FROM generate_series(1,2000000)  --<--

------------------------------------------------------------------------------------------------------------------------
TRUNCATE new_big.message CASCADE;

ALTER SEQUENCE IF EXISTS new_big.message_message_id_seq RESTART;

INSERT INTO new_big.message
	(vacancy_id, resume_id, article, description, message_type, unread ,time_create)
	SELECT
		ROUND(1 + RANDOM()*4),
		ROUND(1 + RANDOM()*4),
		'art'||random(),'art'||random(),
		'INVITE',
		CASE WHEN (random()>0.9) THEN TRUE ELSE FALSE END,
		date(now() - trunc(random()  * 365) * '1 day'::interval)
	FROM
		generate_series(1,500000) ; --<--

INSERT INTO new_big.message
	(vacancy_id, resume_id, article, description, message_type, unread ,time_create)
	SELECT
		ROUND(1 + RANDOM()*4),
		ROUND(1 + RANDOM()*4),
		'art'||random(),'art'||random(),
		'REPLY',
		CASE WHEN (random()>0.9) THEN TRUE ELSE FALSE END,
		date(now() - trunc(random()  * 365) * '1 day'::interval)
	FROM
		generate_series(1,500000) ; --<--

INSERT INTO new_big.message
	(vacancy_id, resume_id, article, description, message_type, unread ,time_create)
	SELECT
		ROUND(1 + RANDOM()*4),
		ROUND(1 + RANDOM()*4),
		'art'||random(),'art'||random(),
		'MESSAGE_TO_RESUME',
		CASE WHEN (random()>0.9) THEN TRUE ELSE FALSE END,
		date(now() - trunc(random()  * 365) * '1 day'::interval)
	FROM
		generate_series(1,4500000) ; --<--

INSERT INTO new_big.message
	(vacancy_id, resume_id, article, description, message_type, unread ,time_create)
	SELECT
		ROUND(1 + RANDOM()*4),
		ROUND(1 + RANDOM()*4),
		'art'||random(),'art'||random(),
		'MESSAGE_TO_VACANCY',
		CASE WHEN (random()>0.9) THEN TRUE ELSE FALSE END,
		date(now() - trunc(random()  * 365) * '1 day'::interval)
	FROM
		generate_series(1,4500000) ; --<--
