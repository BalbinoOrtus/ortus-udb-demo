<cfoutput>
	<h1>todo list webapp</h1>

	<form action="/main/add" method="post">
		<input type="text" name="description" width="100">
		<input type="submit" value="Send">
	</form>

	<table>
		<tr>
			<th>Id</th>
			<th>description</th>
			<th>delete</th>
		</tr>
		<cfloop query="#prc.todos#">
			<tr>
				<td>#encodeForHTML( id )#</td>
				<td>#encodeForHTML( description )#</td>
				<td><a href="#event.buildLink( 'main.delete' )#/id/#encodeForURL( id )#" onclick="test();">delete</a></td>
			</tr>
		</cfloop>
	</table>

	<br><br>
		<div class="container d-flex align-items-center justify-content-center flex-column">

		<h3>Todo App</h3>
		<div class="d-flex align-items-center mb-3">
			<div class="form-group mr-3 mb-0">
				<input type="text" class="form-control" id="formGroupExampleInput" placeholder="Enter a task here"/>
			</div>
			<button type="button" class="btn btn-primary mr-3">Save</button>
			<button type="button" class="btn btn-warning">Get Tasks</button>				
		</div>

		<div class="table-wrapper">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>No.</th>
						<th>Todo item</th>
						<th>status</th>
						<th>Actions</th>
					</tr>
				</thead>

				<tbody>
					<tr class="table-success">
						<td>1</td>
						<td>movies</td>
						<td class="complete">Completed</td>
						<td>
							<button class="btn btn-danger">delete</button>
							<button class="btn btn-success">finished</button>
						</td>
					</tr>
					<tr class="table-light">
						<td>2</td>
						<td>dinner</td>
						<td class="task">in progress</td>
						<td>
							<button class="btn btn-danger">delete</button>
							<button class="btn btn-success">finished</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>
</cfoutput>