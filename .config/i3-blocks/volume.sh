#!/bin/bash

make_strikethrough(){
	echo "<span strikethrough=\"true\">$1</span>"

}

percent=$(amixer -D pulse sget Master | awk -F"[][]" '{print $2}' | tail -n 1);

text="Volume:${percent}"

status=$(amixer -D pulse sget Master | awk -F"[][]" '{print $4}' | tail -n 1);
if [ $status == off ]; then
        echo $(make_strikethrough $text);
else
        echo $text;
fi

