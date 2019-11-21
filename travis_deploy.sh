deployprod() {
  make html
  s3cmd rm --recursive --force s3://blog.kenpayne.co.uk/ -c .s3cfg
  s3cmd put --recursive output/ s3://blog.kenpayne.co.uk -c .s3cfg \
    --acl-public \
    --guess-mime-type \
    --add-header='Cache-Control:max-age=300'
}

if [[ $TRAVIS_PULL_REQUEST != 'false' ]]; then
  echo "This is a pull request. No deployment will be done."
elif [[ $TRAVIS_BRANCH == 'master' ]]; then
  echo "Going to deploy on master..."
  deployprod
else
  echo "Nothing to do..."
fi