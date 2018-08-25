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
              <form:form method="post" name="formState" action="${pageContext.request.contextPath}/state/insert" commandName="state" enctype="multipart/form-data">
				<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label">Country</label>
					<form:select id="inputCountry"
						class="form-control" path="country.id">
						<option value="">Select</option>
						<c:forEach items="${countryList}" var="country">
							<option value="${country.id}">${country.name}</option>
						</c:forEach>
					</form:select>
				</div>	
                <div class="form-group col-md-6">
					<label class="control-label">State</label>
					<form:input type="text" path="stateName" class="form-control" placeholder="Enter State"/>
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
 		$("form[name='formState']").validate({
 		    rules: {
 		    	'stateName': "required",
 		    	'country.id'	: "required"
 		    },
 		    messages: {
	    		'stateName': "Please Enter User State!",
	    		'country.id'	: "Please select country"
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
	}); 
    </script>
<%@ include file="footer.jsp"%>