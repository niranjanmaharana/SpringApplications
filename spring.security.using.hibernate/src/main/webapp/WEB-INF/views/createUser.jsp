<%@ include file="header.jsp"%>
 <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i>Welcome to RxKiosk</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">User</li>
          <li class="breadcrumb-item"><a href="#">Create User</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="tile">
            <h3 class="tile-title">User Info</h3>
            <div class="tile-body">
              <form:form method="post" name="userform" action="${pageContext.request.contextPath}/user/insertUser" commandName="user" enctype="multipart/form-data">
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
					<label class="control-label">Contact EmailId</label>
					<form:input class="form-control" type="email" placeholder="Enter Correct Email" path="emailId" id="email"/>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label">Contact MobileNumber</label>
					<form:input class="form-control" type="tel" placeholder="Enter Correct MobileNumber" id="mobnum" path="mobileNumber"  maxlength="10"/>
				</div>
                </div>
                <div class="row">
                <div class="form-group col-md-6">
					<label class="control-label">User Name</label>
					<form:input class="form-control" type="text" placeholder="Enter user name" path="userName"/>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label">Password</label>
					<form:input class="form-control" type="password" placeholder="Type Password" path="password"/>
				</div>
				</div>
                <div class="row">
                
                <div class="form-group col-md-6">
                	<label class="control-label">Role Name</label>
                	<form:select id="inputCountry"
						class="form-control" path="role.roleId">
						<option value="">Select</option>
						<c:forEach items="${roleList}" var="role">
							<option value="${role.roleId}">${role.userRole}</option>
						</c:forEach>
					</form:select>
				</div>	
				<div class="form-group col-md-6">
					<label class="control-label">Upload Image</label>
					<input class="form-control" type="file" name="file" placeholder="Upload Image"/>
				</div>
				
                </div>
				<div class="tile-footer">
            	  <button class="btn btn-primary" type="submit" ><i class="fa fa-fw fa-lg fa-check-circle"></i>Save</button>&nbsp;&nbsp;&nbsp;
            	</div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script>
	 $(function() {
 		$("form[name='userform']").validate({
 		    rules: {
 		    	'firstName': {required: true},
 		    	'lastName' : {required: true,minlength: 1},
 		    	'emailId' : {required: true,email: true},
 		    	'mobileNumber' : {required: true,maxlength:10,number:true},
 		    	'role.roleId' : {required: true},
 		    	'imagePath' : {required: true},
 		    	'userName' : {required: true},
 		    	'password' : {required: true,minlength: 5,equalTo: "#password"},
 		    },
 		    messages: {
	    		'firstName': "Please Enter First Name!",
 		    	'lastName': "Please Enter Last Name!",
 		    	'emailId' : "Please Enter Valid EmailId!",
 		    	'mobileNumber' : "Please Enter ModileNumber!",
 		    	'userName' : "Please Eneter User Name!",
 		    	'password' : "Please Enter Password!",
 		    	'role.roleId' : "Please select User Role!",
 		    	'imagePath' : "Please Upload Image!"
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
	}); 
    </script>
<%@ include file="footer.jsp"%>