deployprod() {
  make html
  s3cmd sync output/ s3://blog.kenpayne.co.uk -c .s3cfg --acl-public --delete-removed
  s3cmd --recursive modify --add-header='content-type':'text/css' \
      --exclude '' --include '.css' s3://blog.kenpayne.co.uk
}

if [[ $TRAVIS_PULL_REQUEST != 'false' ]]; then
  echo "This is a pull request. No deployment will be done."
elif [[ $TRAVIS_BRANCH == 'master' ]]; then
  echo "Going to deploy on master..."
  deployprod
else
  echo "Nothing to do..."
fi