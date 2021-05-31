```bash
ccrypt -e <file>        # Encrypts the file with a password
ccrypt -d <file.cpt>    # Decrypts the file
ccrypt -c <file.cpt>    # Decrypts the file and prints content to standard output

ccrypt -c <file.cpt> | grep "Account" | cut -d " " -f 3     # "Account" is a placeholder for the Account to search for e.g. Amazon, etc.
                                                            # the output with the contents of the file.cpt is given as input for grep through the pipe,
                                                            # to search for a specific Account. The resulting line is then given as input
                                                            # to cut, againg through a pipe, where only the password is being cut and extracted.
```

use-cases:
* storing work-related passwords
* encryption of sensible login informations
* overview of all login informations
* easily change login information
* different passwords for differents use cases (no need to remember all passwords)

arguments:
* add
* delete
* edit
* copy

options:
* `-a` - Account
* `-u` - Username
* `-p` - Password

The encrypted file would be located in the users home directory and not in a temporary or public folder, maybe even hidden.