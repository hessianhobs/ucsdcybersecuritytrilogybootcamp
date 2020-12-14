# The following script passes two arguments. The first is for the specified date - 0310, 0312, and 0315. The second is for the specified time. The analysis results in easily finding the roulette dealer
# at a specified time. 


awk -F" " '{print$1,$2,$3,$6,$7}' losses_Dealer_Schedules_DateAdd | grep $1 | grep $2 | grep $3  # Print columns date, time, ante / post meridiem (AM/PM), Dealer's First Name, Last Name.
												# Print contents containing date, time, and ante / post meridiem. 
