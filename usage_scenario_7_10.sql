-- Выполняем запросы, считающие таблицы

-- смотрим, есть ли что покопироват
select * from temp_data.get_schema_count('new_big');
-- убираем внешние ключи с купленной базы
select * from temp_data.kill_all_fkeys('new_big');
-- КОПИРУЕМ
select * from public.copy_next_chunk_2_0();
-- проверяем, что при вставке в боевую зазу мы не натыкаемся на конфликты
INSERT INTO headhunter.account(login, password, time_register) VALUES ('onemoreuser', 	md5('querty'), now());


-- а потом ещё немного..
select * from public.copy_next_chunk_2_0();
-- и ещё немного
select * from public.copy_next_chunk_2_0();
--- .....
select * from public.copy_next_chunk_2_0();
-- пока увы, совсем ничего не осталось
-- функция вернёт 0 если нечего больше копировать.

