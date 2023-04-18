install.packages("arules")
library("arules")
install.packages("arulesViz")
library("arulesViz")
library(datasets)
data("Groceries")
?Groceries
nrow(Groceries)
ncol(Groceries)
fix(Groceries)
str(Groceries)
itemFrequencyPlot(Groceries,top = 20,type="absolute")
?apriori###POWER FUL ALGO created by R Agarwal and R Srikant
gr_rules <- apriori(Groceries)
##changing the supp and conf values
gr_rules <- apriori(Groceries, parameter = list(supp = .001, conf = .8))
inspect(gr_rules[1:5])##Top 5 rules that explains relation between lhs and rhs
##if lift is > 1 then it is a "GOOD RULE" else not
##do for 10
inspect(gr_rules[1:10])
###SORTING RULES
gr_rules <- sort(gr_rules, by = "support", decreasing = T)
inspect(gr_rules[1:10])
##IDENTIFIYING DUP RULES and REMOVING
?is.redundant
gr_rules
reduntant_rules <- is.redundant(gr_rules)
reduntant_rules
summary(reduntant_rules)
gr_rules <- gr_rules[!reduntant_rules]
gr_rules
##we can constantly keep our var in "LHS" and check the rhs
########
##VISUALISATION##
######
plot(gr_rules, method = "graph")
plot(gr_rules, method = "graph", interactive = T)
##GREEN circles are the most frequent one's to buy
plot(gr_rules)##Scatter Plot
plot(gr_rules, method="grouped")
