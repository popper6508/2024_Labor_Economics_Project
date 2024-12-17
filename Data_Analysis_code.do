**************************************************************
************************ Analysis Code ***********************
********************** Labor Economics 1 *********************
************************ Final Project ***********************
**************************************************************

cd "C:\Users\A\Desktop\Labor Economics Project\Data"

use total_merged_data, clear

keep year month soc occ hwtfinl cpsidp mish statefip statecensus county metfips age sex race uhrsworkt uhrswork1 educ Webb gqtype faminc hrhhid hrhhid2 relate empstat labforce // 필요한 변수 가져오기

** 1. 데이터 전처리
drop if gqtype==. | Webb == .
drop if labforce == 1

gen after = 1
replace after = 0 if year <= 2021 | (year == 2022 & month <= 11)  // ChatGPT 등장 이후를 나타내는 변수 생성

gen year_month_numeric = ym(year, month)
format year_month_numeric %tmMon_CCYY // 월에 대한 변수 생성

drop if uhrswork1 == 999 | uhrswork1 == 997

drop if uhrsworkt == 999 | uhrsworkt == 997 // 노동시간을 식별할 수 없는 샘플 제거

sum uhrswork1, d
drop if uhrswork1 < r(p1) | uhrswork1 > r(p99)

sum uhrsworkt, d
drop if uhrsworkt < r(p1) | uhrsworkt > r(p99)
// 아웃라이어 제거

desctable age i.sex i.faminc uhrsworkt uhrswork1 i.educ, filename("Descriptive_statistics.xlsx") stats(mean median sd min max)
// 기초통계량

desctable i.year_month_numeric, filename("Sample_size.xlsx") stats(freq)
// 월별 샘플 사이즈

bys year_month_numeric : egen avg_work_hrs = mean(uhrswork1)

twoway (line avg_work_hrs year_month_numeric, lwidth(medium) msymbol(o)) ///
    , title("Average Work Hours by Year-Month") ///
      xtitle("Year-Month") ytitle("Average Work Hours") ///
      xlabel(, angle(45))
/// 시간에 따른 노동시간 변화 그래프
	  
sum Webb, de

* Analysis
xtset cpsidp year_month_numeric

reg uhrswork1 c.Webb##after
outreg2 using "Total_results.xlsx", append excel

reg uhrswork1 c.Webb##after i.year_month_numeric
outreg2 using "Total_results.xlsx", append excel

xtreg uhrswork1 c.Webb##after, fe
outreg2 using "Total_results.xlsx", append excel

xtreg uhrswork1 c.Webb##after age i.faminc i.educ, fe
outreg2 using "Total_results.xlsx", append excel

xtreg uhrswork1 c.Webb##after i.faminc i.educ if age <= 30, fe
outreg2 using "Sample_split.xlsx", append excel

xtreg uhrswork1 c.Webb##after i.faminc i.educ if age <= 40 & age > 30, fe
outreg2 using "Sample_split.xlsx", append excel

xtreg uhrswork1 c.Webb##after i.faminc i.educ if age <= 50 & age > 40, fe
outreg2 using "Sample_split.xlsx", append excel

xtreg uhrswork1 c.Webb##after i.faminc i.educ if age <= 60 & age > 50, fe
outreg2 using "Sample_split.xlsx", append excel

xtreg uhrswork1 c.Webb##after i.faminc i.educ if age <= 60 & age > 50, fe
outreg2 using "Sample_split.xlsx", append excel

xtreg uhrswork1 c.Webb##i.year_month_numeric i.faminc i.educ if age > 60, fe
outreg2 using "Event_study.xlsx", append excel
	
coefplot , ///
    keep(733.year_month_numeric#c.Webb 734.year_month_numeric#c.Webb 735.year_month_numeric#c.Webb ///
         736.year_month_numeric#c.Webb 737.year_month_numeric#c.Webb 738.year_month_numeric#c.Webb ///
         739.year_month_numeric#c.Webb 740.year_month_numeric#c.Webb 741.year_month_numeric#c.Webb ///
         742.year_month_numeric#c.Webb 743.year_month_numeric#c.Webb 744.year_month_numeric#c.Webb ///
         745.year_month_numeric#c.Webb 746.year_month_numeric#c.Webb 747.year_month_numeric#c.Webb ///
         748.year_month_numeric#c.Webb 749.year_month_numeric#c.Webb 750.year_month_numeric#c.Webb ///
         751.year_month_numeric#c.Webb 752.year_month_numeric#c.Webb 753.year_month_numeric#c.Webb ///
         754.year_month_numeric#c.Webb 755.year_month_numeric#c.Webb 756.year_month_numeric#c.Webb ///
         757.year_month_numeric#c.Webb 758.year_month_numeric#c.Webb 759.year_month_numeric#c.Webb ///
         760.year_month_numeric#c.Webb 761.year_month_numeric#c.Webb 762.year_month_numeric#c.Webb ///
         763.year_month_numeric#c.Webb 764.year_month_numeric#c.Webb 765.year_month_numeric#c.Webb ///
         766.year_month_numeric#c.Webb 767.year_month_numeric#c.Webb 768.year_month_numeric#c.Webb ///
         769.year_month_numeric#c.Webb 770.year_month_numeric#c.Webb 771.year_month_numeric#c.Webb ///
         772.year_month_numeric#c.Webb 773.year_month_numeric#c.Webb 774.year_month_numeric#c.Webb) ///
    title("Event Study") ///
    xlabel(, nolabels noticks) ///
    xtitle("") ///
    ytitle("Coefficient") ///
    xline(23, lcolor(red)) /// 
    ciopts(recast(rcap) lcolor(black) lwidth(thin)) ///  // Confidence intervals as lines
    msymbol(O) mcolor(black) lcolor(black) ///  // Black dots
    connect(l) lcolor(black) lwidth(medium) ///
	yline(0.0, lcolor(blue)) ///
    vertical
/// Event Study Coefficient Plot 만들기
