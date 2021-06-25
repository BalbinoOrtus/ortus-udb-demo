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
</cfoutput>