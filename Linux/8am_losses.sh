#!/bin/bash

echo " "
echo "Losses that occured at 8am: "  >> Dealers_working_during_losses
grep "08:00:00 AM" 0310_Dealer_schedule | awk -F'\t' '{print "March 10th: " $1 " "  $3}' >> Dealers_working_during_losses
grep "08:00:00 AM" 0312_Dealer_schedule | awk -F'\t' '{print "March 12th: " $1 " "  $3}' >> Dealers_working_during_losses
grep "08:00:00 AM" 0315_Dealer_schedule | awk -F'\t' '{print "March 15th: " $1 " "  $3}' >> Dealers_working_during_losses
