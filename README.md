# sfdxImportExport
Import and Export data directly from SFDX

Step 1: Configure Default Org and Username
$ sfdx force:config:set defaultdevhubusername=me@myhub.org -g
$ sfdx force:auth:web:login -d -a prod

Step 2: Run Query Commands
$ sfdx force:data:soql:query -q "SELECT ID, Name FROM Account LIMIT 2"



