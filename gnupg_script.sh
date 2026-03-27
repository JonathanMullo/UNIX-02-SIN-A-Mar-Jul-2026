uname -a #daba información del navegador
which gpg #nos da la ubicación del binario de gpg
gpg --version #me da la versión e información adicional
gpg --full-generate-key #genero una llave publica y privada
gpg --armor --export #exportaba una llave publica a un archivo
gpg --list-secret-keys --keyid-format=long #This code help to get the private key
gpg --armor --export-secret-keys #This code help to export the keys secret
gpg --armor --export jonathanmullo100@gmail.com > mi_llave_publica.asc #Export my public key
gpg --import lucho_llave_publica.asc #Import public key of my friend
echo "Cfm lucho pintemonos el pelo" >msj_my_friend.txt #Save a message to my friend
gpg --output doc_cifrado.txt --encrypt --recipient luisvillarrealp125@gmail.com msj_my_fr
iend.txt #We encrypt our friend's message
gpg --decrypt lucho_doc_cifrado.txt #Decrypt the message the my friend
gpg --clearsign msj_my_friend.txt #Place a message in the text
gpg --verify msj_my_friend.txt.asc #We verify that the signature is correct
gpg --sign msj_my_friend.txt #Sign the file in binary format
gpg --verify msj_my_friend.txt.gpg #Verify signature in binary
gpg --detach-sign msj_my_friend.txt #Create a separate signature without modifying the document
gpg --verify msj_my_friend.txt.sig msj_my_friend.txt #Verify separate signature
gpg --edit-key luisvillarrealp125@gmail.com #We assign the trust level to another person's public key
gpg --sign-key luisvillarrealp125@gmail.com #We sign our friend's public key
gpg --verify msj_my_friend.txt.asc #Check that the signed file has not been modified
gpg --verify msj_my_friend.txt.sig msj_my_friend.txt #When the signature is in a separate file
gpg --output doc_final.gpg --encrypt --sign --recipient luisvillarrealp125@gmail.com msj_my_friend.txt 
#Create and encrypt the file with the signature only for the recipient
$ gpg --decrypt lucho_doc_final.gpg #We decrypt our friend's file
