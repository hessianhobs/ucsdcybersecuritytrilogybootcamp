# A script using awk, pipes, and grep.
# awk calls on the time, AM/PM,  Roulette First Name and Last Name Columns.
# Pipe | transitions the awk results into the next grep command.
# grep passes arugment by times matching player anomolies at 05:00:00 AM, 08:00:00 AM, 02:00:00 PM, 08:00:00 PM, & 11:00:00 PM.

 awk -F" " '{print$1,$2,$5,$6}' losses_Dealer_Schedules| grep $1 | grep $2 >> Dealers_working_during_losses   
