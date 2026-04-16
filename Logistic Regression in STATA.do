* Importing Data from Excel CSV
import delimited "C:\Users\Administrator\Desktop\Data Science\heart_disease.csv", clear
* Checking the Data
describe
* Summary of the data
summarize
* Dealing with strings
destring education cigsperday bpmeds totchol bmi heartrate glucose, replace force
*Check the new  dataset
describe
Summarize
summarize
clear
* Import data
import delimited "C:\Users\Administrator\Desktop\Data Science\heart_disease.csv", clear
destring education cigsperday bpmeds totchol bmi heartrate glucose, replace force
summarize
foreach var in bmi glucose totchol heartrate education cigsperday bpmeds {
    summarize `var', detail
    replace `var' = r(p50) if missing(`var')
}
summarize
foreach var in bmi glucose totchol heartrate education cigsperday bpmeds {egen mode_`var' = mode(`var')
replace `var' = mode_`var' if missing(`var') drop mode_`var'}
summarize
save "C:\Users\Administrator\Desktop\Data Science\heart_disease.dta"
graph bar (count), over(male) over(tenyearchd)
graph bar (count), over(tenyearchd) over(male)
graph bar (count), over(male)
label define sexlbl 0 "Female" 1 "Male"
label values male sexlbl
graph bar (count), over(male)
label define sexlbl 0 "Female" 1 "Male"
label values male sexlbl
graph bar (count), over(male) title("Counts by Gender")
graph bar (count), over(currentsmoker) title("Counts of Current Smokers")
label define smokelbl 0 "Non-smoker" 1 "Smoker"
label values currentsmoker smokelbl
graph bar (count), over(currentsmoker) title("Counts of Current Smokers") ytitle("Number of Observations")
graph box sysbp, title("Boxplot of Systolic Blood Pressure")
graph bar (count), over(tenyearchd) title("Counts of 10-Year Heart Disease")
graph bar (count), over(male)
label define sexlbl 0 "Female" 1 "Male"
graph bar (count), over(male) title("Counts by Gender")
graph bar (count), over(currentsmoker) title("Counts of Current Smokers")
graph bar (count), over(male) title("Counts by Gender")
graph bar (count), over(currentsmoker) title("Counts of Current Smokers")
logit tenyearchd male age bmi sysbp diabp currentsmoker diabetes
logit tenyearchd male education age bmi sysbp diabp currentsmoker diabetes
