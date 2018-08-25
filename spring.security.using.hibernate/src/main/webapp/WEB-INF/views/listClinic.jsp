<%@ include file="header.jsp"%>
<main class="app-content">
<div class="app-title">
	<div>
		<h1>
			<i class="fa fa-th-list">Welcome to RxKiosk</i> 
		</h1>
	</div>
	<ul class="app-breadcrumb breadcrumb side">
		<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
		<li class="breadcrumb-item">Clinic</li>
		<li class="breadcrumb-item active"><a href="#">Create Clinic</a></li>
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
							<th style="text-align:center;">Clinic Name</th>
							<th style="text-align:center;">Edit</th>
							<th style="text-align:center;">Delete</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${clinicList}" var="clinicList" varStatus="loop">
						<tr>
							<td align="center">${loop.index +1 }</td>
							<td align="center">${clinicList.clincName}</td>
							<td align="center"><a
								href="${pageContext.request.contextPath}/clinic/edit?id=${clinicList.clinicId}"><i
									class="fa fa-edit"></i></a></td>
							<td align="center"><a
								href="#" ><i id="clinic_${clinicList.clinicId}"
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
			var clinicId = $(this).attr("id").split("_")[1];
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
	      			window.location.href = contextPath+"/clinic/delete?id="+clinicId;
	      			
	      		} else {
	      			swal("Cancelled", "Your imaginary file is safe :)", "error");
	      		}
	      	});
			
		});
	});
</script>

<%@ include file="footer.jsp"%>
 <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
</body>
</html>