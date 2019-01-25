sfdx force:data:soql:query --query ^
"SELECT id, name, Account_Group__c, Account_Group_Type__c, Account_Notes__c, ShippingCity, ^
      ShippingState, ShippingStreet, ShippingCountry, ShippingLatitude, ShippingLongitude, ^
      Site_Name__c, Status__c, Type, ^
      (SELECT Name, Account__c, AHUs_Non_validated__c, AHUs_Validated__c, AHU_Set_Types__c, ^
      Annual_kWh__c, Annual_Therms__c,Baseload_Tons__c, BAS_Communication_Protocol__c,BAS__c, ^
      Blended_Utility_Rate__c, Building_Cooling_Source__c^
      FROM ProjectSite__r) ^
      FROM Account LIMIT 20"


/* Sample query */
sfdx force:data:soql:query --query "SELECT id, name, (SELECT Name, ID FROM ProjectSite__r) FROM Account LIMIT 20"

/* Sample json Export */
$ sfdx force:data:tree:export -q "SELECT id, name, (SELECT Name, ID FROM ProjectSite__r) FROM Account LIMIT 20"^
 --prefix sampleData --outputdir sfdx_exports-test --plan

 /*Sample json Import */
 sfdx force:data:tree:import --targetusername brianna.brown@optimumenergyco.com.bribox --plan sfdx_exports-test/sampleData-Account-Plant__c-plan.json
