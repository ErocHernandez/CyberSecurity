given_time=$1
given_date=$2

file_name="$2_Dealer_schedule"
echo "$given_time $file_name"
echo "Enter the number associated with the game:"
echo "1: Black Jack"
echo "2: Roulette"
echo "3: Texas Hold'em"
read game
add=$((game+1))
 
case $game in

  1)
    grep "$give_time" "$file_name" | awk -F'\t' '{print $2" "$3" "$4}' | awk -F' ' '{print $1" "$2}'
    ;;

  2)
    grep "$give_time" "$file_name" | awk -F'\t' '{print $2" "$3" "$4}' | awk -F' ' '{print $3" "$4}'
    ;;

  3)
    grep "$give_time" "$file_name" | awk -F'\t' '{print $2" "$3" "$4}' | awk -F' ' '{print $5" "$6}'
    ;;
esac


#grep "$give_time" "$file_name" | awk -F'\t' '{print $2" "$3" "$4}' | awk -F' ' '{print $1" "$2}'



