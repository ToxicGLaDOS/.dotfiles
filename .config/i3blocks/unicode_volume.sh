strike='\u0336'

make_strikethrough (){
        local striked=""
        local chars=$(echo -n "$1" | sed -e 's/\(.\)/\1\n/g' | head -n -1)
        for char in $chars
        do
                striked="${striked}${char}${strike}"
        done
        striked="${striked}$(echo -n "$1" | sed -e 's/\(.\)/\1\n/g' | tail -n 1)"
        echo "$striked"
}

while true;  do
percent=$(amixer -D pulse sget Master | awk -F"[][]" '{print $2}' | tail -n 1);

text="Volume:${percent}"

status=$(amixer -D pulse sget Master | awk -F"[][]" '{print $4}' | tail -n 1)
if [ $status == off ]; then
	echo -e $(make_strikethrough $text);
else
	echo -e $text
fi
done;
