
# This script prints three arguments in case there is future fraud on the other Lucky Duck games. 
# The first argument is specific time by the specific ante / post meriediem AM /PM. The third argument is specific date. The last and fourth argument is casino game being played.
# First print all nine columns in losses_Dealer_Schedules_DateADD. Next, pipe  a grep command for the first argument. Third, continue pipe and pass argument to second grep command. Complete the last
# pipe  and pass the argument to the last awk command for casino game being played.
awk -F" " '{print$1,$2,$3,$4,$5,$6,$7,$8,$9}' losses_Dealer_Schedules_DateAdd | grep $1 |grep $2|  grep $3 | awk -F" " $4  
