#!/usr/bin/bash
function decrypt 
{
        basefilename=`basename $1 .bin`
        echo $basefilename
        if [ -f $1 ]; then
            if [ ! -f $basefilename ]; then 
                echo "decrypting $1"
                time openssl enc -d -aes-256-cbc -a -in $1 -out $basefilename -pass pass:$password
            else
                echo "already decrypted ... skipping $1"
            fi
        else
            echo "no such file[$1] ... skipping $1"
        fi

}


echo "Type in password, followed by [ENTER]:"
read password

if [ $# -eq 0 ]; then
    echo "No arguments, decrypting all files"

    for filename in `ls *.bin`;
    do
        decrypt $filename
    done
else
    if [ $# -eq 1 ]; then
        decrypt $1 
    else
        echo "Usage: decrypt.sh [filename]"
        echo "no arguments will decrypt all files"
    fi
fi

echo "decryption completed"
