-- собственно, подкапотная магия

-- первое, что нужно вызвать -------------------------------------------------------------------------------------------

-- тогда в качестве замены двум функциям могу предложить вот такой вариант.
-- 9 запросов, которые повторяют тот же функционал.

-- account -------------------------------------------------------------------------------------------------------------
with cnt as (select (max(account_id)-min(account_id))as delta, min(account_id) as min from new_big.account),

next as (select (nextval('headhunter.account_account_id_seq'))),

corrected as (select setval('headhunter.account_account_id_seq',
(select nextval from next)+ cnt.delta ) from cnt)

INSERT INTO temp_data.table_serial_offset
	(table_name,
	serial_column_name,
	serial_value_offset,
	delta_id,
	min_id,
	schema)

SELECT 'account',
	'account_id',
	next.nextval,
	delta,
	min,
	'headhunter'
from cnt, next, corrected;


-- company -------------------------------------------------------------------------------------------------------------
with cnt as (select (max(company_id)-min(company_id))as delta, min(company_id) as min from new_big.company),

next as (select (nextval('headhunter.company_company_id_seq'))),

corrected as (select setval('headhunter.company_company_id_seq',
(select nextval from next)+ cnt.delta ) from cnt)

INSERT INTO temp_data.table_serial_offset
	(table_name,
	serial_column_name,
	serial_value_offset,
	delta_id,
	min_id,
	schema)

SELECT 'company',
	'company_id',
	next.nextval,
	delta,
	min,
	'headhunter'
from cnt, next, corrected;

-- account_to_company_relation -----------------------------------------------------------------------------------------
with cnt as (select (max(account_to_company_relation_id)-min(account_to_company_relation_id))as delta,
  min(account_to_company_relation_id) as min from new_big.account_to_company_relation),

next as (select (nextval('headhunter.account_to_company_relation_account_to_company_relation_id_seq'))),

corrected as (select setval('headhunter.account_to_company_relation_account_to_company_relation_id_seq',
(select nextval from next)+ cnt.delta ) from cnt)

INSERT INTO temp_data.table_serial_offset
	(table_name,
	serial_column_name,
	serial_value_offset,
	delta_id,
	min_id,
	schema)

SELECT 'account_to_company_relation',
	'account_to_company_relation_id',
	next.nextval,
	delta,
	min,
	'headhunter'
from cnt, next, corrected;


-- acc_to_comp_permission ----------------------------------------------------------------------------------------------
with cnt as (select (max(acc_to_comp_permission_id)-min(acc_to_comp_permission_id))as delta,
  min(acc_to_comp_permission_id) as min from new_big.acc_to_comp_permission),

next as (select (nextval('headhunter.acc_to_comp_permission_acc_to_comp_permission_id_seq'))),

corrected as (select setval('headhunter.acc_to_comp_permission_acc_to_comp_permission_id_seq',
(select nextval from next)+ cnt.delta ) from cnt)

INSERT INTO temp_data.table_serial_offset
	(table_name,
	serial_column_name,
	serial_value_offset,
	delta_id,
	min_id,
	schema)

SELECT 'acc_to_comp_permission',
	'acc_to_comp_permission_id',
	next.nextval,
	delta,
	min,
	'headhunter'
from cnt, next, corrected;


-- skill -------------------------------------------------------------------------------------------------------------
with cnt as (select (max(skill_id)-min(skill_id))as delta, min(skill_id) as min from new_big.skill),

next as (select (nextval('headhunter.skill_skill_id_seq'))),

corrected as (select setval('headhunter.skill_skill_id_seq',
(select nextval from next)+ cnt.delta ) from cnt)

INSERT INTO temp_data.table_serial_offset
	(table_name,
	serial_column_name,
	serial_value_offset,
	delta_id,
	min_id,
	schema)

SELECT 'skill',
	'skill_id',
	next.nextval,
	delta,
	min,
	'headhunter'
from cnt, next, corrected;


-- vacancy -------------------------------------------------------------------------------------------------------------
with cnt as (select (max(vacancy_id)-min(vacancy_id))as delta, min(vacancy_id) as min from new_big.vacancy),

next as (select (nextval('headhunter.vacancy_vacancy_id_seq'))),

corrected as (select setval('headhunter.vacancy_vacancy_id_seq',
(select nextval from next)+ cnt.delta ) from cnt)

INSERT INTO temp_data.table_serial_offset
	(table_name,
	serial_column_name,
	serial_value_offset,
	delta_id,
	min_id,
	schema)

SELECT 'vacancy',
	'vacancy_id',
	next.nextval,
	delta,
	min,
	'headhunter'
from cnt, next, corrected;


-- resume -------------------------------------------------------------------------------------------------------------
with cnt as (select (max(resume_id)-min(resume_id))as delta, min(resume_id) as min from new_big.resume),

next as (select (nextval('headhunter.resume_resume_id_seq'))),

corrected as (select setval('headhunter.resume_resume_id_seq',
(select nextval from next)+ cnt.delta ) from cnt)

INSERT INTO temp_data.table_serial_offset
	(table_name,
	serial_column_name,
	serial_value_offset,
	delta_id,
	min_id,
	schema)

SELECT 'resume',
	'resume_id',
	next.nextval,
	delta,
	min,
	'headhunter'
from cnt, next, corrected;


-- resume_experience -------------------------------------------------------------------------------------------------------------
with cnt as (select (max(resume_experience_id)-min(resume_experience_id))as delta, min(resume_experience_id) as min from new_big.resume_experience),

next as (select (nextval('headhunter.resume_experience_resume_experience_id_seq'))),

corrected as (select setval('headhunter.resume_experience_resume_experience_id_seq',
(select nextval from next)+ cnt.delta ) from cnt)

INSERT INTO temp_data.table_serial_offset
	(table_name,
	serial_column_name,
	serial_value_offset,
	delta_id,
	min_id,
	schema)

SELECT 'resume_experience',
	'resume_experience_id',
	next.nextval,
	delta,
	min,
	'headhunter'
from cnt, next, corrected;


-- message -------------------------------------------------------------------------------------------------------------
with cnt as (select (max(message_id)-min(message_id))as delta, min(message_id) as min from new_big.message),

next as (select (nextval('headhunter.message_message_id_seq'))),

corrected as (select setval('headhunter.message_message_id_seq',
(select nextval from next)+ cnt.delta ) from cnt)

INSERT INTO temp_data.table_serial_offset
	(table_name,
	serial_column_name,
	serial_value_offset,
	delta_id,
	min_id,
	schema)

SELECT 'message',
	'message_id',
	next.nextval,
	delta,
	min,
	'headhunter'
from cnt, next, corrected;

-- отдельно вывел простую функцию, которая дёргает состояние копируемых таблиц -----------------------------------------
-- всё просто, если хотим промониторить состояния копирования таблиц, дёграем и видим, что ещё недокопировано
CREATE OR REPLACE FUNCTION temp_data.get_schema_count(IN schema_name character varying)
  RETURNS TABLE(table_name character varying, count integer) AS
$BODY$
DECLARE step record;

BEGIN
 FOR step IN(select tables.table_name -- выбираю все таблицы для заданной схемы
		from information_schema.tables
		left join temp_data.table_sync_order USING (table_name)
		where table_schema =  $1
		ORDER BY order_id)

 LOOP
	EXECUTE FORMAT ('SELECT COUNT(*) FROM %s.%s', schema_name , step.table_name) INTO count;
	table_name := step.table_name;
	RETURN NEXT;

END LOOP;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;


-- немаловажно избавиться от внешних ключей на копируемой базе, иначе вообще весь фокус не удастся ---------------------

CREATE OR REPLACE FUNCTION temp_data.kill_all_fkeys(schema_name character varying)
  RETURNS integer AS
$BODY$
DECLARE step record;
BEGIN
 FOR step IN (SELECT table_schema, constraint_name, table_name
		FROM information_schema.table_constraints
		WHERE constraint_type = 'FOREIGN KEY' AND table_schema = $1)
 LOOP

	EXECUTE FORMAT('ALTER TABLE %s.%s DROP CONSTRAINT %s;',$1, step.table_name, step.constraint_name );

END LOOP;
RETURN 1;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;

-- корректируем значения изменившихся айдишников и связанных с ними полей
-- если коротко, то смотрим в спец. таблице на наличие смещения рассматриваемого айдишника
-- и на связи этого айдишника по внешним ключам,
-- если его нигде не значится, то возвращаем как есть,
-- если есть, то в виде "account+35647"

CREATE OR REPLACE FUNCTION temp_data.correct_value(
    table_name character varying,
    column_name character varying)
  RETURNS character varying AS
$BODY$
DECLARE min INTEGER;
DECLARE value_offset INTEGER;

BEGIN
	value_offset:=0;
	min:=0;

	SELECT  min_id , serial_value_offset
	FROM temp_data.table_serial_offset
	left join temp_data.fkeys on
		((fkeys.foreign_table = table_serial_offset.schema||'.'||table_serial_offset.table_name)
			AND
		(fkeys.foreign_column = table_serial_offset.serial_column_name))
	WHERE
		(table_serial_offset.table_name = $1 AND table_serial_offset.serial_column_name = $2)
			OR
		(fkeys.table = schema||'.'||$1 AND fkeys.column = $2) INTO min, value_offset;

IF min <> 0 THEN
	RETURN $2||'+'||(value_offset - min)::text;
END IF;
	RETURN $2;

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION temp_data.correct_value(character varying, character varying)
  OWNER TO postgres;


------------------------------------------------------------------------------------------------------------------------
------------------------------ КОПИРОВАНИЕ -----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.copy_next_chunk()
  RETURNS integer AS
$BODY$
DECLARE step record;
DECLARE result INTEGER;

DECLARE source_scheme VARCHAR;
DECLARE target_scheme VARCHAR;
DECLARE numer_of_records_by_iteration INTEGER;

DECLARE current_table VARCHAR;
DECLARE current_table_pkey VARCHAR;
DECLARE current_table_columns VARCHAR;
DECLARE current_table_columns_corr VARCHAR;

DECLARE conflict_prefix VARCHAR;

BEGIN
  result:= 0;

-- получим из конфига необходимые параметры
  SELECT value_text FROM temp_data.config WHERE param = 'source_scheme' INTO source_scheme;
  SELECT value_text FROM temp_data.config WHERE param = 'target_scheme' INTO target_scheme;
  SELECT value_text FROM temp_data.config WHERE param = 'conflict_prefix' INTO conflict_prefix;
  SELECT value_int FROM temp_data.config WHERE param = 'numer_of_records_by_iteration' INTO numer_of_records_by_iteration;

-- ищем таблицу, в которой записей больше 0
 FOR step IN(SELECT * from temp_data.get_schema_count(source_scheme))
 LOOP
	IF step.count > 0 THEN
		current_table := step.table_name;
		result := 1;
		EXIT;
	END IF;
END LOOP;
-- погнали!

	-- если копировать больше нечего, выходим
	IF result = 0 THEN RETURN 0; END IF;
	-- получим набор колонок данной таблицы
	SELECT string_agg(column_name,',')
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE table_name = current_table AND table_schema = target_scheme INTO current_table_columns;

	-- колонки, которые ссылаются на последовательности должны быть модифицированы так, чтобы они
	-- соответствовали новой базе и не конфликтовали, здесь строка с полями будет выглядеть примерно так:
	-- account_id+302395,login,password,time_register,time_last_login
	SELECT string_agg(temp_data.correct_value(current_table,column_name),',')
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE table_name = current_table AND table_schema = target_scheme INTO current_table_columns_corr;

	-- получим первичный ключ  обрабатываемой базы
	current_table_pkey := temp_data.get_table_pkey(target_scheme,current_table);

	--вытащим список ключей с которыми будем работать
	CREATE TEMP TABLE __temp__pkeys_in_work(pkey INT);
	EXECUTE FORMAT ('INSERT INTO __temp__pkeys_in_work (pkey) select %s from %s limit %s', current_table_pkey, source_scheme||'.'||current_table, numer_of_records_by_iteration);

BEGIN 	-- эту вещь сделаем отдельной транзакцией
	-- КОПИРУЕМ
	EXECUTE FORMAT ('INSERT INTO %s
			(%s)
			SELECT %s
			FROM %s
			WHERE %s IN (SELECT pkey FROM __temp__pkeys_in_work )
			ON CONFLICT (login) DO UPDATE
				SET
				account_id = EXCLUDED.account_id ,
				  login  = ''%s''||%s.%s||''__''||EXCLUDED.login ,
				  password  = EXCLUDED.password ,
				  time_register  = EXCLUDED.time_register ,
				  time_last_login  = EXCLUDED.time_last_login ,
				  is_approved  = EXCLUDED.is_approved

			',
			target_scheme||'.'||current_table,
			current_table_columns,
			current_table_columns_corr,
			source_scheme||'.'||current_table,
			current_table_pkey,

			conflict_prefix,
			current_table,
			current_table_pkey
			);

	-- если всё норм, удаляем кусок
	 EXECUTE FORMAT ('DELETE FROM %s WHERE %s IN (SELECT pkey FROM __temp__pkeys_in_work )', source_scheme||'.'||current_table, current_table_pkey);
	EXCEPTION   WHEN unique_violation THEN INSERT INTO temp_data.conflict_account(account_id)VALUES(1);--RETURN 0; -- не буду обрабатывать ексепшн тут, пусть летит в код
END;
	DROP TABLE __temp__pkeys_in_work;
RETURN 1;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;
