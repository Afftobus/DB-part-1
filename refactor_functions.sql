------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION temp_data.refactor_accounts()
  RETURNS void AS
$BODY$
DECLARE step record;

BEGIN

 FOR step IN(with accs as (select account_id
		from new_big.account
		ORDER BY account_id),

		min_acc as (select min(account_id) from new_big.account)

		select (select min from min_acc)- 1 + row_number() OVER() as true_id,  account_id
		from accs, min_acc)
 LOOP
	IF step.true_id <> step.account_id THEN
		UPDATE new_big.account SET account_id =  step.true_id WHERE account.account_id = step.account_id;
		UPDATE new_big.account_to_company_relation SET account_id =  step.true_id WHERE account_to_company_relation.account_id = step.account_id;
		UPDATE new_big.resume SET account_id =  step.true_id 	WHERE resume.account_id = step.account_id;
	END IF;
END LOOP;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;

------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION temp_data.refactor_companys()
  RETURNS void AS
$BODY$
DECLARE step record;

BEGIN

 FOR step IN(with accs as (select company_id
		from new_big.company
		ORDER BY company_id),

		min_acc as (select min(company_id) from new_big.company)

		select (select min from min_acc)- 1 + row_number() OVER() as true_id,  company_id
		from accs, min_acc)
 LOOP
	IF step.true_id <> step.company_id THEN
		UPDATE new_big.company SET company_id =  step.true_id WHERE company.company_id = step.company_id;
		UPDATE new_big.account_to_company_relation SET company_id =  step.true_id WHERE account_to_company_relation.company_id = step.company_id;
		UPDATE new_big.vacancy SET company_id =  step.true_id 	WHERE vacancy.company_id = step.company_id;
	END IF;
END LOOP;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;
------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION temp_data.refactor_resumes()
  RETURNS void AS
$BODY$
DECLARE step record;

BEGIN

 FOR step IN(with accs as (select resume_id
		from new_big.resume
		ORDER BY resume_id),

		min_acc as (select min(resume_id) from new_big.resume)

		select (select min from min_acc)- 1 + row_number() OVER() as true_id,  resume_id
		from accs, min_acc)
 LOOP
	IF step.true_id <> step.resume_id THEN
		UPDATE new_big.resume SET resume_id =  step.true_id WHERE resume.resume_id = step.resume_id;
		UPDATE new_big.resume_experience SET resume_id =  step.true_id WHERE resume_experience.resume_id = step.resume_id;
		UPDATE new_big.message SET resume_id =  step.true_id 	WHERE message.resume_id = step.resume_id;
	END IF;
END LOOP;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;
------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION temp_data.refactor_vacancys()
  RETURNS void AS
$BODY$
DECLARE step record;

BEGIN

 FOR step IN(with accs as (select vacancy_id
		from new_big.vacancy
		ORDER BY vacancy_id),

		min_acc as (select min(vacancy_id) from new_big.vacancy)

		select (select min from min_acc)- 1 + row_number() OVER() as true_id,  vacancy_id
		from accs, min_acc)
 LOOP
	IF step.true_id <> step.vacancy_id THEN
		UPDATE new_big.vacancy SET vacancy_id =  step.true_id WHERE vacancy.vacancy_id = step.vacancy_id;
		UPDATE new_big.message SET vacancy_id =  step.true_id	WHERE message.vacancy_id = step.vacancy_id;
	END IF;
END LOOP;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;

------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION temp_data.refactor_acc_to_comp_permissions()
  RETURNS void AS
$BODY$
DECLARE step record;

BEGIN
 FOR step IN(with accs as (select acc_to_comp_permission_id
		from new_big.acc_to_comp_permission
		ORDER BY acc_to_comp_permission_id),

		min_acc as (select min(acc_to_comp_permission_id) from new_big.acc_to_comp_permission)

		select (select min from min_acc)- 1 + row_number() OVER() as true_id,  acc_to_comp_permission_id
		from accs, min_acc)
 LOOP
	IF step.true_id <> step.acc_to_comp_permission_id THEN
		UPDATE new_big.acc_to_comp_permission SET acc_to_comp_permission_id =  step.true_id WHERE
		acc_to_comp_permission.acc_to_comp_permission_id = step.acc_to_comp_permission_id;
	END IF;
END LOOP;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;

------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION temp_data.refactor_account_to_company_relations()
  RETURNS void AS
$BODY$
DECLARE step record;

BEGIN
 FOR step IN(with accs as (select account_to_company_relation_id
		from new_big.account_to_company_relation
		ORDER BY account_to_company_relation_id),

		min_acc as (select min(account_to_company_relation_id) from new_big.account_to_company_relation)

		select (select min from min_acc)- 1 + row_number() OVER() as true_id,  account_to_company_relation_id
		from accs, min_acc)
 LOOP
	IF step.true_id <> step.account_to_company_relation_id THEN
		UPDATE new_big.account_to_company_relation SET account_to_company_relation_id =  step.true_id WHERE
		account_to_company_relation.account_to_company_relation_id = step.account_to_company_relation_id;
	END IF;
END LOOP;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;

------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION temp_data.refactor_skills()
  RETURNS void AS
$BODY$
DECLARE step record;

BEGIN
 FOR step IN(with accs as (select skill_id
		from new_big.skill
		ORDER BY skill_id),

		min_acc as (select min(skill_id) from new_big.skill)

		select (select min from min_acc)- 1 + row_number() OVER() as true_id,  skill_id
		from accs, min_acc)
 LOOP
	IF step.true_id <> step.skill_id THEN
		UPDATE new_big.skill SET skill_id =  step.true_id WHERE	skill.skill_id = step.skill_id;
	END IF;
END LOOP;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;

------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION temp_data.refactor_messages()
  RETURNS void AS
$BODY$
DECLARE step record;

BEGIN
 FOR step IN(with accs as (select message_id
		from new_big.message
		ORDER BY message_id),

		min_acc as (select min(message_id) from new_big.message)

		select (select min from min_acc)- 1 + row_number() OVER() as true_id,  message_id
		from accs, min_acc)
 LOOP
	IF step.true_id <> step.message_id THEN
		UPDATE new_big.message SET message_id =  step.true_id WHERE	message.message_id = step.message_id;
	END IF;
END LOOP;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;

------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION temp_data.refactor_resume_experiences()
  RETURNS void AS
$BODY$
DECLARE step record;

BEGIN
 FOR step IN(with accs as (select resume_experience_id
		from new_big.resume_experience
		ORDER BY resume_experience_id),

		min_acc as (select min(resume_experience_id) from new_big.resume_experience)

		select (select min from min_acc)- 1 + row_number() OVER() as true_id,  resume_experience_id
		from accs, min_acc)
 LOOP
	IF step.true_id <> step.resume_experience_id THEN
		UPDATE new_big.resume_experience SET resume_experience_id =  step.true_id WHERE
		resume_experience.resume_experience_id = step.resume_experience_id;
	END IF;
END LOOP;

END; $BODY$
  LANGUAGE plpgsql VOLATILE;

------------------------------------------------------------------------------------------------------------------------
