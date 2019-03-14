Encrypt
`$ openssl enc -aes-256-cbc -salt -in file.txt -out file.txt.enc`

Decrypt
`$ openssl enc -aes-256-cbc -d -in file.txt.enc -out file.txt`

Generate Random
`$ openssl rand -base64 16`

Remove Unencrypted File
`$ shred -v -n 1 -z -u /path/to/file`

Remove Unencrypted File OSX
`$ srm -mzv /path/to/file`
