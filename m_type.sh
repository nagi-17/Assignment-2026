#!/bin/bash

RANDOM=$$

loop_function() {
	text_easy=("cat" "dog" "run" "sun" "box" "pen" "cup" "hat" "red" "bus" "tree" "book" "door" "fish" "bird" "star" "moon" "rain" "wind" "snow" "apple" "water" "house" "table" "chair" "phone" "clock" "shoe" "shirt" "pants" "happy" "smile" "laugh" "good" "fast" "slow" "stop" "play" "jump" "walk" "blue" "green" "cold" "warm" "day" "night" "food" "milk" "cake" "song")

	text_med=("active" "adjust" "array" "audio" "blind" "board" "bridge" "cache" "chord" "class" "client" "custom" "damage" "doubt" "effort" "fault" "figure" "growth" "habit" "height" "index" "jacket" "joint" "knock" "label" "linux" "macro" "margin" "match" "motor" "music" "native" "object" "ocean" "packet" "phase" "python" "quiet" "random" "rapid" "scale" "script" "sensor" "server" "syntax" "system" "tempo" "theme" "unique" "weight")

	text_hard=("algorithm" "ambiguous" "compile" "bandwidth" "capacitor" "concurrent" "database" "debugging" "dynamic" "efficiency" "encrypt" "equation" "execute" "framework" "frequency" "function" "generate" "hardware" "heuristic" "implement" "increment" "integrate" "interface" "iteration" "latency" "library" "logical" "matrix" "memory" "module" "network" "optimize" "parallel" "parameter" "pointer" "protocol" "recursion" "repository" "resistance" "routing" "scalable" "segment" "semantic" "sequence" "simulate" "syntax" "terminal" "variable" "velocity" "virtual")

	text=("")

	echo "WELCOME TO MONKEY TYPE"
	echo -n "Choose level (easy(e)/med(m)/hard(h) --> default level=HARD) : "
	read level

	if [[ "$level" == "e" ]]
	then
		text=("${text_easy[@]}")
	elif [[ "$level" == "m" ]]
	then
		text=("${text_med[@]}")
	else
		text=("${text_hard[@]}")
	fi

	echo -n "Input the number of words you want to be displayed in the test (>5 and <30): "
	read n
	if [[ $n -lt 5 || $n -gt 30 ]]
	then
		echo "WRONG INPUT : Input not within the specified range or is of wrong format"
		return
	fi

	echo ""

	text_array=()

	for (( i=1; i<=$n; i++ ));
	do
		x=$(($RANDOM%50))
		text_array+=("${text[$x]}")
	done
	for (( i=0; i<$n; i++ ));
	do
		if [[ $i -eq $((n-1)) ]]
		then
			echo "${text_array[$i]}"
		else
			echo -n "${text_array[$i]} "
		fi
	done
	echo ""

	echo -n "Press ENTER to start..."
	read a
	if [[ "$a" == "" ]]
	then
		input_temp=""
		count_backspace=0
		s_input=()	
		SECONDS=0
		while true;
		do
			if [[ ${#s_input[@]} -ge $n ]]
			then
				break
			fi
			IFS= read -n 1 char_input
			if [[ "$char_input" == " " ]]
			then
				s_input+=(${input_temp})
				input_temp=""
				continue
			fi
			if [[ "$char_input" == $'\x7f' ]]
			then
				if [[ "${input_temp}" == "" ]]
				then
					last_index=$((${#s_input[@]}-1))
					input_temp="${s_input[$last_index]}"
					unset 's_input[$last_index]'
				else
					input_temp="${input_temp%?}"
				fi
				((count_backspace++))
				echo -e -n "\b\b  \b\b\b \b"
				continue
			fi
			input_temp="${input_temp}${char_input}"
			if [[ "$char_input" == "" ]]
			then
				s_input+=(${input_temp})
				break
			fi
		done

		echo ""

		time=$SECONDS
		words=${#s_input[@]}

		correct_char=0
		char_typed=0

		for (( i=0; i<$n; i++))
		do
			len_t=${#text_array[$i]}
			len_i=${#s_input[$i]}
			s_t="${text_array[$i]}"
			s_i="${s_input[$i]}"
			((char_typed+=$len_i))
			min_len=$len_i
			if [[ $len_i -ge $len_t ]]
			then
				min_len=$len_t
			fi
			for (( j=0; j<$min_len; j++ ))
			do
				if [[ "${s_i:$j:1}" == "${s_t:$j:1}" ]]
				then
					((correct_char++))
				fi
			done
		done

		((char_typed+=$count_backspace))

		if [[ $char_typed -eq 0 ]]
		then
			accuracy=0
		else
			accuracy=$(echo "scale=2; ($correct_char*100)/$char_typed" | bc)
		fi
		echo "Correct = ${correct_char}"
		echo "Typed_char = ${char_typed}"
		echo "Accuracy = ${accuracy}"
		if [[ $time -eq 0 ]]
		then
			raw_wpm=0
			net_wpm=0
		else
			raw_wpm=$(echo "scale=2; ($char_typed*12)/$time" | bc)
			net_wpm=$(echo "scale=2; ($correct_char*12)/$time" | bc)
		fi
		echo "Raw WPM = $raw_wpm"
		echo "Net WPM = $net_wpm"
	fi
}

while true; 
do
	loop_function
	echo "Do you want to repeat this test (yes(y)/no(n)) ?"
	read repeat
	if [[ $repeat == "n" ]]
	then 
		break
	fi
done
