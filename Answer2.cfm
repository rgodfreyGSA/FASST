
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>CAP Answers</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script>
		$(function() {
			$("#accordion").accordion({
				collapsible: true
			});
		});
	</script>
</head>
<body>

	<cfoutput>

		<h3>Lockheed contracts by product or service code</h3>

		<cfhttp url="https://www.usaspending.gov/fpds/fpds.php?detail=c&fiscal_year=2015&max_records=10&sortby=f&company_name=LOCKHEED%20MARTIN%20CORPORATION" method="GET">
		<cfset xmlfile = xmlparse(cfhttp.filecontent)>
		<cfset MyXMLDoc = xmlParse(xmlfile)>

		<p>#arraylen(MyXMLDoc.usaspendingSearchResults.result.doc)# results</p>

		<cfset resultArray=ArrayNew(2)>


		<cfloop from="1" to="#arraylen(MyXMLDoc.usaspendingSearchResults.result.doc)#" index="i">
			<cfset recordXML = MyXMLDoc.usaspendingSearchResults.result.doc[i]>
			<cfset resultArray[i][1] = recordXML["productOrServiceCode"].XmlText>
			<cfset resultArray[i][2] = recordXML["city"].XmlText>
			<cfset resultArray[i][3] = recordXML["state"].XmlText>
			<cfset resultArray[i][4] = recordXML["obligatedAmount"].XmlText>
		</cfloop>


		<div id="accordion">
			<cfloop from="1" to="#arraylen(resultArray)#" index="i">
				<h3>#resultArray[i][1]#</h3>
				<div>
					<p>
						<b>#DollarFormat(resultArray[i][4])#</b><br>
						#resultArray[i][2]#, #resultArray[i][3]#
					</p>
				</div>
			</cfloop>
		</div>
	 

	</cfoutput>

</body>
</html>

<!--- 







<cfoutput>


	<p>
		<b>Contracts by Lockheed</b>


	</p>
	<hr width="100%">



		<cfhttp url="https://www.usaspending.gov/fpds/fpds.php?detail=c&fiscal_year=2015&max_records=300&sortby=f&company_name=LOCKHEED%20MARTIN%20CORPORATION" method="GET">
		<cfset xmlfile = xmlparse(cfhttp.filecontent)>
		<cfset MyXMLDoc = xmlParse(xmlfile)>


		<p>#arraylen(MyXMLDoc.usaspendingSearchResults.result.doc)# results</p>

		<hr width="100%">
		<cfloop from="1" to="#arraylen(MyXMLDoc.usaspendingSearchResults.result.doc)#" index="i">
			<cfset recordXML = MyXMLDoc.usaspendingSearchResults.result.doc[i]>
			<b>#i#</b><br>
			#recordXML["vendorName"].XmlText#<br>
			<cfif structKeyExists(recordXML, "claimantProgramCode")>
				Claimant Program Code: #recordXML["claimantProgramCode"].XmlText#<br>
			</cfif>
			<cfif structKeyExists(recordXML, "systemEquipmentCode")>
				System Equipment Code: #recordXML["systemEquipmentCode"].XmlText#<br>
			</cfif>
			Source Account: #recordXML["ProgSourceAccount"].XmlText#<br>
			#recordXML["productOrServiceCode"].XmlText#<br>
			#recordXML["city"].XmlText#, #recordXML["state"].XmlText# #Left(recordXML["ZIPCode"].XmlText, 5)#<br>
			#DollarFormat(recordXML["obligatedAmount"].XmlText)#<br>
			<hr width="100%">
		</cfloop>

</cfoutput> --->