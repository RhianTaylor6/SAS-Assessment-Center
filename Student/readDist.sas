PROC SQL;
CREATE TABLE WORK.query AS
SELECT gender , test_preparation_course , math_score , reading_score , writing_score FROM WORK.IMPORT;
RUN;
QUIT;

PROC DATASETS NOLIST NODETAILS;
CONTENTS DATA=WORK.query OUT=WORK.details;
RUN;

PROC PRINT DATA=WORK.details;
RUN;

proc univariate data = work.import noprint;
histogram reading_score
/ 
normal ( 
   mu = est
   sigma = est
   color = blue
   w = 2.5 
)
barlabel = percent
midpoints = 0 to 100 by 5;
run;



ods noproctitle;
ods graphics / imagemap=on;

/* Exploring Data */
proc univariate data=work.import;
	ods select Histogram;
	var reading_score;
	class gender;
	histogram reading_score / normal;
run;

proc univariate data=work.import;
	ods select Histogram GoodnessOfFit QQPlot;
	var reading_score;

	/* Checking for Normality */
	histogram reading_score / normal(mu=est sigma=est);
	qqplot reading_score / normal(mu=est sigma=est);
run;