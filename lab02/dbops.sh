

function authenticate {
	echo "Authentication.."
}

function querystudent {
	echo "Now query"
	echo -n "Enter student name to query GPA : "
	read NAME
	##We want to get line from datafile starts with NAME followed by :
	LINE=$(grep "^${NAME}:" datafile)
	if [ -z ${LINE} ]
	then
		echo "Error, student name ${NAME} not found"
	else
		GPA=$(echo ${LINE} | awk ' BEGIN { FS=":" } { print $2 } ')
		echo "GPA for ${NAME} is ${GPA}"
	fi
}

function insertstudent {
	echo "Inserting a new student"
	echo -n "Enter name : " 
	read NAME
	echo -n "Enter GPA : "
	read GPA
	checkFloatPoint ${GPA}
	VALID=${?}
	### Before adding, we want to check GPA valid floating point or no
	if [ ! ${VALID} ]
	then
	    echo "GPA should be float number"
	else
	    echo "${NAME}:${GPA}" >> datafile
	fi
}

function deletestudent {
	echo "Deleting an existing student"
	echo -n "Enter studen to delete : "
	read NAME
	##We want to get line from datafile starts with NAME followed by :
        LINE=$(grep "^${NAME}:" datafile)
        if [ -z ${LINE} ]
        then
                echo "Error, student name ${NAME} not found"
        else
		##BEfore delete, print confirmation message to delete or no
		echo "are your sure you want to delete?y:n"
		read CONFIRM
		if [ ${CONFIRM} == "y" ]
		then
			##-v used to get lines DOES NOT contain regex
			grep -v "^${NAME}:" datafile > /tmp/datafile
			cp /tmp/datafile datafile
			rm /tmp/datafile
			echo "student deleted"
		fi
        fi
}

function updatestudent {
	echo "Updating an existing student"
	echo -n "Enter student to update : "
        read NAME
	LINE=$(grep "^${NAME}:" datafile)
        if [ -z ${LINE} ]
	then
                echo "Error, student name ${NAME} not found"
        else
                ##BEfore update, print confirmation message to update or no
		echo "Enter new GPA:"
		read GPA
		checkFloatPoint ${GPA}
        	VALID=${?}
		### Before adding, we want to check GPA valid floating point or no
        	if [ ! ${VALID} ]
        	then
            		echo "GPA should be float number"
        	else
			echo "are your sure you want to update?y:n"
                	read CONFIRM
                	if [ ${CONFIRM} == "y" ]
                	then
                        	##-v used to get lines DOES NOT contain regex
                        	grep -v "^${NAME}:" datafile > /tmp/datafile
                        	cp /tmp/datafile datafile
	                        rm /tmp/datafile
				echo "${NAME}:${GPA}" >> datafile
        	                echo "student updated"
                	fi
        	fi
        fi

}
