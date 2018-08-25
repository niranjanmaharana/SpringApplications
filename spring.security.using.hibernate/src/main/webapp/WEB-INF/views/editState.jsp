<%@ include file="header.jsp"%>
 <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> Welcome to RxKiosk</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">State</li>
          <li class="breadcrumb-item"><a href="#">Create State</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="tile">
            <h3 class="tile-title">State Info</h3>
            <div class="tile-body">
             <form:form method="POST" name="formState" action="update" commandName="state">
				<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label">Country</label>
					<form:select id="inputCountry" class="form-control" path="country.id"  items="${countryList}" itemValue="id" itemLabel="name" />
				</div>
                <div class="form-group col-md-6">
					<label class="control-label">State Name</label>

					<form:input type="text" path="stateName" class="form-control" placeholder="Enter State name"/>
					
					<form:input class="form-control" type="hidden" path="stateId"/>
				</div>
                </div>
				<div class="row">
				</div>
				<div class="tile-footer">
            	  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>&nbsp;&nbsp;&nbsp;
            	  <a class="btn btn-secondary" href="${pageContext.request.contextPath}/state/view"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
            </div>
            </form:form>
            </div>
            
          </div>
        </div>
      </div>
    </main>
    <script>
    	$(document).ready(function(){
    		var contextPath = "${pageContext.request.contextPath}";
    		
    	});
	$(function() {
 		$("form[name='formState']").validate({
 		    rules: {
 		    	'stateName': "required",
 		    	'country.id': "required",
 		    },
 		    messages: {
	    		'stateName': "Please privide State name!",
 		    	'country.id': "Please select country!",
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
	});
    </script>
<%@ include file="footer.jsp"%>