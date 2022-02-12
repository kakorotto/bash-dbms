#!/bin/bash
arr=(Create List table)
#main function
function mainMenu {
PS3="Enter a Choice : "
echo  Please, Enter your choice......
select element in "Create Database" "List Database" "Drop Database" "Connect to Database"
do 
    case $REPLY in 
        1)
            createDB
            mainMenu;;  
        2)  
            listDBs;;
        3) 
            dropDatabase
            mainMenu;;   
        4) connectDatabase ;;
        *) echo " Please Select from menu " ; mainMenu;
    esac
done
}
function createDB {
    echo Enter Name of New Database
    read Name
    if [ -z "${Name}" ]
    then
	    echo It is empty input. Please enter Name...
    else
        if [ -d ./Database/$Name  ]
        then
            echo This Database is already exist
        else
            mkdir ./Database/$Name
            echo Database created successfully!
        fi
    
   fi
}

function listDBs {
    ls ./Database
}
function connectDatabase 
{

  echo  "Enter Database Name: "
  read name

  cd ./Database/$name 2> /dev/null

  if [ $? -eq 0 ]
	then
    echo "Connected to $name Successfully"
    ../../tables.sh $name
  else
    echo "Database $name wasn't found"

  fi
}
### Dropping an existing Database Function
function dropDatabase {
  echo  "Enter Database Name: "
  read name

  if [ -d ./Database/$name ]
	then
	rm -r ./Database/$name 2> /dev/null
        echo "Successful Drop for $name Database"
  else
        echo "Database Not found"
  
 fi
}
mainMenu

