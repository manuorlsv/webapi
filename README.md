# webapi
web api .net  to access any database in your sever
request login example
{
    "user" :  "mpolio",
    "password":"1234",
    "cdeviceName":"web",
    "cDeviceOS":"windows",
    "deviceOSVersion":"windows11",
    "appVersion":"1",
    "appId":"1"
}

request Post  example empty parameter

{
  "ObjectId": "master", // databasetarget
  "token": "",
  "source": "namestoreprocedure",
  "filters": null,
  "alias": "result" /*dsgsdfsdf*/
}



{
  "ObjectId": "master", // databasetarget
  "token": "", //no working for the moment but you get the token in the login 
  "source": "get_Menu", 
 "filters":
			[
				{
					"ParameterName":"@idlanguage",
					"ParameterValue":"1"
				},
				{
					"ParameterName":"@iduser",
					"ParameterValue":"1"
				}

			],
			  "alias": "result"
}
