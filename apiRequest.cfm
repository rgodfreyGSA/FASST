


<cfhttp 
	url="#theUrl#" 
	method="GET" 
	timeout="30">


</cfhttp>

<cfoutput>
	#cfhttp.FileContent#
</cfoutput>

