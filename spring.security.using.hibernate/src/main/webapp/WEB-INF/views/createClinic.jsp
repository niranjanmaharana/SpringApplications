<%@ include file="header.jsp"%>
<main class="app-content">
<div class="app-title">
	<div>
		<h1>
			<i class="fa fa-edit"></i>Welcome to RxKiosk
		</h1>
	</div>
	<ul class="app-breadcrumb breadcrumb">
		<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
		<li class="breadcrumb-item">Clinic</li>
		<li class="breadcrumb-item"><a href="#">Create Clinic</a></li>
	</ul>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="tile">
			<h3 class="tile-title">Clinic Info</h3>
			<div class="tile-body">
				<form:form method="post" name="clinicform"
					action="${pageContext.request.contextPath}/clinic/insert"
					commandName="clinic">
					<div align="right">
						<a href="#" data-toggle="modal" data-target="#textModal"
							id="helpModal">Have trouble for finding area!</a>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label">Clinic Name</label>

							<form:input class="form-control" type="text"
								placeholder="Enter Clinic Name" path="clincName" />
						</div>
						<div class="form-group col-md-6">
							<label class="control-label">Area Name</label>
							<form:select id="inputImplementation" class="form-control"
								path="implementation.areaId" items="${implementationList}"
								itemValue="areaId" itemLabel="areaName">
							</form:select>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label">Contact EmailId</label>
							<form:input class="form-control" type="email"
								placeholder="Enter Correct Email" path="emailId" />
						</div>
						<div class="form-group col-md-6">
							<label class="control-label">Contact MobileNumber</label>
							<form:input class="form-control" type="tel"
								placeholder="Enter Correct MobileNumber" path="mobileNumber"
								maxlength="10" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label">Registered Address</label>
							<form:textarea class="form-control"
								placeholder="Enter full Address" path="address" />
						</div>
					</div>
					<div class="tile-footer">
						<button class="btn btn-primary" type="submit">
							<i class="fa fa-fw fa-lg fa-check-circle"></i>Save
						</button>
						&nbsp;&nbsp;&nbsp;
					</div>
				</form:form>
			</div>
			<div id="popup1" class="overlay" style="display: none">
				<div class="popup" style="width: 80%">
					<h2>Find Your Area Here</h2>
					<div class="content">
						<div class="row">
							<div class="form-group col-md-6">
								<label class="control-label">Country</label> <select
									id="inputCountry" class="form-control">
									<option value="">Select</option>
									<c:forEach items="${countryList}" var="country">
										<option value="${country.id}">${country.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label class="control-label">State</label> <select
									id="inputState" class="form-control">
									<option value="">Select</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-6">
								<label class="control-label">Region</label> <select
									id="inputRegion" class="form-control">
									<option value="">Select</option>
								</select>
							</div>
						</div>
						<div class="tile-footer">
							<button id="modalBtnOk" class="btn btn-primary" type="button">
								<i class="fa fa-fw fa-lg fa-check-circle"></i>&nbsp;&nbsp;Ok&nbsp;
							</button>
							&nbsp;&nbsp;&nbsp;<a id="modalBtnCancel"
								class="btn btn-secondary" href="#"><i
								class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<script>
    $(document).ready(function(){
    	$("#modalBtnCancel").on("click",function(){
    		$("#popup1").hide();	
    	});
    	$("#modalBtnOk").on("click",function(){
    		$("#popup1").hide();	
    	});
    	$("#helpModal").on("click",function(){
    		$("#popup1").show();	
    	});
    });
    
    var contextPath = "${pageContext.request.contextPath}";
	$("#inputCountry").on("change",function(){
		var countryId = $(this).val();
		$.ajax({
			   url: contextPath+"/state/getStateByCountry",
			   type: 'GET',
			   dataType: 'json',
			   data: {
			      countryId: countryId
			   },
			   success: function(data) {
				   var optionsList = "";
				   var defaultoptionItem = "<option value=''>Select</options>";
				   optionsList += defaultoptionItem;
				   for(var i =0;i<data.length;i++){
				   		var optionItem = "<option value="+data[i].stateId+">"+data[i].stateName+"</options>";
				   		optionsList += optionItem;
				   }
				   $("#inputState").html(optionsList);
				   },
			   error: function(e) {
			      alert("error");
			   },
			   
			});
	});
	$("#inputState").on("change",function(){
		var stateId = $(this).val();
		$.ajax({
			   url: contextPath+"/region/getRegionByState",
			   type: 'GET',
			   dataType: 'json',
			   data: {
				   stateId: stateId
			   },
			   success: function(data) {
				   var optionsList = "";
				   var defaultoptionItem = "<option value=''>Select</options>";
				   optionsList += defaultoptionItem;
				   for(var i =0;i<data.length;i++){
				   		var optionItem = "<option value="+data[i].regionId+">"+data[i].regionName+"</options>";
				   		optionsList += optionItem;
				   }
				   $("#inputRegion").html(optionsList);
				   },
			   error: function(e) {
			      alert("error");
			   },
			   
			});
	});
	$("#inputRegion").on("change",function(){
		var regionId = $(this).val();
		$.ajax({
			   url: contextPath+"/implementation/getImplementationByRegion",
			   type: 'GET',
			   dataType: 'json',
			   data: {
				   regionId: regionId
			   },
			   success: function(data) {
				   var optionsList = "";
				   var defaultoptionItem = "<option value=''>Select</options>";
				   optionsList += defaultoptionItem;
				   for(var i =0;i<data.length;i++){
				   		var optionItem = "<option value="+data[i].areaId+">"+data[i].areaName+"</options>";
				   		optionsList += optionItem;
				   }
				   $("#inputImplementation").html(optionsList);
				   },
			   error: function(e) {
			      alert("error");
			   },
			   
			});
	});
	$(function() {
 		$("form[name='clinicform']").validate({
 		    rules: {
 		    	'clincName': "required",
 		    	'implementation.areaId' : "required",
 		    	'emailId' : "required",
 		    	'mobileNumber' : {required: true,number:true},
 		    	'address' : "required"
 		    },
 		    messages: {
	    		'clincName': "Please Select clinic name!",
 		    	'implementation.areaId': "Please Enter Area Name!",
 		    	'emailId' : "Please Enter valid Email Id!",
 		    	'mobileNumber' : "Please Enter valid Mobile Number!",
 		    	'address' : "Please enter your Address!",
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
	});
    </script>
<%@ include file="footer.jsp"%>


