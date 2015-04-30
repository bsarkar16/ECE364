#! /bin/bash
#
#$Author: ee364h10 $
#$Date: 2015-02-19 11:25:04 -0500 (Thu, 19 Feb 2015) $
#$HeadURL: svn+ssh://ece364sv@ecegrid-thin1/home/ecegrid/a/ece364sv/svn/S15/students/ee364h10/Lab05/sort.bash $
#$Revision: 76121 $
if (($#<3))
then
    echo "Error: Insufficient Information"
    exit 1
fi
if (($#>3))
then
    echo "Error: Unknown Option"
    exit 1
fi
if [[ ! -e $2 ]]
then
    echo "Error: $1 is not a readable file"
    exit 1
fi

while getopts f:-: thisopt
do
	echo $OPTARG
	case $thisopt in
          a)filename=$OPTARG;;
          -)val=$(echo $OPTARG  | cut -d'=' -f2)
            echo $val ;;
          *)echo "Invalid arg";;
        esac
done

if (( $val > 4 ))
then
 	echo "Error: Column number $val does not exist"
    	exit 1
fi 
sort -n -k$val,$val $filename >> $filename.sorted

exit 0


