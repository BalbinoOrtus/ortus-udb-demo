component extends="coldbox.system.EventHandler" {

	property name="html" inject="HTMLHelper@coldbox";
	/**
	 * Default Action
	 */
	function index( event, rc, prc ) {
		//html.addasset("/main/index.js")
		prc.todoList = queryExecute("SELECT * FROM task;");
		event.setView( "main/index" );
	}

	function new( event, rc, prc ) {
		if( isNull( rc.task ) ){
			cbmessagebox().error( "there is no task" );
			relocate( "main.index" );
		}
		queryExecute("INSERT INTO `task`(`id`,`description`) VALUES(?,?);", [0, rc.task]);
		cbmessagebox().success( "new task was added" );
		relocate( "main.index" );
	}

	function delete( event, rc, prc ) {
		if( isNull( rc.id ) ){
			cbmessagebox().error( "there is no id to delete" );
			relocate( "main.index" );
		}		
		queryExecute("DELETE FROM `todolistdb`.`task` WHERE id=?;", [rc.id]);
		cbmessagebox().success( "todo #encodeForHTML( rc.id )# has been deleted" );
		relocate( "main.index" );
	}	

	/**
	 * Produce some restfulf data
	 */
	function data( event, rc, prc ) {
		return [
			{ "id" : createUUID(), name : "Luis" },
			{ "id" : createUUID(), name : "JOe" },
			{ "id" : createUUID(), name : "Bob" },
			{ "id" : createUUID(), name : "Darth" }
		];
	}

	/**
	 * Relocation example
	 */
	function doSomething( event, rc, prc ) {
		relocate( "main.index" );
	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit( event, rc, prc ) {
	}

	function onRequestStart( event, rc, prc ) {
	}

	function onRequestEnd( event, rc, prc ) {
	}

	function onSessionStart( event, rc, prc ) {
	}

	function onSessionEnd( event, rc, prc ) {
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ) {
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

}
