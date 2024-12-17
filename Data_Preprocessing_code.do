**************************************************************
******************** Data Processing Code ********************
********************** Labor Economics 1 *********************
************************ Final Project ***********************
**************************************************************

cd "C:\Users\A\Desktop\Labor Economics Project\Data"

set more off

clear
quietly infix                   ///
  int     year         1-4      ///
  long    serial       5-9      ///
  byte    month        10-11    ///
  double  hwtfinl      12-21    ///
  double  cpsid        22-35    ///
  byte    asecflag     36-36    ///
  double  asecwth      37-47    ///
  byte    mish         48-48    ///
  byte    numprec      49-50    ///
  byte    gqtype       51-52    ///
  byte    hhintype     53-53    ///
  byte    region       54-55    ///
  byte    statefip     56-57    ///
  byte    statecensus  58-59    ///
  long    county       60-64    ///
  long    metfips      65-69    ///
  byte    metro        70-70    ///
  byte    cbsasz       71-72    ///
  byte    individcc    73-73    ///
  int     faminc       74-76    ///
  double  hrhhid       77-91    ///
  long    hrhhid2      92-97    ///
  byte    pernum       98-99    ///
  double  wtfinl       100-113  ///
  double  cpsidv       114-128  ///
  double  cpsidp       129-142  ///
  double  asecwt       143-153  ///
  int     relate       154-157  ///
  byte    age          158-159  ///
  byte    sex          160-160  ///
  int     race         161-163  ///
  byte    empstat      164-165  ///
  byte    labforce     166-166  ///
  int     occ          167-170  ///
  int     ind          171-174  ///
  int     uhrsworkt    175-177  ///
  int     uhrswork1    178-180  ///
  int     uhrswork2    181-183  ///
  byte    durunem2     184-185  ///
  int     durunemp     186-188  ///
  int     educ         189-191  ///
  byte    educ99       192-193  ///
  byte    edcyc        194-195  ///
  byte    eddipged     196-197  ///
  byte    edhgcged     198-199  ///
  byte    schlcoll     200-200  ///
  double  earnwt       201-210  ///
  byte    lineno       211-212  ///
  int     indly        213-216  ///
  double  ftotval      217-226  ///
  double  inctot       227-235  ///
  double  incwage      236-243  ///
  long    incss        244-249  ///
  long    incwelfr     250-255  ///
  using `"cps_00003.dat"'

replace hwtfinl     = hwtfinl     / 10000
replace asecwth     = asecwth     / 10000
replace wtfinl      = wtfinl      / 10000
replace asecwt      = asecwt      / 10000
replace earnwt      = earnwt      / 10000

format hwtfinl     %10.4f
format cpsid       %14.0f
format asecwth     %11.4f
format hrhhid      %15.0f
format wtfinl      %14.4f
format cpsidv      %15.0f
format cpsidp      %14.0f
format asecwt      %11.4f
format earnwt      %10.4f
format ftotval     %10.0f
format inctot      %9.0f
format incwage     %8.0f

label var year        `"Survey year"'
label var serial      `"Household serial number"'
label var month       `"Month"'
label var hwtfinl     `"Household weight, Basic Monthly"'
label var cpsid       `"CPSID, household record"'
label var asecflag    `"Flag for ASEC"'
label var asecwth     `"Annual Social and Economic Supplement Household weight"'
label var mish        `"Month in sample, household level"'
label var numprec     `"Number of person records following"'
label var gqtype      `"Household type"'
label var hhintype    `"Type of household"'
label var region      `"Region and division"'
label var statefip    `"State (FIPS code)"'
label var statecensus `"State (Census code)"'
label var county      `"County (FIPS code)"'
label var metfips     `"Metropolitan area (FIPS code)"'
label var metro       `"Metropolitan and central/principal city status"'
label var cbsasz      `"Core-based (metro/micro) statistical area size"'
label var individcc   `"Individual central/principal city"'
label var faminc      `"Family income of householder"'
label var hrhhid      `"Household ID, part 1"'
label var hrhhid2     `"Household ID, part 2"'
label var pernum      `"Person number in sample unit"'
label var wtfinl      `"Final Basic Weight"'
label var cpsidv      `"Validated Longitudinal Identifier"'
label var cpsidp      `"CPSID, person record"'
label var asecwt      `"Annual Social and Economic Supplement Weight"'
label var relate      `"Relationship to household head"'
label var age         `"Age"'
label var sex         `"Sex"'
label var race        `"Race"'
label var empstat     `"Employment status"'
label var labforce    `"Labor force status"'
label var occ         `"Occupation"'
label var ind         `"Industry"'
label var uhrsworkt   `"Hours usually worked per week at all jobs"'
label var uhrswork1   `"Hours usually worked per week at main job"'
label var uhrswork2   `"Hours usually worked per week, other job(s)"'
label var durunem2    `"Continuous weeks unemployed, intervalled"'
label var durunemp    `"Continuous weeks unemployed"'
label var educ        `"Educational attainment recode"'
label var educ99      `"Educational attainment, 1990"'
label var edcyc       `"Years of college credit completed"'
label var eddipged    `"High school or GED"'
label var edhgcged    `"Highest grade completed before receiving GED"'
label var schlcoll    `"School or college attendance"'
label var earnwt      `"Earnings weight"'
label var lineno      `"Line number on original form"'
label var indly       `"Industry last year"'
label var ftotval     `"Total family income"'
label var inctot      `"Total personal income"'
label var incwage     `"Wage and salary income"'
label var incss       `"Social Security income"'
label var incwelfr    `"Welfare (public assistance) income"'

label define month_lbl 01 `"January"'
label define month_lbl 02 `"February"', add
label define month_lbl 03 `"March"', add
label define month_lbl 04 `"April"', add
label define month_lbl 05 `"May"', add
label define month_lbl 06 `"June"', add
label define month_lbl 07 `"July"', add
label define month_lbl 08 `"August"', add
label define month_lbl 09 `"September"', add
label define month_lbl 10 `"October"', add
label define month_lbl 11 `"November"', add
label define month_lbl 12 `"December"', add
label values month month_lbl

label define asecflag_lbl 1 `"ASEC"'
label define asecflag_lbl 2 `"March Basic"', add
label values asecflag asecflag_lbl

label define mish_lbl 1 `"One"'
label define mish_lbl 2 `"Two"', add
label define mish_lbl 3 `"Three"', add
label define mish_lbl 4 `"Four"', add
label define mish_lbl 5 `"Five"', add
label define mish_lbl 6 `"Six"', add
label define mish_lbl 7 `"Seven"', add
label define mish_lbl 8 `"Eight"', add
label values mish mish_lbl

label define gqtype_lbl 00 `"Non-interview household"'
label define gqtype_lbl 01 `"Husband/wife primary family (neither Armed Forces)"', add
label define gqtype_lbl 02 `"Husband/wife primary family (either/both Armed Forces)"', add
label define gqtype_lbl 03 `"Unmarried civilian male - primary family householder"', add
label define gqtype_lbl 04 `"Unmarried civilian female - primary family householder"', add
label define gqtype_lbl 05 `"Primary family householder - respondent in Armed Forces, unmarried"', add
label define gqtype_lbl 06 `"Civilian male primary individual"', add
label define gqtype_lbl 07 `"Civilian female primary individual"', add
label define gqtype_lbl 08 `"Primary individual householder - respondent in Armed Forces"', add
label define gqtype_lbl 09 `"Group quarters with family"', add
label define gqtype_lbl 10 `"Group quarters without family"', add
label define gqtype_lbl 99 `"Blank"', add
label values gqtype gqtype_lbl

label define hhintype_lbl 1 `"Interview"'
label define hhintype_lbl 2 `"Type A non-interview"', add
label define hhintype_lbl 3 `"Type B/C non-interview"', add
label values hhintype hhintype_lbl

label define region_lbl 11 `"New England Division"'
label define region_lbl 12 `"Middle Atlantic Division"', add
label define region_lbl 21 `"East North Central Division"', add
label define region_lbl 22 `"West North Central Division"', add
label define region_lbl 31 `"South Atlantic Division"', add
label define region_lbl 32 `"East South Central Division"', add
label define region_lbl 33 `"West South Central Division"', add
label define region_lbl 41 `"Mountain Division"', add
label define region_lbl 42 `"Pacific Division"', add
label define region_lbl 97 `"State not identified"', add
label values region region_lbl

label define statefip_lbl 01 `"Alabama"'
label define statefip_lbl 02 `"Alaska"', add
label define statefip_lbl 04 `"Arizona"', add
label define statefip_lbl 05 `"Arkansas"', add
label define statefip_lbl 06 `"California"', add
label define statefip_lbl 08 `"Colorado"', add
label define statefip_lbl 09 `"Connecticut"', add
label define statefip_lbl 10 `"Delaware"', add
label define statefip_lbl 11 `"District of Columbia"', add
label define statefip_lbl 12 `"Florida"', add
label define statefip_lbl 13 `"Georgia"', add
label define statefip_lbl 15 `"Hawaii"', add
label define statefip_lbl 16 `"Idaho"', add
label define statefip_lbl 17 `"Illinois"', add
label define statefip_lbl 18 `"Indiana"', add
label define statefip_lbl 19 `"Iowa"', add
label define statefip_lbl 20 `"Kansas"', add
label define statefip_lbl 21 `"Kentucky"', add
label define statefip_lbl 22 `"Louisiana"', add
label define statefip_lbl 23 `"Maine"', add
label define statefip_lbl 24 `"Maryland"', add
label define statefip_lbl 25 `"Massachusetts"', add
label define statefip_lbl 26 `"Michigan"', add
label define statefip_lbl 27 `"Minnesota"', add
label define statefip_lbl 28 `"Mississippi"', add
label define statefip_lbl 29 `"Missouri"', add
label define statefip_lbl 30 `"Montana"', add
label define statefip_lbl 31 `"Nebraska"', add
label define statefip_lbl 32 `"Nevada"', add
label define statefip_lbl 33 `"New Hampshire"', add
label define statefip_lbl 34 `"New Jersey"', add
label define statefip_lbl 35 `"New Mexico"', add
label define statefip_lbl 36 `"New York"', add
label define statefip_lbl 37 `"North Carolina"', add
label define statefip_lbl 38 `"North Dakota"', add
label define statefip_lbl 39 `"Ohio"', add
label define statefip_lbl 40 `"Oklahoma"', add
label define statefip_lbl 41 `"Oregon"', add
label define statefip_lbl 42 `"Pennsylvania"', add
label define statefip_lbl 44 `"Rhode Island"', add
label define statefip_lbl 45 `"South Carolina"', add
label define statefip_lbl 46 `"South Dakota"', add
label define statefip_lbl 47 `"Tennessee"', add
label define statefip_lbl 48 `"Texas"', add
label define statefip_lbl 49 `"Utah"', add
label define statefip_lbl 50 `"Vermont"', add
label define statefip_lbl 51 `"Virginia"', add
label define statefip_lbl 53 `"Washington"', add
label define statefip_lbl 54 `"West Virginia"', add
label define statefip_lbl 55 `"Wisconsin"', add
label define statefip_lbl 56 `"Wyoming"', add
label define statefip_lbl 61 `"Maine-New Hampshire-Vermont"', add
label define statefip_lbl 65 `"Montana-Idaho-Wyoming"', add
label define statefip_lbl 68 `"Alaska-Hawaii"', add
label define statefip_lbl 69 `"Nebraska-North Dakota-South Dakota"', add
label define statefip_lbl 70 `"Maine-Massachusetts-New Hampshire-Rhode Island-Vermont"', add
label define statefip_lbl 71 `"Michigan-Wisconsin"', add
label define statefip_lbl 72 `"Minnesota-Iowa"', add
label define statefip_lbl 73 `"Nebraska-North Dakota-South Dakota-Kansas"', add
label define statefip_lbl 74 `"Delaware-Virginia"', add
label define statefip_lbl 75 `"North Carolina-South Carolina"', add
label define statefip_lbl 76 `"Alabama-Mississippi"', add
label define statefip_lbl 77 `"Arkansas-Oklahoma"', add
label define statefip_lbl 78 `"Arizona-New Mexico-Colorado"', add
label define statefip_lbl 79 `"Idaho-Wyoming-Utah-Montana-Nevada"', add
label define statefip_lbl 80 `"Alaska-Washington-Hawaii"', add
label define statefip_lbl 81 `"New Hampshire-Maine-Vermont-Rhode Island"', add
label define statefip_lbl 83 `"South Carolina-Georgia"', add
label define statefip_lbl 84 `"Kentucky-Tennessee"', add
label define statefip_lbl 85 `"Arkansas-Louisiana-Oklahoma"', add
label define statefip_lbl 87 `"Iowa-N Dakota-S Dakota-Nebraska-Kansas-Minnesota-Missouri"', add
label define statefip_lbl 88 `"Washington-Oregon-Alaska-Hawaii"', add
label define statefip_lbl 89 `"Montana-Wyoming-Colorado-New Mexico-Utah-Nevada-Arizona"', add
label define statefip_lbl 90 `"Delaware-Maryland-Virginia-West Virginia"', add
label define statefip_lbl 99 `"State not identified"', add
label values statefip statefip_lbl

label define statecensus_lbl 00 `"Unknown"'
label define statecensus_lbl 11 `"Maine"', add
label define statecensus_lbl 12 `"New Hampshire"', add
label define statecensus_lbl 13 `"Vermont"', add
label define statecensus_lbl 14 `"Massachusetts"', add
label define statecensus_lbl 15 `"Rhode Island"', add
label define statecensus_lbl 16 `"Connecticut"', add
label define statecensus_lbl 19 `"Maine, New Hampshire, Vermont, Rhode Island"', add
label define statecensus_lbl 21 `"New York"', add
label define statecensus_lbl 22 `"New Jersey"', add
label define statecensus_lbl 23 `"Pennsylvania"', add
label define statecensus_lbl 31 `"Ohio"', add
label define statecensus_lbl 32 `"Indiana"', add
label define statecensus_lbl 33 `"Illinois"', add
label define statecensus_lbl 34 `"Michigan"', add
label define statecensus_lbl 35 `"Wisconsin"', add
label define statecensus_lbl 39 `"Michigan, Wisconsin"', add
label define statecensus_lbl 41 `"Minnesota"', add
label define statecensus_lbl 42 `"Iowa"', add
label define statecensus_lbl 43 `"Missouri"', add
label define statecensus_lbl 44 `"North Dakota"', add
label define statecensus_lbl 45 `"South Dakota"', add
label define statecensus_lbl 46 `"Nebraska"', add
label define statecensus_lbl 47 `"Kansas"', add
label define statecensus_lbl 49 `"Minnesota, Iowa, Missouri, North Dakota, South Dakota, Nebraska, Kansas"', add
label define statecensus_lbl 50 `"Delaware, Maryland, Virginia, West Virginia"', add
label define statecensus_lbl 51 `"Delaware"', add
label define statecensus_lbl 52 `"Maryland"', add
label define statecensus_lbl 53 `"District of Columbia"', add
label define statecensus_lbl 54 `"Virginia"', add
label define statecensus_lbl 55 `"West Virginia"', add
label define statecensus_lbl 56 `"North Carolina"', add
label define statecensus_lbl 57 `"South Carolina"', add
label define statecensus_lbl 58 `"Georgia"', add
label define statecensus_lbl 59 `"Florida"', add
label define statecensus_lbl 60 `"South Carolina, Georgia"', add
label define statecensus_lbl 61 `"Kentucky"', add
label define statecensus_lbl 62 `"Tennessee"', add
label define statecensus_lbl 63 `"Alabama"', add
label define statecensus_lbl 64 `"Mississippi"', add
label define statecensus_lbl 67 `"Kentucky, Tennessee"', add
label define statecensus_lbl 69 `"Alabama, Mississippi"', add
label define statecensus_lbl 71 `"Arkansas"', add
label define statecensus_lbl 72 `"Louisiana"', add
label define statecensus_lbl 73 `"Oklahoma"', add
label define statecensus_lbl 74 `"Texas"', add
label define statecensus_lbl 79 `"Arkansas, Louisiana, Oklahoma"', add
label define statecensus_lbl 81 `"Montana"', add
label define statecensus_lbl 82 `"Idaho"', add
label define statecensus_lbl 83 `"Wyoming"', add
label define statecensus_lbl 84 `"Colorado"', add
label define statecensus_lbl 85 `"New Mexico"', add
label define statecensus_lbl 86 `"Arizona"', add
label define statecensus_lbl 87 `"Utah"', add
label define statecensus_lbl 88 `"Nevada"', add
label define statecensus_lbl 89 `"Montana, Idaho, Wyoming, Colorado, New Mexico, Arizona, Utah, Nevada"', add
label define statecensus_lbl 91 `"Washington"', add
label define statecensus_lbl 92 `"Oregon"', add
label define statecensus_lbl 93 `"California"', add
label define statecensus_lbl 94 `"Alaska"', add
label define statecensus_lbl 95 `"Hawaii"', add
label define statecensus_lbl 99 `"Washington, Oregon, Alaska, Hawaii"', add
label values statecensus statecensus_lbl

label define metro_lbl 0 `"Not identified"'
label define metro_lbl 1 `"Not in metropolitan area"', add
label define metro_lbl 2 `"In central/principal city"', add
label define metro_lbl 3 `"Not in central/principal city"', add
label define metro_lbl 4 `"Central/principal city status not identified"', add
label define metro_lbl 9 `"Missing/unknown"', add
label values metro metro_lbl

label define cbsasz_lbl 00 `"Not identified or nonmetropolitan"'
label define cbsasz_lbl 01 `"100,000 - 249,999"', add
label define cbsasz_lbl 02 `"250,000 - 499,999"', add
label define cbsasz_lbl 03 `"500,000 - 999,999"', add
label define cbsasz_lbl 04 `"1,000,000 - 2,499,999"', add
label define cbsasz_lbl 05 `"2,500,000 - 4,999,999"', add
label define cbsasz_lbl 06 `"5,000,000 or more"', add
label values cbsasz cbsasz_lbl

label define faminc_lbl 100 `"Under $5,000"'
label define faminc_lbl 110 `"Under $1,000"', add
label define faminc_lbl 111 `"Under $500"', add
label define faminc_lbl 112 `"$500 - 999"', add
label define faminc_lbl 120 `"$1,000 - 1,999"', add
label define faminc_lbl 121 `"$1,000 - 1,499"', add
label define faminc_lbl 122 `"$1,500-1,999"', add
label define faminc_lbl 130 `"$2,000 - 2,999"', add
label define faminc_lbl 131 `"$2,000 - 2,499"', add
label define faminc_lbl 132 `"$2,500 - 2,999"', add
label define faminc_lbl 140 `"$3,000 - 3,999"', add
label define faminc_lbl 141 `"$3,000 - 3,499"', add
label define faminc_lbl 142 `"$3,500 - 3,999"', add
label define faminc_lbl 150 `"$4,000 - 4,999"', add
label define faminc_lbl 200 `"$5,000 - 7,999"', add
label define faminc_lbl 210 `"$5,000 - 7,499"', add
label define faminc_lbl 220 `"$5,000 - 5,999"', add
label define faminc_lbl 230 `"$6,000 - 7,999"', add
label define faminc_lbl 231 `"$6,000 - 7,499"', add
label define faminc_lbl 232 `"$6,000 - 6,999"', add
label define faminc_lbl 233 `"$7,000 - 7,499"', add
label define faminc_lbl 234 `"$7,000 - 7,999"', add
label define faminc_lbl 300 `"$7,500 - 9,999"', add
label define faminc_lbl 310 `"$7,500 - 7,999"', add
label define faminc_lbl 320 `"$8,000 - 8,499"', add
label define faminc_lbl 330 `"$8,500 - 8,999"', add
label define faminc_lbl 340 `"$8,000 - 8,999"', add
label define faminc_lbl 350 `"$9,000 - 9,999"', add
label define faminc_lbl 400 `"$10,000 - 14,999"', add
label define faminc_lbl 410 `"$10,000 - 10,999"', add
label define faminc_lbl 420 `"$11,000 - 11,999"', add
label define faminc_lbl 430 `"$10,000 - 12,499"', add
label define faminc_lbl 440 `"$10,000 - 11,999"', add
label define faminc_lbl 450 `"$12,000 - 12,999"', add
label define faminc_lbl 460 `"$12,000 - 14,999"', add
label define faminc_lbl 470 `"$12,500 - 14,999"', add
label define faminc_lbl 480 `"$13,000 - 13,999"', add
label define faminc_lbl 490 `"$14,000 - 14,999"', add
label define faminc_lbl 500 `"$15,000 - 19,999"', add
label define faminc_lbl 510 `"$15,000 - 15,999"', add
label define faminc_lbl 520 `"$16,000 - 16,999"', add
label define faminc_lbl 530 `"$17,000 - 17,999"', add
label define faminc_lbl 540 `"$15,000 - 17,499"', add
label define faminc_lbl 550 `"$17,500 - 19,999"', add
label define faminc_lbl 560 `"$18,000 - 19,999"', add
label define faminc_lbl 600 `"$20,000 - 24,999"', add
label define faminc_lbl 700 `"$25,000 - 49,999"', add
label define faminc_lbl 710 `"$25,000 - 29,999"', add
label define faminc_lbl 720 `"$30,000 - 34,999"', add
label define faminc_lbl 730 `"$35,000 - 39,999"', add
label define faminc_lbl 740 `"$40,000 - 49,999"', add
label define faminc_lbl 800 `"$50,000 and over"', add
label define faminc_lbl 810 `"$50,000 - 74,999"', add
label define faminc_lbl 820 `"$50,000 - 59,999"', add
label define faminc_lbl 830 `"$60,000 - 74,999"', add
label define faminc_lbl 840 `"$75,000 and over"', add
label define faminc_lbl 841 `"$75,000 - 99,999"', add
label define faminc_lbl 842 `"$100,000 - 149,999"', add
label define faminc_lbl 843 `"$150,000 and over"', add
label define faminc_lbl 995 `"Missing"', add
label define faminc_lbl 996 `"Refused"', add
label define faminc_lbl 997 `"Don't know"', add
label define faminc_lbl 999 `"Blank"', add
label values faminc faminc_lbl

label define relate_lbl 0101 `"Head/householder"'
label define relate_lbl 0201 `"Spouse"', add
label define relate_lbl 0202 `"Opposite sex spouse"', add
label define relate_lbl 0203 `"Same sex spouse"', add
label define relate_lbl 0301 `"Child"', add
label define relate_lbl 0303 `"Stepchild"', add
label define relate_lbl 0501 `"Parent"', add
label define relate_lbl 0701 `"Sibling"', add
label define relate_lbl 0901 `"Grandchild"', add
label define relate_lbl 1001 `"Other relatives, n.s."', add
label define relate_lbl 1113 `"Partner/roommate"', add
label define relate_lbl 1114 `"Unmarried partner"', add
label define relate_lbl 1116 `"Opposite sex unmarried partner"', add
label define relate_lbl 1117 `"Same sex unmarried partner"', add
label define relate_lbl 1115 `"Housemate/roomate"', add
label define relate_lbl 1241 `"Roomer/boarder/lodger"', add
label define relate_lbl 1242 `"Foster children"', add
label define relate_lbl 1260 `"Other nonrelatives"', add
label define relate_lbl 9900 `"Relationship unknown"', add
label define relate_lbl 9999 `"NIU"', add
label values relate relate_lbl

label define age_lbl 00 `"Under 1 year"'
label define age_lbl 01 `"1"', add
label define age_lbl 02 `"2"', add
label define age_lbl 03 `"3"', add
label define age_lbl 04 `"4"', add
label define age_lbl 05 `"5"', add
label define age_lbl 06 `"6"', add
label define age_lbl 07 `"7"', add
label define age_lbl 08 `"8"', add
label define age_lbl 09 `"9"', add
label define age_lbl 10 `"10"', add
label define age_lbl 11 `"11"', add
label define age_lbl 12 `"12"', add
label define age_lbl 13 `"13"', add
label define age_lbl 14 `"14"', add
label define age_lbl 15 `"15"', add
label define age_lbl 16 `"16"', add
label define age_lbl 17 `"17"', add
label define age_lbl 18 `"18"', add
label define age_lbl 19 `"19"', add
label define age_lbl 20 `"20"', add
label define age_lbl 21 `"21"', add
label define age_lbl 22 `"22"', add
label define age_lbl 23 `"23"', add
label define age_lbl 24 `"24"', add
label define age_lbl 25 `"25"', add
label define age_lbl 26 `"26"', add
label define age_lbl 27 `"27"', add
label define age_lbl 28 `"28"', add
label define age_lbl 29 `"29"', add
label define age_lbl 30 `"30"', add
label define age_lbl 31 `"31"', add
label define age_lbl 32 `"32"', add
label define age_lbl 33 `"33"', add
label define age_lbl 34 `"34"', add
label define age_lbl 35 `"35"', add
label define age_lbl 36 `"36"', add
label define age_lbl 37 `"37"', add
label define age_lbl 38 `"38"', add
label define age_lbl 39 `"39"', add
label define age_lbl 40 `"40"', add
label define age_lbl 41 `"41"', add
label define age_lbl 42 `"42"', add
label define age_lbl 43 `"43"', add
label define age_lbl 44 `"44"', add
label define age_lbl 45 `"45"', add
label define age_lbl 46 `"46"', add
label define age_lbl 47 `"47"', add
label define age_lbl 48 `"48"', add
label define age_lbl 49 `"49"', add
label define age_lbl 50 `"50"', add
label define age_lbl 51 `"51"', add
label define age_lbl 52 `"52"', add
label define age_lbl 53 `"53"', add
label define age_lbl 54 `"54"', add
label define age_lbl 55 `"55"', add
label define age_lbl 56 `"56"', add
label define age_lbl 57 `"57"', add
label define age_lbl 58 `"58"', add
label define age_lbl 59 `"59"', add
label define age_lbl 60 `"60"', add
label define age_lbl 61 `"61"', add
label define age_lbl 62 `"62"', add
label define age_lbl 63 `"63"', add
label define age_lbl 64 `"64"', add
label define age_lbl 65 `"65"', add
label define age_lbl 66 `"66"', add
label define age_lbl 67 `"67"', add
label define age_lbl 68 `"68"', add
label define age_lbl 69 `"69"', add
label define age_lbl 70 `"70"', add
label define age_lbl 71 `"71"', add
label define age_lbl 72 `"72"', add
label define age_lbl 73 `"73"', add
label define age_lbl 74 `"74"', add
label define age_lbl 75 `"75"', add
label define age_lbl 76 `"76"', add
label define age_lbl 77 `"77"', add
label define age_lbl 78 `"78"', add
label define age_lbl 79 `"79"', add
label define age_lbl 80 `"80"', add
label define age_lbl 81 `"81"', add
label define age_lbl 82 `"82"', add
label define age_lbl 83 `"83"', add
label define age_lbl 84 `"84"', add
label define age_lbl 85 `"85"', add
label define age_lbl 86 `"86"', add
label define age_lbl 87 `"87"', add
label define age_lbl 88 `"88"', add
label define age_lbl 89 `"89"', add
label define age_lbl 90 `"90 (90+, 1988-2002)"', add
label define age_lbl 91 `"91"', add
label define age_lbl 92 `"92"', add
label define age_lbl 93 `"93"', add
label define age_lbl 94 `"94"', add
label define age_lbl 95 `"95"', add
label define age_lbl 96 `"96"', add
label define age_lbl 97 `"97"', add
label define age_lbl 98 `"98"', add
label define age_lbl 99 `"99+"', add
label values age age_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label define sex_lbl 9 `"NIU"', add
label values sex sex_lbl

label define race_lbl 100 `"White"'
label define race_lbl 200 `"Black"', add
label define race_lbl 300 `"American Indian/Aleut/Eskimo"', add
label define race_lbl 650 `"Asian or Pacific Islander"', add
label define race_lbl 651 `"Asian only"', add
label define race_lbl 652 `"Hawaiian/Pacific Islander only"', add
label define race_lbl 700 `"Other (single) race, n.e.c."', add
label define race_lbl 801 `"White-Black"', add
label define race_lbl 802 `"White-American Indian"', add
label define race_lbl 803 `"White-Asian"', add
label define race_lbl 804 `"White-Hawaiian/Pacific Islander"', add
label define race_lbl 805 `"Black-American Indian"', add
label define race_lbl 806 `"Black-Asian"', add
label define race_lbl 807 `"Black-Hawaiian/Pacific Islander"', add
label define race_lbl 808 `"American Indian-Asian"', add
label define race_lbl 809 `"Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 810 `"White-Black-American Indian"', add
label define race_lbl 811 `"White-Black-Asian"', add
label define race_lbl 812 `"White-American Indian-Asian"', add
label define race_lbl 813 `"White-Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 814 `"White-Black-American Indian-Asian"', add
label define race_lbl 815 `"American Indian-Hawaiian/Pacific Islander"', add
label define race_lbl 816 `"White-Black--Hawaiian/Pacific Islander"', add
label define race_lbl 817 `"White-American Indian-Hawaiian/Pacific Islander"', add
label define race_lbl 818 `"Black-American Indian-Asian"', add
label define race_lbl 819 `"White-American Indian-Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 820 `"Two or three races, unspecified"', add
label define race_lbl 830 `"Four or five races, unspecified"', add
label define race_lbl 999 `"Blank"', add
label values race race_lbl

label define empstat_lbl 00 `"NIU"'
label define empstat_lbl 01 `"Armed Forces"', add
label define empstat_lbl 10 `"At work"', add
label define empstat_lbl 12 `"Has job, not at work last week"', add
label define empstat_lbl 20 `"Unemployed"', add
label define empstat_lbl 21 `"Unemployed, experienced worker"', add
label define empstat_lbl 22 `"Unemployed, new worker"', add
label define empstat_lbl 30 `"Not in labor force"', add
label define empstat_lbl 31 `"NILF, housework"', add
label define empstat_lbl 32 `"NILF, unable to work"', add
label define empstat_lbl 33 `"NILF, school"', add
label define empstat_lbl 34 `"NILF, other"', add
label define empstat_lbl 35 `"NILF, unpaid, lt 15 hours"', add
label define empstat_lbl 36 `"NILF, retired"', add
label values empstat empstat_lbl

label define labforce_lbl 0 `"NIU"'
label define labforce_lbl 1 `"No, not in the labor force"', add
label define labforce_lbl 2 `"Yes, in the labor force"', add
label values labforce labforce_lbl

label define uhrsworkt_lbl 997 `"Hours vary"'
label define uhrsworkt_lbl 999 `"NIU"', add
label values uhrsworkt uhrsworkt_lbl

label define uhrswork1_lbl 000 `"0 hours"'
label define uhrswork1_lbl 997 `"Hours vary"', add
label define uhrswork1_lbl 999 `"NIU/Missing"', add
label values uhrswork1 uhrswork1_lbl

label define uhrswork2_lbl 997 `"Hours vary"'
label define uhrswork2_lbl 998 `"Missing"', add
label define uhrswork2_lbl 999 `"NIU"', add
label values uhrswork2 uhrswork2_lbl

label define durunem2_lbl 00 `"0"'
label define durunem2_lbl 01 `"1"', add
label define durunem2_lbl 02 `"2"', add
label define durunem2_lbl 03 `"3"', add
label define durunem2_lbl 04 `"4"', add
label define durunem2_lbl 05 `"5"', add
label define durunem2_lbl 06 `"6"', add
label define durunem2_lbl 07 `"7-10"', add
label define durunem2_lbl 08 `"11-14"', add
label define durunem2_lbl 09 `"15-18"', add
label define durunem2_lbl 10 `"19-22"', add
label define durunem2_lbl 11 `"23-26"', add
label define durunem2_lbl 12 `"27-34"', add
label define durunem2_lbl 13 `"35-42"', add
label define durunem2_lbl 14 `"43-50"', add
label define durunem2_lbl 15 `"51-52"', add
label define durunem2_lbl 16 `"Over 52 weeks"', add
label define durunem2_lbl 99 `"NIU"', add
label values durunem2 durunem2_lbl

label define educ_lbl 000 `"NIU or no schooling"'
label define educ_lbl 001 `"NIU or blank"', add
label define educ_lbl 002 `"None or preschool"', add
label define educ_lbl 010 `"Grades 1, 2, 3, or 4"', add
label define educ_lbl 011 `"Grade 1"', add
label define educ_lbl 012 `"Grade 2"', add
label define educ_lbl 013 `"Grade 3"', add
label define educ_lbl 014 `"Grade 4"', add
label define educ_lbl 020 `"Grades 5 or 6"', add
label define educ_lbl 021 `"Grade 5"', add
label define educ_lbl 022 `"Grade 6"', add
label define educ_lbl 030 `"Grades 7 or 8"', add
label define educ_lbl 031 `"Grade 7"', add
label define educ_lbl 032 `"Grade 8"', add
label define educ_lbl 040 `"Grade 9"', add
label define educ_lbl 050 `"Grade 10"', add
label define educ_lbl 060 `"Grade 11"', add
label define educ_lbl 070 `"Grade 12"', add
label define educ_lbl 071 `"12th grade, no diploma"', add
label define educ_lbl 072 `"12th grade, diploma unclear"', add
label define educ_lbl 073 `"High school diploma or equivalent"', add
label define educ_lbl 080 `"1 year of college"', add
label define educ_lbl 081 `"Some college but no degree"', add
label define educ_lbl 090 `"2 years of college"', add
label define educ_lbl 091 `"Associate's degree, occupational/vocational program"', add
label define educ_lbl 092 `"Associate's degree, academic program"', add
label define educ_lbl 100 `"3 years of college"', add
label define educ_lbl 110 `"4 years of college"', add
label define educ_lbl 111 `"Bachelor's degree"', add
label define educ_lbl 120 `"5+ years of college"', add
label define educ_lbl 121 `"5 years of college"', add
label define educ_lbl 122 `"6+ years of college"', add
label define educ_lbl 123 `"Master's degree"', add
label define educ_lbl 124 `"Professional school degree"', add
label define educ_lbl 125 `"Doctorate degree"', add
label define educ_lbl 999 `"Missing/Unknown"', add
label values educ educ_lbl

label define educ99_lbl 00 `"NIU"'
label define educ99_lbl 01 `"No school completed"', add
label define educ99_lbl 04 `"1st-4th grade"', add
label define educ99_lbl 05 `"5th-8th grade"', add
label define educ99_lbl 06 `"9th grade"', add
label define educ99_lbl 07 `"10th grade"', add
label define educ99_lbl 08 `"11th grade"', add
label define educ99_lbl 09 `"12th grade, no diploma"', add
label define educ99_lbl 10 `"High school graduate, or GED"', add
label define educ99_lbl 11 `"Some college, no degree"', add
label define educ99_lbl 12 `"Associate degree, type of program not specified"', add
label define educ99_lbl 13 `"Associate degree, occupational program"', add
label define educ99_lbl 14 `"Associate degree, academic program"', add
label define educ99_lbl 15 `"Bachelors degree"', add
label define educ99_lbl 16 `"Masters degree"', add
label define educ99_lbl 17 `"Professional degree"', add
label define educ99_lbl 18 `"Doctorate degree"', add
label values educ99 educ99_lbl

label define edcyc_lbl 01 `"Less than one year (includes 0 years completed)"'
label define edcyc_lbl 02 `"The first or freshman year"', add
label define edcyc_lbl 03 `"The second or sophmore year"', add
label define edcyc_lbl 04 `"The third or junior year"', add
label define edcyc_lbl 05 `"Four or more years"', add
label define edcyc_lbl 99 `"NIU"', add
label values edcyc edcyc_lbl

label define eddipged_lbl 01 `"Graduated from high school"'
label define eddipged_lbl 02 `"GED or other equivilent"', add
label define eddipged_lbl 99 `"NIU"', add
label values eddipged eddipged_lbl

label define edhgcged_lbl 01 `"Less than 1st grade"'
label define edhgcged_lbl 02 `"1st, 2nd, 3rd, or 4th grade"', add
label define edhgcged_lbl 03 `"5th or 6th grade"', add
label define edhgcged_lbl 04 `"7th or 8th grade"', add
label define edhgcged_lbl 05 `"9th grade"', add
label define edhgcged_lbl 06 `"10th grade"', add
label define edhgcged_lbl 07 `"11th grade"', add
label define edhgcged_lbl 08 `"12th grade (no diploma)"', add
label define edhgcged_lbl 99 `"NIU"', add
label values edhgcged edhgcged_lbl

label define schlcoll_lbl 0 `"NIU"'
label define schlcoll_lbl 1 `"High school full time"', add
label define schlcoll_lbl 2 `"High school part time"', add
label define schlcoll_lbl 3 `"College or university full time"', add
label define schlcoll_lbl 4 `"College or university part time"', add
label define schlcoll_lbl 5 `"Does not attend school, college or university"', add
label values schlcoll schlcoll_lbl

save censusdata

*** merge all
import excel "occ_soc_crosswalk_2018.xlsx", firstrow clear

destring occ, replace
drop if occ==.

merge 1:m occ using censusdata.dta
drop _merge

rename soccode soc

merge m:1 soc using Webb
drop _merge

tab year month

drop if year == 2009 | year == 2020
drop if soc == ""

tab year month

save total_merged_data, replace
