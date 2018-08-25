<%@ include file="header.jsp"%>
 <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> Form Samples</h1>
          <p>Sample forms</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Forms</li>
          <li class="breadcrumb-item"><a href="#">Sample Forms</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="tile">
            <h3 class="tile-title">Vertical Form</h3>
            <div class="tile-body">
             <form:form method="post" name="userform" action="${pageContext.request.contextPath}/user/updateDoctor" commandName="user" enctype="multipart/form-data">
             <div align="right"><a href="#" id="helpModal">Have trouble in selecting Clinic</a></div>
				<div class="row">
                <div class="form-group col-md-6">
					<label class="control-label">First Name</label>
					<form:input class="form-control" type="text" placeholder="Enter first name" path="firstName"/>
						<form:input class="form-control" type="hidden" path="userId"/>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label">Last Name</label>
					<form:input class="form-control" type="text" placeholder="Enter last name" path="lastName"/>
				</div>
                </div>
                <div class="row">
                <div class="form-group col-md-6">
					<label class="control-label">Contact EmailId</label>
					<form:input class="form-control" type="email" placeholder="Enter Correct Email" path="emailId"/>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label">Contact MobileNumber</label>
					<form:input class="form-control" type="tel" placeholder="Enter Correct MobileNumber" path="mobileNumber" maxlength="10"/>
				</div>
                </div>
                <div class="row">
                <div class="form-group col-md-6">
					<label class="control-label">Clinic</label>
					<form:select id="inputClinic" class="form-control" path="" name="clinic"  items="${clinicList}" itemValue="clinicId" itemLabel="clincName" />
					
				</div>
				<form:input type="hidden" path="practiceInfo.id" class="form-control"/>
				<form:input type="hidden" path="userId" class="form-control"/>
				<form:input type="hidden" path="password" class="form-control"/>
                </div>
				<div class="tile-footer">
            	  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>update</button>&nbsp;&nbsp;&nbsp;
            	  <a class="btn btn-secondary" href="${pageContext.request.contextPath}/user/viewDoctors"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
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
            	  <button id="modalBtnOk" class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>&nbsp;&nbsp;Ok&nbsp;</button>&nbsp;&nbsp;&nbsp;<a id="modalBtnCancel" class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
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
					   		var optionItem = "<option value="+data[i].id+">"+data[i].name+"</options>";
					   		optionsList += optionItem;
					   }
					   console.log(optionsList);
					   $("#inputState").html(optionsList);
					   console.log($("#inputState").html());
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
 		$("form[name='userform']").validate({
 		    rules: {
 		    	'firstName': "required",
 		    	'lastName' : "required",
 		    	'emailId' : "required",
 		    	'userName' : "required",
 		    	'mobileNumber' : {required: true,number:true},
 		    	'password' : "required",
 		    	'role.roleId' : "required",
 		    	'file' : "required"
 		    },
 		    messages: {
		    	'firstName': "Please Enter First Name!",
		    	'lastName': "Please Enter Last Name!",
		    	'emailId': "Please Enter valid Email!",
		    	'userName': "Please Enter User Name!",
		    	'mobileNumber': "Please Enter valid Mobile Number!",
		    	'password': "Please Enter Password!",
		    	'role.roleId': "Please select role name!",
		    	'file' : "please upload image!"
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
	});
    </script>
<%@ include file="footer.jsp"%>