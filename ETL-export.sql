CREATE TABLE "school_demography" (
    "id" integer NOT NULL,
    "school_name" varchar(30)   NOT NULL,
    "percentage_female" integer   NOT NULL,
    "percentage_male" integer   NOT NULL,
    "economic_need_index" integer   NOT NULL,
    CONSTRAINT "pk_school_demography" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "school_survey" (
    "id" integer   NOT NULL,
    "school_name" varchar(30)   NOT NULL,
    "instruction_score" integer   NOT NULL,
	"collaboration_score" integer   NOT NULL,
	"supportive_environment_score" integer   NOT NULL,
	"school_leadership_score	" integer   NOT NULL,
	"family_community_score" integer   NOT NULL,	
    "positive_score" integer   NOT NULL,
    CONSTRAINT "pk_school_survey" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "pupil_teacher_ratio" (
    "id" integer NOT NULL,
    "school_name" varchar(30)   NOT NULL,
    "teacher_ratio" integer   NOT NULL,
    CONSTRAINT "pk_pupil_teacher_ratio" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "school_demography" ADD CONSTRAINT "fk_school_demography_id" FOREIGN KEY("id")
REFERENCES "school_survey" ("id");

ALTER TABLE "pupil_teacher_ratio" ADD CONSTRAINT "fk_pupil_teacher_ratio_id" FOREIGN KEY("id")
REFERENCES "school_demography" ("id");


select * from pupil_teacher_ratio

select * from school_demography

select * from school_survey


-- Join tables on county_id
SELECT pupil_teacher_ratio.id,  pupil_teacher_ratio.school_name, pupil_teacher_ratio.teacher_ratio, school_demography.percentage_female, school_demography.percentage_male, school_survey.instruction_score, school_survey.collaboration_score, school_survey.supportive_environment_score, school_survey.school_leadership_score, school_survey.family_community_score, school_survey.positive_score 
FROM pupil_teacher_ratio
INNER JOIN school_demography
ON pupil_teacher_ratio.id = school_demography.id
INNER JOIN school_survey
ON school_survey.id = pupil_teacher_ratio.id;






