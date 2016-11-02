apt-get update
apt-get install --yes curl build-essential python git rsync
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install $NODE_VERSION
node --version
npm --version
export PATH=./node_modules/.bin/:$PATH
npm install -g node-pre-gyp-github
cd /root/workspace
npm install --build-from-source --node-gyp=$(which pangyp)
./node_modules/.bin/node-pre-gyp rebuild
./node_modules/.bin/node-pre-gyp package
