<%@ include file="header.jsp"%>
 <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> Welcome to RxKiosk</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Region</li>
          <li class="breadcrumb-item"><a href="#">Create Region</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="tile">
            <h3 class="tile-title">Region Info</h3>
            <div class="tile-body">
             <form:form method="POST" name="formRegion" action="update" commandName="region">
				<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label">Country</label>
					<form:select id="inputCountry" class="form-control" path="country.id"  items="${countryList}" itemValue="id" itemLabel="name" />
				</div>
				<div class="form-group col-md-6">
					<label class="control-label">State</label>
					<form:select id="inputState" class="form-control" path="state.stateId"  items="${stateList}" itemValue="stateId" itemLabel="stateName" />
						<form:input type="hidden" path="regionId" class="form-control"/>
				</div>
				
                </div>
				<div class="row">
                	<div class="form-group col-md-6">
						<label class="control-label">Region Name</label>
						<form:input type="text" path="regionName" class="form-control" placeholder="Enter Region name"/>
					</div>
				</div>
				<div class="tile-footer">
            	  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Update</button>&nbsp;&nbsp;&nbsp;
            	  <a class="btn btn-secondary" href="${pageContext.request.contextPath}/region/view"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
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
    					   for(var i =0;i<data.length;i++){
    					   		var optionItem = "<option value="+data[i].id+">"+data[i].name+"</options>";
    					   		optionsList += optionItem;
    					   }
    					   $("#inputState").html(optionsList);
   					   },
    				   error: function(e) {
    				      alert("error");
    				   },
    				   
    				});
    		});
    	});
	$(function() {
 		$("form[name='formRegion']").validate({
 		    rules: {
 		    	'regionName': "required",
 		    	'country.id': "required",
 		    	'state.id' : "required"
 		    },
 		    messages: {
	    		'regionName': "Please provide Region name!",
 		    	'country.id': "Please select country!",
 		    	'state.id' : "Please select city!"
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
	});
    </script>
<%@ include file="footer.jsp"%>