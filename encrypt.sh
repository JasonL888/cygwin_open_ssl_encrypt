#!/usr/bin/bash
function encrypt
{
	filename=$1
	echo $filename
	if [ ! -f $filename.bin ]; then
        echo "encrypting $filename"
        time openssl enc -aes-256-cbc -a -salt -in $filename -out $filename.bin -pass pass:$password
    else
        echo "Skipping ... $filename already encrypted"
    fi
}

echo "Type in password, followed by [ENTER]:"
read password

if [ $# -eq 0 ]; then
	for file in `ls *.avi *.mpg *.wmv *.mp4 *.mov *.mkv`;
	do
		encrypt $file
	done
else
    if [ $# -eq 1 ]; then
        encrypt $1 
    else
        echo "Usage: encrypt.sh [filename]"
        echo "no arguments will decrypt all files"
    fi
fi

#rm *.avi


