#!/usr/bin/bash

echo "Type in password, followed by [ENTER]:"
read password


for filename in `ls *.avi *.mpg *.wmv *.mp4 *.mov *.mkv`;
do
    if [ ! -f $filename.bin ]; then
        echo "encrypting $filename"
        time openssl enc -aes-256-cbc -a -nopad -salt -in $filename -out $filename.bin -pass pass:$password
    else
        echo "Skipping ... $filename already encrypted"
    fi
done

#rm *.avi


