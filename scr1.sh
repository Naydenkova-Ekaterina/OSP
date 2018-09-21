#!/usr/bin/ksh
ERRORS=$HOME/lab1_err

while true
do
[ -f $ERRORS ] && FILE=$ERRORS || FILE=/dev/null
   echo 'Menu:
1. Print current directory name.
2. Change current directory.
3. Print current directory content.
4. Create a symbolic link to the file.
5. Execute the command entered.
6. Quit.'
echo "Enter number:"; 
   read code || exit -1
   case $code in
      1)  pwd 2>>$FILE  || echo "Cannot print directory name" >&2 ;;
      2) echo "Directory name:" ; read path 
	 cd "$path"  2>>$FILE || echo "Cannot change directory" >&2 ;;
      3)  ls 2>>$FILE || echo "Cannot print content" >&2 ;;
      4) 
         echo "Print file name:"; read fileName
	 echo "Print link name:"; read link
         [ -f "$fileName" ] && ln -s "$fileName" "$link" 2>>$FILE || 
                  echo "No such file: $fileName" >&2 ;;         
      5) 
         echo "Print command:"; read com
         $com 2>>$FILE || echo "Cannot execute the command" >&2 ;;
      6) exit 0 ;;
      *) echo "Wrong number" >&2 ;;
   esac 
done

