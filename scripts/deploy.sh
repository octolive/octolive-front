eval `ssh-agent -s`
mkdir -p ~/.ssh
ls ~/.ssh
openssl aes-256-cbc -K $encrypted_4fb01d480ed5_key -iv $encrypted_4fb01d480ed5_iv -in github_deploy.enc -out ~/.ssh/id_rsa -d
mv github_deploy.pub ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa.pub
ssh-add ~/.ssh/id_rsa
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa"
git config --global user.email "build-travis@6700.com.ar"
git config --global user.name "Travis CI"
git remote set-url origin git@github.com:octolive/octolive-front.git


yarn install -s
yarn run deploy
