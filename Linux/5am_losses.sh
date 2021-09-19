#!/bin/bash

echo "Losses that occurred at 5 AM: " >> Dealers_working_during_losses
grep "05:00:00 AM" 0310_Dealer_schedule | awk -F'\t' '{print "March 10th: " $1 " "  $3}' >> Dealers_working_during_losses
grep "05:00:00 AM" 0312_Dealer_schedule | awk -F'\t' '{print "March 12th: " $1 " "  $3}' >> Dealers_working_during_losses
grep "05:00:00 AM" 0315_Dealer_schedule | awk -F'\t' '{print "March 15th: "$1 " "  $3}' >> Dealers_working_during_losses


