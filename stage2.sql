-- эта фишка должна быть запущена вторым этапом,
-- если оказывается, что у нас оба аккаунта апрувлены - можем к непереименованному
-- присоединить всю дату, которая приехала с новым.
-- в случае, когда хоть один не является подтверждённым, не делаем ничего,
-- ну, модет если только оповещаем, что не в рамках дданной работы,
-- ибо если мы будем двигать неподтверждённые данные, то можем попасть на нехорошую ситуацию, когда
-- честному человеку вдруг прилепятся совсем левые персональные данные


CREATE OR REPLACE FUNCTION temp_data.resolve_conflict_data()
  RETURNS void AS
$BODY$
DECLARE step record;

BEGIN

 FOR step IN
 (select
	conflict_account.login,
	old.account_id as old_id,
	conflict_account.account_id as new_id,
	new.is_approved as new_is_approved,
	old.is_approved as old_is_approved

from temp_data.conflict_account
left join headhunter.account as new on new.account_id = conflict_account.account_id
left join headhunter.account as old on old.login = conflict_account.login)

LOOP
	IF step.new_is_approved AND step.old_is_approved THEN
		UPDATE headhunter.resume SET account_id = step.old_id WHERE account_id = step.new_id;
		UPDATE headhunter.account_to_company_relation SET account_id = step.old_id WHERE account_id = step.new_id;
	END IF;
END LOOP;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;
