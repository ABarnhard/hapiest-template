#!/bin/bash

if [ -z "$2" ] ; then
  echo "Enter a GitHub Repository URL FOLLOWED by the Application Name"
  exit 1
fi

# re-wiring git repository
rm -rf .git

# nuking old node modules
sudo rm -rf ~/.npm
rm -rf node_modules

# changing application name
find . -type f \( -iname \*.js -o -iname \*.jade \) -print -exec sed -i "" "s/hapiest/$2/g" {} \;

# installing new node server modules
npm install good --save
npm install good-console --save
npm install hapi --save
npm install hapi-auth-cookie --save
npm install joi --save
npm install lout --save
# installing new node database modules
npm install mongoose --save
npm install pg --save
# installing new node socket server module
npm install socket.io --save
# installing new node server utility modules
npm install async --save
npm install bcrypt --save
npm install chalk --save
npm install request --save
npm install underscore --save
# install new node bower module
npm install bower --save
# install new node grunt utility modules
npm install grunt --save
npm install grunt-cli --save
npm install grunt-contrib-clean --save
npm install grunt-contrib-copy --save
npm install grunt-contrib-jade --save
npm install grunt-contrib-jshint --save
npm install grunt-contrib-less --save
npm install grunt-contrib-watch --save
npm install grunt-jscs --save
npm install grunt-shell --save
# install new node js linter module
npm install jshint-stylish --save
# install new node testing modules
npm install blanket --save
npm install chai --save
npm install coveralls --save
npm install mocha --save
npm install mocha-lcov-reporter --save
npm install supertest --save


# installing new bower production components
bower install angular --save
bower install angular-ui-router --save
bower install foundation --save
bower install underscore --save
bower install jquery --save
bower install toastr --save

# adding files to new git repository
git init
git remote add origin $1
git add .
git commit -am "initial files"

# create initial public directory
grunt deploy

# running all tests
npm test

echo "Success! Now push your initial commit to Github"
exit 0
