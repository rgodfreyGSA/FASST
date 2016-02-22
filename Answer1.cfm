




<cfoutput>


	<p>
		<b>Top 10 contracts searched by state or zip in 2015</b>

		<form action="Answer1.cfm" method="post">
			State Code (i.e. CA): <input type="text" name="state" value="">
			<input type="submit">
		</form>
		<form action="Answer1.cfm" method="post">
			Zip Code: <input type="text" name="zip" value="">
			<input type="submit">
		</form>



	</p>
	<hr width="100%">





	<cfif isDefined("state")>
		<p><b>State #UCase(state)#</b></p>

		<cfhttp url="https://www.usaspending.gov/fpds/fpds.php?detail=b&fiscal_year=2015&stateCode=#state#&max_records=10&sortby=f" method="GET">
		<cfset xmlfile = xmlparse(cfhttp.filecontent)>
		<cfset MyXMLDoc = xmlParse(xmlfile)>

		<cfif isDefined("MyXMLDoc.usaspendingSearchResults.result.doc")>

			<p>#arraylen(MyXMLDoc.usaspendingSearchResults.result.doc)# results</p>

			<hr width="100%">
			<cfloop from="1" to="#arraylen(MyXMLDoc.usaspendingSearchResults.result.doc)#" index="i">
				<cfset recordXML = MyXMLDoc.usaspendingSearchResults.result.doc[i]>
				<b>#i#</b><br>
				#recordXML["RecipientName"].XmlText#<br>
				#recordXML["productOrServiceCode"].XmlText#<br>
				#recordXML["RecipientCity"].XmlText#, #recordXML["RecipientState"].XmlText# #Left(recordXML["RecipientZipCode"].XmlText, 5)#<br>
				#DollarFormat(recordXML["DollarsObligated"].XmlText)#<br>
				<hr width="100%">
			</cfloop>

		<cfelse>
			Invalid entry.
		</cfif>
	<cfelseif isDefined("zip")>
		<p><b>Zip #UCase(zip)#</b></p>

		<cfhttp url="https://www.usaspending.gov/fpds/fpds.php?detail=b&fiscal_year=2015&placeOfPerformanceZIPCode=#zip#&max_records=10&sortby=f" method="GET">
		<cfset xmlfile = xmlparse(cfhttp.filecontent)>
		<cfset MyXMLDoc = xmlParse(xmlfile)>

		<cfif isDefined("MyXMLDoc.usaspendingSearchResults.result.doc")>

			<p>#arraylen(MyXMLDoc.usaspendingSearchResults.result.doc)# results</p>

			<hr width="100%">
			<cfloop from="1" to="#arraylen(MyXMLDoc.usaspendingSearchResults.result.doc)#" index="i">
				<cfset recordXML = MyXMLDoc.usaspendingSearchResults.result.doc[i]>
				<b>#i#</b><br>
				#recordXML["RecipientName"].XmlText#<br>
				#recordXML["productOrServiceCode"].XmlText#<br>
				#recordXML["RecipientCity"].XmlText#, #recordXML["RecipientState"].XmlText# #Left(recordXML["RecipientZipCode"].XmlText, 5)#<br>
				#DollarFormat(recordXML["DollarsObligated"].XmlText)#<br>
				<hr width="100%">
			</cfloop>

		<cfelse>
			Invalid entry.
		</cfif>
	</cfif>

</cfoutput>