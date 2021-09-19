given_date=$1
given_time=$2
file_name="$1_Dealer_schedule"

grep "$given_time" "$file_name"
