<%@ include file="header.jsp"%>
<main class="app-content">
<div class="app-title">
	<div>
		<h1>
			<i class="fa fa-th-list"></i> Data Table
		</h1>
		<p>Table to display analytical data effectively</p>
	</div>
	<ul class="app-breadcrumb breadcrumb side">
		<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
		<li class="breadcrumb-item">Tables</li>
		<li class="breadcrumb-item active"><a href="#">Data Table</a></li>
	</ul>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="tile">
			<div class="tile-body">
				<table class="table table-hover table-bordered" id="sampleTable">
					<thead>
						<tr>
							<th style="text-align:center;">#No</th>
							<th style="text-align:center;">Speciality</th>
							<th style="text-align:center;">Edit</th>
							<th style="text-align:center;">Delete</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${specialityList}" var="specialityList" varStatus="loop">
						<tr>
							<td align="center">${loop.index + 1}</td>
							<td align="center">${specialityList.specialityName}</td>
							<td align="center"><a
								href="${pageContext.request.contextPath}/speciality/edit?id=${specialityList.specialityId}"><i
									class="fa fa-edit"></i></a></td>
							<td align="center"><a
								href="#" ><i id="speciality_${specialityList.specialityId}"
									class="fa fa-remove btnDelete"></i></a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</main>
<script>
	$(document).ready(function(){
		var errorMsg = "${msg}";
		if(errorMsg.trim().length > 0 ){
			$.notify({
	      		title: "Error : ",
	      		message: errorMsg,
	      		icon: 'fa fa-check' 
	      	},{
	      		type: "danger"
	      	});
		}
		var contextPath = "${pageContext.request.contextPath}";
		$("#sampleTable").on("click",'.btnDelete',function(){
			var specialityId = $(this).attr("id").split("_")[1];
			console.log(specialityId)
		 	swal({
	      		title: "Are you sure?",
	      		text: "You will not be able to recover this",
	      		type: "warning",
	      		showCancelButton: true,
	      		confirmButtonText: "Delete!",
	      		cancelButtonText: "Cancel",
	      		closeOnConfirm: false,
	      		closeOnCancel: false
	      	}, function(isConfirm) {
	      		if (isConfirm) {
	      			window.location.href = contextPath+"/speciality/delete?id="+specialityId;
	      			
	      		} else {
	      			swal.close();
	      		}
	      	});
			
		});
	});
</script>

<%@ include file="footer.jsp"%>
 <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
</body>
</html>