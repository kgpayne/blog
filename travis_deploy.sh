deployprod() {
  make html
  s3cmd sync output/ s3://blog.kenpayne.co.uk -c .s3cfg --acl-public --delete-removed
}

if [[ $TRAVIS_PULL_REQUEST != 'false' ]]; then
  echo "This is a pull request. No deployment will be done."
elif [[ $TRAVIS_BRANCH == 'master' ]]; then
  echo "Going to deploy on master..."
  deployprod
else
  echo "Nothing to do..."
fi