#!/bin/bash

RANDOM=$$

loop_function() {
	text_easy=("cat" "dog" "run" "sun" "box" "pen" "cup" "hat" "red" "bus" "tree" "book" "door" "fish" "bird" "star" "moon" "rain" "wind" "snow" "apple" "water" "house" "table" "chair" "phone" "clock" "shoe" "shirt" "pants" "happy" "smile" "laugh" "good" "fast" "slow" "stop" "play" "jump" "walk" "blue" "green" "cold" "warm" "day" "night" "food" "milk" "cake" "song")

	text_med=("active" "adjust" "array" "audio" "blind" "board" "bridge" "cache" "chord" "class" "client" "custom" "damage" "doubt" "effort" "fault" "figure" "growth" "habit" "height" "index" "jacket" "joint" "knock" "label" "linux" "macro" "margin" "match" "motor" "music" "native" "object" "ocean" "packet" "phase" "python" "quiet" "random" "rapid" "scale" "script" "sensor" "server" "syntax" "system" "tempo" "theme" "unique" "weight")

	text_hard=("algorithm" "ambiguous" "compile" "bandwidth" "capacitor" "concurrent" "database" "debugging" "dynamic" "efficiency" "encrypt" "equation" "execute" "framework" "frequency" "function" "generate" "hardware" "heuristic" "implement" "increment" "integrate" "interface" "iteration" "latency" "library" "logical" "matrix" "memory" "module" "network" "optimize" "parallel" "parameter" "pointer" "protocol" "recursion" "repository" "resistance" "routing" "scalable" "segment" "semantic" "sequence" "simulate" "syntax" "terminal" "variable" "velocity" "virtual")

	text=("")

	echo "WELCOME TO MONKEY TYPE"
	echo "Choose level (easy(e)/med(m)/hard(h)) : "
	read level

	if [ $level == 'e' ]
	then
		text=("${text_easy[@]}")
	elif [ $level == 'm' ]
	then
		text=("${text_med[@]}")
	else
		text=("${text_hard[@]}")
	fi

	echo "Input the number of words you want to be displayed in the test (>5 and <30): "
	read n	

	string=""
	temp=" "

	for (( i=1; i<=$n; i++ ));
	do
		x=$(($RANDOM%50))
		if [ $i -eq 1 ]
		then
			string="${string}${text[$x]}"
		else
			string="${string}${temp}${text[$x]}"
		fi
	done

	echo "${string}"
	echo "Print ENTER to start"
	read a

	SECONDS=0

	read s_input

	time=$SECONDS
	len_input=${#s_input}
	len_text=${#string}
	len=$len_input

	if [ $len_input -ge $len_text ]
	then
		len=$len_text
	fi

	words=0

	for (( i=1; i<$len; i++))
	do
		if [[ "${s_input:$i:1}" == " " ]]
		then
			if [[ "${s_input:$i-1:1}" != " " ]]
			then
				((words++))
			fi
		fi
	done

	((words++))

	correct=0

	for (( i=0; i<$len; i++));
	do
		if [[ "${s_input:$i:1}" == "${string:$i:1}" ]]
		then
			((correct++))
		fi
	done

	accuracy=$(echo "scale=2; ($correct*100)/$len" | bc)
	wpm=$(echo "scale=2; ($words*60)/$time" | bc)

	echo "Accuracy = ${accuracy}%"
	echo "WPM = $wpm"
}

while true; 
do
	loop_function
	echo "Do you want to repeat this test (yes(y)/no(n)) ?"
	read repeat
	if [ $repeat == 'n' ]
	then 
		break
	fi
done
