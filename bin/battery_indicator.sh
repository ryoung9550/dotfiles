#!/bin/bash
# modified from http://ficate.com/blog/2012/10/15/battery-life-in-the-land-of-tmux/

HEART='▇'

if [[ `uname` == 'Linux' ]]; then
  current_charge=$(cat /proc/acpi/battery/BAT1/state | grep 'remaining capacity' | awk '{print $3}')
  total_charge=$(cat /proc/acpi/battery/BAT1/info | grep 'last full capacity' | awk '{print $4}')
else
  battery_info=`ioreg -rc AppleSmartBattery`
  current_charge=$(echo $battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
  total_charge=$(echo $battery_info | grep -o '"MaxCapacity" = [0-9]\+' | awk '{print $3}')
  is_charging=$(echo $battery_info | grep -o '"IsCharging" = [A-Za-z]\+' | awk '{print $3}')
fi



charged_slots=$(echo "((($current_charge/$total_charge)*10)/3)+1" | bc -l | cut -d '.' -f 1)
if [[ $charged_slots -gt 4 ]]; then
  charged_slots=4
fi

# Exit if total charge is null
if [[ -z $total_charge ]]; then
	exit
fi

if [[ "$is_charging" == "No" ]]; then
	echo -n '#[fg=colour40]╡'
	for i in `seq 1 $charged_slots`; do echo -n "$HEART"; done

	if [[ $charged_slots -lt 4 ]]; then
	  echo -n '#[fg=colour248]'
	  for i in `seq 1 $(echo "4-$charged_slots" | bc)`; do echo -n "$HEART"; done
	fi
	echo -n '#[fg=colour40]╞'
else
	echo -n "#[fg=colour226]╡$HEART$HEART$HEART${HEART}╞"
fi

