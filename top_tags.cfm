
<h1>Sample of ColdFusion code.</h1>

<p>Note that this will not run because we don't have a DB</p> 



<cfoutput>#now().LSTimeFormat()#`</cfoutput>

<cfset catID = "4,5,6,10">

<cfquery name="qryCats">
	SELECT Name
	FROM dbo.cats
	WHERE ID IN (<cfqueryparam value="#catid#" CFSQLType="CF_SQL_integer" list="true">)
</cfquery>

<cfoutput query="qryCats">
	Name: #Name#
	<cfif Name EQ "Fluffy"> Hurray!</cfif>
	<br />
</cfoutput>

<cfscript>
	writeoutput(now().LSTimeFormat());

	qryCats = queryExecute("
		SELECT Name
		FROM dbo.cats
		WHERE ID IN (:catid)
		", 
		{ "catid" : { "value" : catid, "cfsqltype" : "cf_sql_integer", "list" : true } }
		)

	for (cat in qryCats) {
		writeOutput("Name: #name#");
		if (Name == "Fluffy") {
			writeOutput("Hurray!");
		}
		writeOutput("<br />");
	}
</cfscript>

