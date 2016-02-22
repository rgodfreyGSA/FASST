



<cffile action="read" file="#ExpandPath("DataDownloads/Data_Feed FY 2015 0901 - 0930 DOD.xml")#" variable="objGet" /> 

<cfset MyXMLDoc = xmlParse(objGet)>

<cfoutput>

	<p>#arraylen(MyXMLDoc.response.result.doc)# results</p>