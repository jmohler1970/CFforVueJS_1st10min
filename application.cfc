component {

	this.name = "first10_01";

	this.applicationManagement 	= true;
	this.sessionManagement 	= true;

	//this.ormenabled = true;
	//this.ormsettings.eventhandling = true;
	//this.datasource = "UserManager";

	function onApplicationStart() output="false"	{

		application.counter = 0;
	}


	function onSessionStart() output="false"	{

		session.counter = 0;
	}


	function onRequestStart() output="false"	{

		request.counter = 0;
	}

} // end component