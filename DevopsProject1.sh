#!/bin/bash

#Function to be select option
select_option()
{
        read -p "Select your option from following option:
                1. Adduser
                2. DeleteUser
                3. ModifyUser
                4. AddGroup
                5. DeleteGroup 
		6. Backup" Option
                 if [ "$Option" == "1" ]; then
                        add_user
                elif [ "$Option" == "2" ]; then
                        delete_user
                elif [ "$Option" == "3" ]; then
                        modify_user
                elif [ "$Option" == "4" ]; then
                        group_add
                elif [ "$Option" == "5" ]; then
                        group_delete
		elif [ "$Option" == "6" ]; then
		 	Backup
		 fi
}
# Function to add a new user
add_user()
{
        read -p "Eneter Your UserName:" username
        read -s -p"Eneter Your Password:" password
        sudo useradd -m -p $username $password
        echo "User $username added successfully."
}
# Function to delete the users.
delete_user()
{
        read -p "Eneter your UserName" username
        sudo userdel -r $username
        echo "$username deleted successfully."
}

#Function to modify the existing users
modify_user()
{
        read -p "Eneter your old username:" old_username
             read -p "Do you want to modify thr users (y/n):" User_Modification
        if [ "$User_Modification" == y ]; then
                read -p "Enter your new UserName:" New_UserName
                            sudo usermod -l $New_UserName $old_username
                echo "UserName updated successfully."
        fi
}

#Function to add a new Group
group_add()
{
        read -p "Enter your Group Name:" group_name
        sudo groupadd $group_name
        echo "grpupname $group_name added successfully."
}
#Function to delete a Group
group_delete()
{
        read -p "eneter your Groupname:" groupname
        sudo groupdel $groupname
        echo "groupname $groupname deleted successfully."
}
#Function to take Backup
Backup()
{
src_dir="/home/ubuntu/Projects/project1"
tgt_dir="/home/ubuntu/Projects/Backups"

backup_filename="backup_$(date +%Y-%m-%d-%H-%M-%S).tar.gz"
echo "backup started"
tar -czvf "${tgt_dir}/${backup_filename}" "$src_dir"

echo "backups complete"
}

select_option
#add_user
#delete_user
#modify_user
#group_add
#group_delete
                                                                                      
