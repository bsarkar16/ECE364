#! /bin/bash
#
#$Author: ee364h10 $
#$Date: 2015-01-29 11:22:48 -0500 (Thu, 29 Jan 2015) $
#$HeadURL: svn+ssh://ece364sv@ecegrid-thin1/home/ecegrid/a/ece364sv/svn/S15/students/ee364h10/Lab02/sorting.bash $
#$Revision: 74589 $
if (($#!=1))
then
    echo "Usage: sorting.bash <input file>"
    exit 1
elif [[ ! -r $1 ]]
then
    echo "Error: $1 is not a readable file"
    exit 2
fi
max_avg=0
choice=0
while (( $choice != 6 ))
do
    echo "./sorting.bash $1"
    echo "Your choices are:"
    echo "1) First 10 people"
    echo "2) Last 5 names by highest zipcode"
    echo "3) Address of 6th-10th by reverse e-mail"
    echo "4) First 12 companies "
    echo "5) Pick a number of people"
    echo "6) Exit"
    read choice
    if (( $choice == 1 ))
    then
	data=$( sort -k7,7 -k5,5 -k2,2 -k1,1 -t ',' $1 )
	echo "$data" | head -n 10
    fi
    if (( $choice == 2 ))
    then
       data=$( sort -n -k8,8 -t ',' $1 ) 
       echo "$data" | tail -n 5 | cut -d"," -f1,2
    fi
    if (( $choice == 3 ))
    then
       data=$( sort -r -k11,11 -t ',' $1 ) 
       echo "$data" | head | tail -n 5 | cut -d"," -f4

    fi
    if (( $choice == 4 ))
    then
       data=$( sort -k3,3 -t ',' $1 ) 
       echo "$data" | head -n 12 | cut -d"," -f3

    fi
    if (( $choice == 5 ))
    then
       echo "Enter a number"
       read num
       data=$( sort -k2,2 -k1,1 -t ',' $1 ) 
       echo "$data" | head -n $num 

    fi
    if (( $choice == 6 ))
    then
       echo "Have a nice day!"
    fi	
     if (( $choice != 1 && $choice != 2 && $choice != 3 && $choice != 4 && $choice != 5 && $choice != 6 ))
    then
       echo "Error! Invalid Selection"
    fi	
done
#echo "The best performance per watt was achieved by $proc $speed at $max_avg"
exit 0

