#!/bin/bash
export PATH_TO_PASSWORDS=/home/$USER/.password_manager
export PASSWORDS="${PATH_TO_PASSWORDS}/passwords.cpt"
export PATH=/home/$USER/git-notes/bin:$PATH

encrypt_file()
{
    # echo "Encrypting file..."
    ccrypt -e "${PATH_TO_PASSWORDS}/passwords"
    return 0
}

decrypt_file()
{
    # echo "Decrypting file..."
    ccrypt -d $PASSWORDS
    return 0
}

read_file()
{
    ccrypt -c $PASSWORDS
    return 0
}

add_entry()
{
    if [[ -f $PASSWORDS ]] ; then
        decrypt_file
    fi
    echo "--New Entry--"
    echo "Account:" ; read new_entry_a
    # if [[ $(grep "$new_entry_a" ${PATH_TO_PASSWORDS}/passwords) ]] ; then
    if [[ "$(cat ${PATH_TO_PASSWORDS}/passwords | cut -d " " -f 1)" = "$grep $new_entry_a)" ]] ; then
        echo "Login:" ; read new_entry_l
        echo "Password:" ; read -s new_entry_p
        echo $new_entry_a' '$new_entry_l' '$new_entry_p >> "${PATH_TO_PASSWORDS}/passwords"
        return 0
    else
        echo "Entry already exists" ; echo "Entry name(s):" ; echo "$(cat ${PATH_TO_PASSWORDS}/passwords | cut -d " " -f 1 | grep $new_entry_a)"
        # echo "Do you still want to add it though? (Y/n)"
        read duplicate_entry
        while true ; do
            case "$duplicate_entry" in
                [Yy]*)
                    echo "Login:" ; read new_entry_l
                    echo "Password:" ; read -s new_entry_p
                    echo $new_entry_a' '$new_entry_l' '$new_entry_p >> "${PATH_TO_PASSWORDS}/passwords"
                    return 0 ;;
                [Nn]*)
                    encrypt_file
                    echo "Entry wasn't added..."
                    break ;;
                *)
                    duplicate_entry=""
                    echo "Please answer with (Y/n)" ;;
            esac
        done
    fi
}

list_entries()
{
    read_file | cut -d " " -f 1
    return 0
}

check_entry()
{
    local file=$(read_file | grep $1)
    if [[ ! -z $file ]] ; then
        echo $file
        return 0
    else
        echo "Entry not found."
        return 1
    fi
}

find_entry()
{
    echo "What Account are you searching?" ; read account
    entry=$(check_entry $account)
    echo -e "============================\nYour login details are:"
    echo "Account: $account"
    echo "Login:$echo "$(echo $entry | cut -d " " -f 2)""
    echo "Password:$echo "$(echo $entry | cut -d " " -f 3)""
    echo "============================"
}

# edit_entry()
# {}

# delete_entry()
# {}

copy_entry()
{
    echo -e "\nWhat accounts password do you want to copy to clipboard to?" ; read clipboard
    local entry=$(check_entry $clipboard)
    echo "$(echo $entry | cut -d " " -f 3)" | xclip -sel clip
    echo -e "Password copied to clipboard for 12 seconds.\nAfter this time, the clipboard will be cleared."
    sleep 12
    echo "" | xclip -sel clip
    echo -e "Clipboard cleared!\n"
}

generate_entry()
{
    apg -M SNCL -n $1 -a 0 -t -E '{}[]<>/\' -m $2 -x $2
}

info_screen()
{
    # echo -e "\nWelcome to this totally reliable password manager\nYou can do the following things in this marvellous program!\n"
    echo -e "- Add a new entry (add)\n- List all entries (list)\n- Search for an entry (find)\n- Edit an entry (edit)"
    echo -e "- Delete an entry (delete)\n- Copy an entry to clipboard (copy)\n- Generate a password (generate)\n- Exit (exit)"
    echo -e "- See this list again (help)\n"
}

if [[ ! -f $PASSWORDS ]] ; then
    echo "You don't have a password-file. Do you want to create one? (Y/n)"
    while true ; do
        read create
        case "$create" in
            [Yy]*)
                create=""
                if [[ ! -f "${PATH_TO_PASSWORDS}/passwords" ]] ; then
                    echo "Passwordfile of $USER" > "${PATH_TO_PASSWORDS}/passwords" ; echo "File created!"
                else
                    echo "Unencrypted file located. Being renamed."
                    mv "${PATH_TO_PASSWORDS}/passwords" "${PATH_TO_PASSWORDS}/passwords.bac"
                    echo "" > "${PATH_TO_PASSWORDS}/passwords" ; echo "New file created!"
                fi
                while true ; do
                    echo "Do you want to add an entry? (Y/n)" ; read query
                    case "$query" in
                        [Yy]*)
                            add_entry
                            query="" ;;
                        [Nn]*)
                            echo "Saving and encrypting file..."
                            encrypt_file
                            exit ;;
                        *)
                            query=""
                            echo "Please answer with (Y/n)" ;;
                    esac
                done
                ;;
            [Nn]*)
                echo "File creation aborted. Exiting..."
                exit ;;
            *)
                create=""
                echo "Please answer with (Y/n)" ;;
        esac
    done
fi

# If arguments are given, check for the argument
case "$1" in
    add)
        add_entry
        exit 0 ;;
    list|ls)
        list_entries
        exit 0 ;;
    find)
        find_entry
        exit 0 ;;
    edit)
        echo -e "\nWork in progress...\n"
        exit 0 ;;
    delete|del)
        echo -e "\nWork in progress...\n"
        exit 0 ;;
    copy|cp)
        copy_entry
        exit 0 ;;
    generate|gen)
        generate_entry $2 $3
        exit 0 ;;
    help)
        info_screen
        exit 0 ;;
esac

# If no arguments are given, ask user for input
# info_screen
# 
# while true ; do
#     echo -e "What do you want to do? (Type \"help\" to see the list of options)"
#     read user_input
#     case "$user_input" in
#         add)
#             decrypt_file
#             add_entry
#             while true ; do
#                 echo "Do you want to add another entry? (Y/n)" ; read query
#                 case "$query" in
#                     [Yy]*)
#                         add_entry ;;
#                     [Nn]*)
#                         break ;;
#                     *)
#                         query=""
#                         echo "Please answer with (Y/n)" ;;
#                 esac
#             done
#             encrypt_file ;;
#         list|ls)
#             list_entries ;;
#         find)
#             find_entry ;;
#         edit)
#             echo -e "\nWork in progress...\n" ;;
#         delete|del)
#             echo -e "\nWork in progress...\n" ;;
#         copy|cp)
#             copy_entry ;;
#         generate|gen)
#             read password_count ; read password_len ; generate_entry $password_count $password_len ;;
#         exit)
#             exit ;;
#         help)
#             info_screen ;;
#         *)
#             echo "Action not recognized. Please try again." ;;
#     esac
# done