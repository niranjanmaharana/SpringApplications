<%@ include file="header.jsp"%>
 <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> Welcome to RxKiosk</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Implementation</li>
          <li class="breadcrumb-item"><a href="#">Create Implementation</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="tile">
            <h3 class="tile-title">Vertical Form</h3>
            <div class="tile-body">
             <form:form method="POST" name="formimplementation" action="update" commandName="implementation">
				<div class="row">
				
				<div class="form-group col-md-6">
                	<label class="control-label">State</label>
                		<select name="state" class="form-control" id="statename">
                		<c:forEach items="${stateList}" var="state">
                			<option value="${state.stateId}">${state.stateName}</option>
                		</c:forEach>
                	</select>
                </div>
                <div class="form-group col-md-6">
					<label class="control-label">Region Name</label>
					<form:select id="inputRegion" class="form-control" path="region.regionId"  items="${regionList}" itemValue="regionId" itemLabel="regionName" />
				</div>
				</div>
				<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label">Area Name</label>
					<form:input class="form-control" type="text" placeholder="Enter area name" path="areaName"/>
						<form:input type="hidden" path="areaId" class="form-control"/>
						<form:input id="stateId" type="hidden" path="region.state.stateId" class="form-control"/>
				</div>
                </div>
				<div class="tile-footer">
            	  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>update</button>&nbsp;&nbsp;&nbsp;
            	  <a class="btn btn-secondary" href="${pageContext.request.contextPath}/implementation/view"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
            </div>
            </form:form>
            </div>
            
          </div>
        </div>
      </div>
    </main>
	<script>
	$(document).ready(function(){
		var stateId = $("#stateId").val();
		console.log(stateId);
		if(stateId.trim().length > 0){
			$("#statename").val(stateId);
		} 
		var contextPath = "${pageContext.request.contextPath}";
		$("#statename").on("change",function(){
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
	});
	$(function() {
 		$("form[name='formimplementation']").validate({
 		    rules: {
 		    	
 		    	'state':"required",
 		    	'region.regionId': "required",
 		    	'areaName' : "required"
 		    },
 		    messages: {
 		    	
 		    'state':"please select state name!",
 		   	'region.regionId': "Please Select Region name!",
		    	'areaName': "Please Enter Area Name!",
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
	});
    </script>
<%@ include file="footer.jsp"%>