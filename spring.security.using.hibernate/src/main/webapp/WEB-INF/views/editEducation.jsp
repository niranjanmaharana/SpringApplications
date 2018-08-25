<%@ include file="header.jsp"%>
 <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i>  Welcome to RxKiosk</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Education</li>
          <li class="breadcrumb-item"><a href="#">Create Education</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="tile">
            <h3 class="tile-title">Education Info</h3>
            <div class="tile-body">
              <form:form method="post" name="educationform" action="${pageContext.request.contextPath}/education/update" commandName="education">
				<div class="row">
                <div class="form-group col-md-6">
					<label class="control-label">Education Name</label>
					<form:input class="form-control" type="text" placeholder="Enter Education name" path="educationName"/>
						<form:input type="hidden" path="educationId"/>
				</div>
                </div>
				<div class="tile-footer">
            	  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save</button>&nbsp;&nbsp;&nbsp;
            	  <a class="btn btn-secondary" href="${pageContext.request.contextPath}/education/view"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
            	</div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script>
	 $(function() {
 		$("form[name='educationform']").validate({
 		    rules: {
 		    	'educationName': "required",
 		    },
 		    messages: {
	    		'educationName': "Please Enter Education Name!"
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
	}); 
    </script>
<%@ include file="footer.jsp"%>