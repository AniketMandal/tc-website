-- add new project_status values

insert into project_status (project_stat_id, project_stat_name)
    values (5, 'All submissions failed screening');
insert into project_status (project_stat_id, project_stat_name)
    values (6, 'All submissions didn''t reach minimum review score');


-- add new fields to submission

ALTER TABLE SUBMISSION
    ADD FINAL_SCORE FLOAT;
ALTER TABLE SUBMISSION
    ADD PLACEMENT DEC(7);
ALTER TABLE SUBMISSION
    ADD PASSED_SCREENING DEC(1);



-- set non-removed submissions as passed screening
-- if phase later than screening

create table temp_subs (sub_id dec(18));

insert into temp_subs
select sub.submission_id
from submission sub, project p, phase_instance pi
where sub.cur_version = 1 and
p.cur_version = 1 and
pi.cur_version = 1 and
sub.submission_type = 1 and
sub.project_id = p.project_id and
p.phase_instance_id = pi.phase_instance_id and
pi.phase_id > 2 and
sub.is_removed = 0;

update submission
set passed_screening = 1 where
submission_id in
(select sub_id
from temp_subs) and
cur_version = 1;

drop table temp_subs;



-- modify scorecard tables
-- id:s have to be dec(18) to be generated by idgenerator

alter table sc_section_group
modify group_id dec(18) not null;
alter table scorecard_section
modify section_id dec(18) not null;
alter table scorecard_section
modify group_id dec(18) not null;
alter table question_template
modify q_template_id dec(18) not null;
alter table question_template
modify section_id dec(18) not null;


--  add template_id to sectiongroup and scorecardsection

ALTER TABLE SC_SECTION_GROUP
	ADD TEMPLATE_ID DEC(18);
ALTER TABLE SCORECARD_SECTION
	ADD TEMPLATE_ID DEC(18);



--  set template_id:s to existing groups/sections

update sc_section_group
set template_id=1 where
group_id in (1,2);
update sc_section_group
set template_id=2 where
group_id in (3,4,5,6);
update sc_section_group
set template_id=3 where
group_id in (7,8,9);
update sc_section_group
set template_id=4 where
group_id in (11,12,13,14,15);

update scorecard_section
set template_id=1 where
section_id >= 1 and section_id <= 6;
update scorecard_section
set template_id=2 where
section_id >= 7 and section_id <= 16;
update scorecard_section
set template_id=3 where
section_id in (17,18,19,20,22,30,31);
update scorecard_section
set template_id=4 where
section_id in (23,24,25,26,27,28,32,35);




-- CREATE SCORECARD_TEMPLATE TABLE

CREATE TABLE SCORECARD_TEMPLATE (
    TEMPLATE_ID        DEC(18) NOT NULL,
    TEMPLATE_NAME      LVARCHAR NOT NULL,
    STATUS_ID          DEC(7) NOT NULL,
    PROJECT_TYPE       DEC(7) NOT NULL,
    SCORECARD_TYPE     DEC(7) NOT NULL
);

ALTER TABLE SCORECARD_TEMPLATE
    ADD CONSTRAINT PRIMARY KEY (TEMPLATE_ID);

INSERT INTO SCORECARD_TEMPLATE VALUES
    (1, 'Original Design Screening Scorecard',1,1,1);
INSERT INTO SCORECARD_TEMPLATE VALUES
    (2, 'Original Design Review Scorecard',1,1,2);
INSERT INTO SCORECARD_TEMPLATE VALUES
    (3, 'Original Development Screening Scorecard',1,2,1);
INSERT INTO SCORECARD_TEMPLATE VALUES
    (4, 'Original Development Review Scorecard',1,2,2);




-- add testcases table

CREATE TABLE TESTCASES (
    TESTCASES_V_ID     SERIAL8 NOT NULL,
    TESTCASES_ID       DEC(18) NOT NULL,
    TESTCASES_URL      LVARCHAR NOT NULL,
    PROJECT_ID         DEC(18) NOT NULL,
    REVIEWER_ID        DEC(18) NOT NULL,
    TESTCASE_TYPE      DEC(7) NOT NULL,
    MODIFY_DATE        DATETIME YEAR TO FRACTION(3)
                       DEFAULT CURRENT YEAR TO FRACTION(3) NOT NULL,
    MODIFY_USER        DEC(18) NOT NULL,
    CUR_VERSION        DEC(1) NOT NULL
);

ALTER TABLE TESTCASES
    ADD CONSTRAINT PRIMARY KEY (TESTCASES_V_ID);




-- add appeal table

CREATE TABLE APPEAL (
    APPEAL_V_ID        SERIAL8 NOT NULL,
    APPEAL_ID          DEC(18) NOT NULL,
    APPEALER_ID        DEC(18) NOT NULL,
    QUESTION_ID        DEC(18) NOT NULL,
    IS_RESOLVED        DEC(1) NOT NULL,
    APPEAL_TEXT        TEXT,
    APPEAL_RESPONSE    TEXT,
    MODIFY_DATE        DATETIME YEAR TO FRACTION(3)
                       DEFAULT CURRENT YEAR TO FRACTION(3) NOT NULL,
    MODIFY_USER        DEC(18) NOT NULL,
    CUR_VERSION        DEC(1) NOT NULL
);

ALTER TABLE APPEAL
    ADD CONSTRAINT PRIMARY KEY (APPEAL_V_ID);





-- ADD PHASE ORDERING TO REVIEW_PHASE

ALTER TABLE REVIEW_PHASE
	ADD PHASE_ORDER DEC(7);

UPDATE review_phase SET phase_order=review_phase_id;
UPDATE review_phase SET phase_order=phase_order+1 WHERE review_phase_id>3;
INSERT INTO REVIEW_PHASE VALUES (9,'Appeals',4);




-- ADD SUPPORT FOR SUBJECTIVE YES/NO QUESTIONS

INSERT INTO EVALUATION_TYPE VALUES (3, 'Subjective Yes/No Evaluation');
INSERT INTO EVALUATION VALUES (7, 'Yes', 4, 3);
INSERT INTO EVALUATION VALUES (8, 'No', 1, 3);




-- CREATE APPEALS PHASE-INSTANCES FOR EXISTING PROJECTS
-- THAT HAVEN'T REACHED AGGREGATION

--select min(phase_instance_id) from phase_instance;
--7437798, set start-id in temp_proj to 1000000(unique under 7437798)

create table temp_proj (
   id serial8(1000000) not null,
   project_id dec(18) not null,
   start_date date,
   end_date date
);

insert into temp_proj
select unique 0,p.project_id,pi1.end_date,pi2.start_date
from project p,
phase_instance pi1,
phase_instance pi2,
phase_instance cpi
where p.cur_version=1 and
pi1.cur_version=1 and
pi2.cur_version=1 and
cpi.cur_version=1 and
pi1.project_id = p.project_id and
pi2.project_id = p.project_id and
cpi.phase_instance_id = p.phase_instance_id and 
cpi.phase_id < 4 and
pi1.phase_id = 3 and
pi2.phase_id = 4 and
p.project_id not in
(select unique pr.project_id
 from project pr, phase_instance pi
 where pr.cur_version=1 and
 pi.cur_version=1 and
 pr.project_id = pi.project_id and
 pi.phase_id = 9);

insert into phase_instance (phase_inst_v_id, phase_instance_id,
start_date, end_date, phase_id, project_id, modify_user, cur_version)
select 0, id, start_date, end_date, 9, project_id, 155846, 1
from temp_proj;

drop table temp_proj;
