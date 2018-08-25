<%@ include file="header.jsp"%>
 <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> Welcome to RxKiosk</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Post</li>
          <li class="breadcrumb-item"><a href="#">Create Post</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="tile">
            <h3 class="tile-title">Post Info</h3>
            <div class="tile-body">
              <form:form method="post" name="postform" action="${pageContext.request.contextPath}/post/update" commandName="post" enctype="multipart/form-data">
              	<form:input type="hidden" path="postId"/>
				<div class="row">
             		<div class="form-group col-md-6">
					<label class="control-label">Post Type</label>
					<select class="form-control" id="droup" name='droup'>
					<option value="">select</option>
						<option value="1" >Text</option>
						<option value="2" >Video</option>
					</select>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label">Post Visibility</label>
						<select class="form-control" id="visibility" name="visibility">
						<option value="">select</option>
						<option value="region">Specfic Region</option>
						<option value="implementation">Specfic Implementation</option>
						<option value="clinic">Specfic Clinic</option>
					</select>
				</div>
				</div>
				<div id="postContentInfo" ${post.postId == 0 ? "style='display:none';" : ""}>
				<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label">Post Content</label>
					<form:textarea id="text" class="form-control" type="text" placeholder="Enter Post Content" path="postContent"/>
					<input id="file" class="form-control" type="file" name="file" placeholder="Upload Image"/>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label">Select Visibility</label>
						<form:select class="form-control" id="region" path="region.regionId">
						<option value="-1">select</option>
						<c:forEach items="${regionList}" var="region">
							<option value="${region.regionId}">${region.regionName}</option>
						</c:forEach>
						</form:select>
						
						<form:select class="form-control" id="implementaion" path="implementation.areaId">
						<option value="-1">select</option>
						<c:forEach items="${implementationList}" var="implementation">
							<option value="${implementation.areaId}">${implementation.areaName}</option>
						</c:forEach>
						</form:select>
						
						<form:select  class="form-control"  id="clinic" path="clinic.clinicId">
						<option value="-1">select</option>
						<c:forEach items="${clinicList}" var="clinic">
							<option value="${clinic.clinicId}">${clinic.clincName}</option>
						</c:forEach>
						</form:select>
				</div>
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
   		$('#file').hide();
   		$('#droup').on("change",function(){
   			var drop = $(this).val();
   			if(drop==1) {
   				$('#file').hide();
   				$('#text').show();
   			}
   			else{
   				$('#text').hide();
   				$('#file').show();
   			}
   		})
   		
   		$('#visibility').on("change",function(){
   			if($("#region-error").is(":visible") == true){
   				$("#region-error").hide();	
   			}
   			if($("#implementaion-error").is(":visible") == true){
   				$("#implementaion-error").hide();	
   			}
   			if($("#clinic-error").is(":visible") == true){
   				$("#clinic-error").hide();	
   			}
   			var visibility = $(this).val();
   			if(visibility=='clinic'){
   				$('#clinic').show();
   				$('#region').hide();
   				$('#implementaion').hide();
   			}if(visibility=='region'){
   				$('#region').show();
   				$('#implementaion').hide();
   				$('#clinic').hide();
   			}if(visibility=='implementation'){
   				$('#implementaion').show();
   				$('#region').hide();
   				$('#clinic').hide();
   			}
   			$("#postContentInfo").show();
   		})
   	 });
	 $(function() {
 		$("form[name='postform']").validate({
 		    rules: {
 		    	'droup' : "required",
 		    	'visibility':"required",
 		    	'file':"required",
 		    	'postContent':"required",
 		    	'region.regionId':{
 		    		required : true,
 		    		digits : true
 		    	},
 		    	'implementation.areaId':{
 		    		required : true,
 		    		digits : true
 		    	},
 		    	'clinic.clinicId':{
 		    		required : true,
 		    		digits : true
 		    	}
 		    },
 		    messages: {
 		    	'droup' : "Pleasse select post content!",
 		    	'visibility' : "Please select post visibility!",
 		    	'file':"Please select file!",
 		    	'postContent':"Please enter the specfic content!",
 		    	'region.regionId':"Please select specfic region!",
 		    	'implementation.areaId' : "Please select specfic area!",
 		    	'clinic.clinicId' : "Please select specfic clinic!",
 		    },
 		    submitHandler: function(form) {
 		      form.submit();
 		    }
 		  });
		}); 
    </script>
<%@ include file="footer.jsp"%>