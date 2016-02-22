

<cfset requestBody = toString(getHttpRequestData().content) />
<cfif isJSON(requestBody)>
    <cfset cfData = DeserializeJSON(requestBody)>
    <cfoutput>

    	<cfset addCount = 0>

		<cfloop index="i" from="1" to="#ArrayLen(cfData.contract)#">


			<cfquery name="CheckUniqueID" datasource="FAAS">
				SELECT uniqueID, modNumber, transactionNumber
				FROM `Contract`
				WHERE uniqueID = '#cfData.contract[i].uniqueID#'
			</cfquery>

			<cfif CheckUniqueID.RecordCount IS 0>

    			<cfset addCount = addCount + 1>

				<cfif cfData.contract[i].amount IS 'null'>
					<cfset cfData.contract[i].amount = '0'>
				</cfif>
				<cfif cfData.contract[i].optionsamount IS 'null'>
					<cfset cfData.contract[i].optionsamount = '0'>
				</cfif>
				<cfif cfData.contract[i].exercisedamount IS 'null'>
					<cfset cfData.contract[i].exercisedamount = '0'>
				</cfif>
				<cfif cfData.contract[i].signedDate IS 'NaN-NaN-NaN'>
					<cfset cfData.contract[i].signedDate = ''>
				</cfif>
				<cfif cfData.contract[i].completionDate IS 'NaN-NaN-NaN'>
					<cfset cfData.contract[i].completionDate = ''>
				</cfif>

				<cfquery name="AddContract" datasource="FAAS">
					INSERT INTO `Contract`
						(
							`uniqueID`,
							`piid`,
							`idvPiid`,
							`amount`,
							`optionsamount`,
							`exercisedamount`,
							`majAgencyCode`,
							`majAgency`,
							`majFundAgencyCode`,
							`majFundAgency`,
							`contractingAgencyCode`,
							`contractingAgency`,
							`contractingOfficeCode`,
							`contractingOffice`,
							`fundRequestingOffice`,
							`contractPricingType`,
							`transactionStatus`,
							`contractType`,
							`description`,
							`vendorName`,
							`productCode`,
							`product`,
							`city`,
							`state`,
							`signedDate`,
							`completionDate`,
							`modNumber`,
							`transactionNumber`
						)
					VALUES
						(
							'#cfData.contract[i].uniqueID#',
							'#cfData.contract[i].piid#',
							'#cfData.contract[i].idvPiid#',
							'#cfData.contract[i].amount#',
							'#cfData.contract[i].optionsamount#',
							'#cfData.contract[i].exercisedamount#',
							'#cfData.contract[i].majAgencyCode#',
							'#cfData.contract[i].majAgency#',
							'#cfData.contract[i].majFundAgencyCode#',
							'#cfData.contract[i].majFundAgency#',
							'#cfData.contract[i].contractingAgencyCode#',
							'#cfData.contract[i].contractingAgency#',
							'#cfData.contract[i].contractingOfficeCode#',
							'#cfData.contract[i].contractingOffice#',
							'#cfData.contract[i].fundRequestingOffice#',
							'#cfData.contract[i].contractPricingType#',
							'#cfData.contract[i].transactionStatus#',
							'#cfData.contract[i].contractType#',
							'#cfData.contract[i].description#',
							'#cfData.contract[i].vendorName#',
							'#cfData.contract[i].productCode#',
							'#cfData.contract[i].product#',
							'#cfData.contract[i].city#',
							'#cfData.contract[i].state#',
							<cfif cfData.contract[i].signedDate IS ''>
								NULL,
							<cfelse>
								'#cfData.contract[i].signedDate#',
							</cfif>
							<cfif cfData.contract[i].completionDate IS ''>
								NULL,
							<cfelse>
								'#cfData.contract[i].completionDate#',
							</cfif>
							'#cfData.contract[i].modNumber#',
							'#cfData.contract[i].transactionNumber#'
						)
				</cfquery>

			<cfelseif CheckUniqueID.modNumber IS '' && CheckUniqueID.transactionNumber IS ''>

    			<cfset addCount = addCount + 1>

				<cfquery name="UpdateModAndTransaction" datasource="FAAS">
					UPDATE Contract
					SET modNumber = '#cfData.contract[i].modNumber#',
						transactionNumber = '#cfData.contract[i].transactionNumber#'
					WHERE uniqueID = '#cfData.contract[i].uniqueID#'
				</cfquery>

			</cfif>

		</cfloop>

		Success (Added #addCount# Contracts)

    </cfoutput>
</cfif>

