# Decrypt private key
mkdir ~/.ssh; openssl enc -d -aes-256-cbc -in ~/Dropbox/id_rsa.enc -out ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa
cp ~/Dropbox/id_rsa.pub ~/.ssh

# Copy .dotfiles
cp .profile ~/.profile
cp .vimrc ~/.vimrc
