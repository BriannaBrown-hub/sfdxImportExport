# sfdxImportExport
Import and Export data directly from SFDX

Goal: Export data from one org to another to control sample data subsects for testing.

Links: https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_test_data_example.htm

Configure Default Org and Username: This step is necessary to perform queries
$ sfdx force:config:set defaultdevhubusername=me@myhub.org -g
$ sfdx force:auth:web:login -d -a prod

Run Query Commands - this will only pull query into cli (not saved to json file on local machine)
$ sfdx force:data:soql:query -q "SELECT ID, Name FROM Account LIMIT 2"

Save to json file - unlike above, running the query in this way allows saving the file to local machine in the form of a json file.
$ sfdx force:data:tree:export -q "SELECT ID, Name FROM Account LIMIT 2" --prefix <name_file> --outputdir <dir_name> --plan

Example:
sfdx force:data:tree:export -q "SELECT ID, Name FROM Account LIMIT 2" --prefix test2 --outputdir sfdx_exports-test --plan

Import the file to a different org - inserting new records into the org of choice
sfdx force:data:tree:import --targetusername <username_of_sandbox/scratch_org> ^
--plan <dir_name/file_name>

Example:
sfdx force:data:tree:import --targetusername brianna.brown@optimumenergyco.com.bribox --plan sfdx_exports-test/test2-Account-plan.json
