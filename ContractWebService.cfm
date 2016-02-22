

<cfsetting showdebugoutput="no">
<cfheader name="Content-Type" value="application/json">


<cfquery name="GetContracts" datasource="FAAS" maxrows="#selectionAmount#">
	SELECT *
	FROM `Contract`
	WHERE contractingAgencyCode IN ( 
					<cfqueryparam 
						value="#agencyCodes#" 
						cfsqltype="CF_SQL_INTEGER"
						list="yes" 
					/> 
				)
	ORDER BY amount DESC
</cfquery>


<cfoutput>
	#SerializeJSON(GetContracts,true)#
</cfoutput>