<%@ include file="header.jsp"%>
 <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> Welcome to RxKiosk</h1>
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
             <form:form method="post" name="userform" action="${pageContext.request.contextPath}/user/updateUser" commandName="user" enctype="multipart/form-data">
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
					<label class="control-label">User Name</label>
					<form:input class="form-control" type="text" placeholder="Enter Username" path="userName"/>
				</div>
				<div class="form-group col-md-6">
                	<label class="control-label">Role Name</label>
					<form:select class="form-control" path="role.roleId" items="${roleList}" itemValue="roleId" itemLabel="userRole"></form:select>
				</div>
				</div>
                <div class="row">
				<div class="form-group col-md-6">
					<label class="control-label">Upload Image</label>
					<input class="form-control" type="file" name="file" placeholder="Upload Image"/>
				</div>
				</div>
				<form:input type="hidden" path="userId" class="form-control"/>
				<form:input type="hidden" path="password" class="form-control"/>
				<div class="tile-footer">
            	  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>update</button>&nbsp;&nbsp;&nbsp;
            	  <a class="btn btn-secondary" href="${pageContext.request.contextPath}/user/viewUser"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
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
 		    	'firstName': "required",
 		    	'lastName' : "required",
 		    	'emailId' : "required",
 		    	'userName' : "required",
 		    	'mobileNumber' :  {required: true,number:true},
 		    	'password' : "required",
 		    	'role.roleId' : "required",
 		    	'file' : "required"
 		    },
 		    messages: {
		    	'firstName': "Please Enter First Name!",
		    	'lastName': "Please Enter Last Name!",
		    	'emailId': "Please Enter valid Email!",
		    	'userName': "Please Enter User Name!",
		    	'mobileNumber': "Please Enter Mobile Number!",
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