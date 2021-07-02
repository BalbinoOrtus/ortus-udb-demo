<cfoutput>
	<h1>todo list</h1>
	<p>this is my todo list</p>

	<div class="container">
		<form action="#event.buildLink( 'main.new' )#" method="post">
			<div class="form-group">
				<label for="task">task:</label>
				<input type="text" class="form-control" name="task" 
					id="task" value="" placeholder="enter a task...">
			</div>
			<input type="submit" class="btn btn-success" value="Send">
		</form>
	</div>
	<br>
	<div class="container">
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th>id</th>
					<th>description</th>
					<th>action</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="#prc.todoList#">
					<tr>
						<td># encodeForHTML( id ) #</td>
						<td># encodeForHTML( description ) #</td>
						<td>
							<form action="#event.buildLink('main.delete')#" method="post">
								<input type="hidden" name="id" id="id" value="# encodeForHTML( id ) #">
								<input type="submit" class="btn btn-danger" value="Delete">
							</form>
						</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
</cfoutput>