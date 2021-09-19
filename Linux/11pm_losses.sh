#!/bin/bash

echo " "
echo "Losses that occured at 11pm"  >> Dealers_working_during_losses
grep "11:00:00 PM" 0310_Dealer_schedule | awk -F'\t' '{print "March 10th: " $1 " "  $3}' >> Dealers_working_during_losses
grep "11:00:00 PM" 0312_Dealer_schedule | awk -F'\t' '{print "March 12th: " $1 " "  $3}' >> Dealers_working_during_losses
