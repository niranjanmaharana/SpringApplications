<%@ include file="header.jsp"%>
 <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> Welcome to RxKiosk</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Doctor</li>
          <li class="breadcrumb-item"><a href="#">Add Doctor</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="tile">
            <h3 class="tile-title">Doctor Form</h3>
            <div class="tile-body">
              <form:form method="post" name="doctorform" action="${pageContext.request.contextPath}/user/insertDoctor" commandName="user" enctype="multipart/form-data">
              <div align="right"><a href="#" id="helpModal">Have trouble in selecting Clinic</a></div>
				<div class="row">
                <div class="form-group col-md-6">
					<label class="control-label">First Name</label>
					<form:input class="form-control" type="text" placeholder="Enter first name" path="firstName"/>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label">Last Name</label>
					<form:input class="form-control" type="text" placeholder="Enter last name" path="lastName"/>
				</div>
                </div>
                <div class="row">
                <div class="form-group col-md-6">
					<label class="control-label">EmailId</label>
					<form:input class="form-control" type="email" placeholder="Enter Correct Email" path="emailId" id="email"/>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label">Mobile Number</label>
					<form:input class="form-control" type="tel" placeholder="Enter Correct MobileNumber" path="mobileNumber" maxlength="10"/>
				</div>
                </div>
                <div class="row">
                <div class="form-group col-md-6">
					<label class="control-label">Clinic</label>
					<select id="inputClinic"
						class="form-control" name="clinic">
						<option value="">Select</option>
						<c:forEach items="${clinicList}" var="clinic">
							<option value="${clinic.clinicId}">${clinic.clincName}</option>
						</c:forEach>
					</select>
					
				</div>
                </div>
				<div class="tile-footer">
            	  <button class="btn btn-primary" type="submit" id="btn"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save</button>&nbsp;&nbsp;&nbsp;
            	</div>
              </form:form>
            </div>
            <div id="popup1" class="overlay" style="display:none">
				<div class="popup" style="width:80%">
				<h2>Find Your Clinic</h2>
						<div class="content">
							<div class="row">
							<div class="form-group col-md-6">
								<label class="control-label">Country</label>
								<select id="inputCountry"
									class="form-control">
									<option value="">Select</option>
									<c:forEach items="${countryList}" var="country">
										<option value="${country.id}">${country.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label class="control-label">State</label>
								<select id="inputState"
									class="form-control">
									<option value="">Select</option>
								</select>
							</div>
			                </div>
			                <div class="row">
							<div class="form-group col-md-6">
								<label class="control-label">Region</label>
								<select id="inputRegion"
									class="form-control">
									<option value="">Select</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label class="control-label">Implementation</label>
								<select id="inputImplementation"
									class="form-control" name="clinic">
									<option value="">Select</option>
								</select>
							</div>
			                </div>
			                <div class="tile-footer">
            	  <button id="modalBtnOk" class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>&nbsp;&nbsp;Ok&nbsp;</button>&nbsp;&nbsp;&nbsp;
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
		$("#inputImplementation").on("change",function(){
			var implId = $(this).val();
			$.ajax({
				   url: contextPath+"/clinic/getClinicByImplementation",
				   type: 'GET',
				   dataType: 'json',
				   data: {
					   implId: implId
				   },
				   success: function(data) {
					   var optionsList = "";
					   var defaultoptionItem = "<option value=''>Select</options>";
					   optionsList += defaultoptionItem;
					   for(var i =0;i<data.length;i++){
					   		var optionItem = "<option value="+data[i].clinicId+">"+data[i].clincName+"</options>";
					   		optionsList += optionItem;
					   }
					   $("#inputClinic").html(optionsList);
					   },
				   error: function(e) {
				      alert("error");
				   },
				   
				});
		});
	});
	 $(function() {
 		$("form[name='doctorform']").validate({
 		    rules: {
				'country' : "required", 		    	
 		    	'firstName': "required",
 		    	'lastName' : "required",
 		    	'emailId' : "required",
 		    	'mobileNumber' : {required: true,number:true},
 		    	'role.roleId' : "required",
 		    	'imagePath' : "required",
 		    	'clinic'	: "required",
 		    },
 		    messages: {
	    		'firstName': "Please Enter First Name!",
 		    	'lastName': "Please Enter Last Name!",
 		    	'emailId' : "Please Enter valid EmailId!",
 		    	'mobileNumber' : "Please Enter valid ModileNumber!",
 		    	'role.roleId' : "Please select roleId!",
 		    	'imagePath' : "Please Upload Image!",
 		    	'country' : "Please Select Country!",
 		    	'clinic'	: "Please select Clinic"
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		});
	});
    </script>
<%@ include file="footer.jsp"%>