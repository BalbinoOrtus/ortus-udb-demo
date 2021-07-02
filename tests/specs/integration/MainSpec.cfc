/*******************************************************************************
 *	Integration Test as BDD
 *
 *	Extends the integration class: coldbox.system.testing.BaseTestCase
 *
 *	so you can test your ColdBox application headlessly. The 'appMapping' points by default to
 *	the '/root' mapping created in the test folder Application.cfc.  Please note that this
 *	Application.cfc must mimic the real one in your root, including ORM settings if needed.
 *
 *	The 'execute()' method is used to execute a ColdBox event, with the following arguments
 *	* event : the name of the event
 *	* private : if the event is private or not
 *	* prePostExempt : if the event needs to be exempt of pre post interceptors
 *	* eventArguments : The struct of args to pass to the event
 *	* renderResults : Render back the results of the event
 *******************************************************************************/
component
	extends   ="coldbox.system.testing.BaseTestCase"
	appMapping="/root"
{

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll() {
		super.beforeAll();
		// do your own stuff here
		queryExecute("truncate table task;");
		queryExecute("insert into task (id, description) values(0, 'wake up');");
	}

	function afterAll() {
		// do your own stuff here
		super.afterAll();
		queryExecute("truncate table task;");
		queryExecute("insert into task (id, description) values(0, 'thats all folks');");
	}

	/*********************************** BDD SUITES ***********************************/

	function run() {
		describe("pruebas para verificar todolist", function(){
			
			/* story01: ver todas las tareas */
			story("ver todas las tareas", function(){
				given("ninguna otra opcion", function(){
					then("mostramos las tareas", function(){
						var event = this.get( "main.index" );
						var array = valueArray( event.getValue( name="todoList", private=true ), "id" );
						expect( array ).toBeArray().notToBeEmpty();
					});
				});
			});

			/* story02: ingresar una tarea nueva */
			story("ingresar una tarea nueva", function(){
				given("una tarea valida", function(){
					then("agregamos la tarea a la base de datos", function(){
						var event = this.post( "main.new", {
							"task": "test01"
						} );
						var query= queryExecute("select * from task where description like 'test01';");
						var array = valueArray(query, "description");
						expect(array.first()).toInclude("test01");
					});
				});
			});

			/* story03: eliminar una tarea existente */
			story("eliminar una tarea existente", function(){
				given("una tarea valida", function(){
					then("eliminar la tarea de la base de datos", function(){
						var event = this.post("main.delete", {
							"id": "1"
						})
						var query = queryExecute("select * from task where id=1;")
						var array = valueArray(query, "id");
						expect(array).toBeArray().toBeEmpty();
					});
				});
			});

		});
	}

}
