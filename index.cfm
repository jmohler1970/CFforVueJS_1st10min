
<cfscript>
application.counter++;
session.counter++;
request.counter++
</cfscript>


<cfinclude template="header.cfi">

<pre>
<cfoutput>
application.counter: #application.counter#
session.counter: #session.counter#
request.counter: #request.counter#
</cfoutput>
</pre>



<form action="?" method="post">
	<div class="form-group">
		<label>Email address</label>
		<input type="email" class="form-control" name="email" placeholder="Enter email" />
	</div>
	<div class="form-group">
		<label>Password</label>
		<input type="password" class="form-control" name="password" placeholder="Enter password" />
	</div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>


<cfdump var="#form#">


<cfinclude template="footer.cfi">

