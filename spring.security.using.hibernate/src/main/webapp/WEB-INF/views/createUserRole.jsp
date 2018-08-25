<%@ include file="header.jsp"%>
 <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> Welcome to RxKiosk</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Role</li>
          <li class="breadcrumb-item"><a href="#">Create Role</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="tile">
            <h3 class="tile-title">Vertical Form</h3>
            <div class="tile-body">
              <form:form method="post" name="formUserRole" action="insert" commandName="userRole" enctype="multipart/form-data">
				<div class="row">
                <div class="form-group col-md-6">
					<label class="control-label">User Role</label>
					<form:input type="text" path="userRole" class="form-control" placeholder="Enter User Role"/>
				</div>
                </div>
				<div class="tile-footer">
            	  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save</button>&nbsp;&nbsp;&nbsp;
            	</div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script>
	 $(function() {
 		$("form[name='formUserRole']").validate({
 		    rules: {
 		    	'userRole': "required",
 		    },
 		    messages: {
	    		'userRole': "Please Enter User Role!",
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
	}); 
    </script>
<%@ include file="footer.jsp"%>