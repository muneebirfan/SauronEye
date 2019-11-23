

# Just a certificate searching tool.

if [[ -z $1 ]] || [[ $1 == "-h" ]] || [[ $1 == "--help" ]];
	then
		echo "Usage:  $0 [target]"
		echo "        $0 -f [target_file]"
		echo "        $0 -h or --help"
else
	if [[ $1 == "-f" ]]
		then
			if [[ -e $2 ]] && [[ -s $2 ]];
				then
					for i in {1..5}; do
						while read domain; do
							curl -s https://crt.sh/?q=%25.$domain | grep $domain | grep TD | sed -e 's/<//g' | sed -e 's/>//g' | sed -e 's/TD//g' | sed -e 's/\///g' | sed -e 's/ //g' | sed -n '1!p' | sort -u
						done < $2
					done
			else
				echo "$2 does not exist or may be empty"
			fi
	else
		curl -s https://crt.sh/?q=%25.$1 | grep $1 | grep TD | sed -e 's/<//g' | sed -e 's/>//g' | sed -e 's/TD//g' | sed -e 's/\///g' | sed -e 's/ //g' | sed -n '1!p' | sort -u
	fi
fi
