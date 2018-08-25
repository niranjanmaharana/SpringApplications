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
            <h3 class="tile-title">Vertical Form</h3>
            <div class="tile-body">
             <form:form method="POST" name="formRegion" action="${pageContext.request.contextPath}/region/insert" commandName="region">
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
					<form:select id="inputState"
						class="form-control" path="state.stateId">
						<option value="">Select</option>
					</form:select>
				</div>
                </div>
				<div class="row">
               	 <div class="form-group col-md-6">
					<label class="control-label">Region Name</label>
					<form:input type="text" path="regionName" class="form-control" placeholder="Enter Region name"/>
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
    					   console.log(data);
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
    	});
	$(function() {
 		$("form[name='formRegion']").validate({
 		    rules: {
 		    	'regionName': "required",
 		    	'country.id': "required",
 		    	'state.stateId' : "required"
 		    },
 		    messages: {
	    		'regionName': "Please privide Region name!",
 		    	'country.id': "Please select country!",
 		    	'state.stateId' : "Please select city!"
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
	});
    </script>
<%@ include file="footer.jsp"%>