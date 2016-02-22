

<cfsetting showdebugoutput="no">
<cfheader name="Content-Type" value="application/json">


<cfquery name="GetContracts" datasource="FAAS">
	SELECT DISTINCT contractingAgencyCode, contractingAgency
	FROM `Contract`
	ORDER BY contractingAgency
</cfquery>


<cfoutput>
	#SerializeJSON(GetContracts,true)#
</cfoutput>