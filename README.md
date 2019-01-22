# sfdxImportExport
Import and Export data directly from SFDX

Step 1: Configure Default Org and Username
'"$ sfdx force:config:set defaultdevhubusername=me@myhub.org -g "'
$ sfdx force:auth:web:login -d -a prod

Step 2: Run Query Commands
$ sfdx force:data:soql:query -q "SELECT ID, Name FROM Account LIMIT 2"

Save to json file
$ sfdx force:data:tree:export -q "SELECT ID, Name FROM Account LIMIT 2" --prefix <name_file> --outputdir <dir_name> --plan

Example: 
sfdx force:data:tree:export -q "SELECT ID, Name FROM Account LIMIT 2" --prefix test2 --outputdir sfdx_exports-test --plan

Import the file
sfdx force:data:tree:import --targetusername brianna.brown@optimumenergyco.com.bribox ^
--plan <dir_name/file_name>

Example:
sfdx force:data:tree:import --targetusername brianna.brown@optimumenergyco.com.bribox --plan sfdx_exports-test/test2-Account-plan.json










