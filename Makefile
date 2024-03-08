serve:
	poetry run mkdocs serve

html:
	poetry run mkdocs build

upload:
	poetry run aws s3 sync docs/assets s3://static.kenpayne.co.uk/ --delete

download:
	poetry run aws s3 sync s3://static.kenpayne.co.uk/ docs/assets --dryrun
