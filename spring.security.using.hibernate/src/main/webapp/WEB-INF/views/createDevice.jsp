<%@ include file="header.jsp"%>
 <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> Welcome to RxKiosk</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Device</li>
          <li class="breadcrumb-item"><a href="#">Create Device</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="tile">
            <h3 class="tile-title">Device Info</h3>
            <div class="tile-body">
              <form:form method="post" name="deviceform" action="${pageContext.request.contextPath}/device/insert" commandName="device">
				<div class="row">
                <div class="form-group col-md-6">
					<label class="control-label">Device Name</label>
					<form:input class="form-control" type="text" placeholder="Enter device name" path="deviceName"/>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label">Unique DeviceId</label>
					<form:input class="form-control" type="text" placeholder="Enter Device id" path="uniqueDeviceId"/>
				</div>
                </div>
                <div class="row">
                <div class="form-group col-md-6">
					<label class="control-label">Assigning To</label>
					<form:select id="inputCountry"
						class="form-control" path="user.userId">
						<option value="">Select</option>
						<c:forEach items="${userList}" var="user">
							<option value="${user.userId}">${user.firstName}</option>
						</c:forEach>
					</form:select>
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
 		$("form[name='deviceform']").validate({
 		    rules: {
 		    	'deviceName': "required",
 		    	'uniqueDeviceId' : "required",
 		    	'user.userId' : "required"
 		    },
 		    messages: {
	    		'deviceName': "Please Enter Device Name!",
 		    	'uniqueDeviceId' : "Please Enter Device Unique Id!",
 		    	'user.userId' : "Please select the doctor name to assign!"
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
	}); 
    </script>
<%@ include file="footer.jsp"%>