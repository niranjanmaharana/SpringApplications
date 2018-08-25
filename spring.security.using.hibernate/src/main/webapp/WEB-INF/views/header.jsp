<%@page import="com.rxprism.vo.User"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html lang="en">
  <head>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <title>RxKiosk</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.validate.js"></script>
  </head>
  <%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	User obj = auth != null && auth.getPrincipal() != null ?  (User) auth.getPrincipal() : null;
	String name = "";
	String imagePath = "";
	int role = 0;
	if(obj == null){
		final String  contextURL = session.getServletContext().getContextPath();
		response.sendRedirect(contextURL);
	}else{
		name = obj.getFirstName().concat(obj.getLastName());
		imagePath = obj.getImagePath();
	}
%>
  <body class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="index.html">RxKiosk</a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="fa fa-search"></i></button>
        </li>
        <!--Notification Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell-o fa-lg"></i></a>
          <ul class="app-notification dropdown-menu dropdown-menu-right">
            <li class="app-notification__title">You have 2 new notifications.</li>
            <div class="app-notification__content">
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Notification header</p>
                    <p class="app-notification__meta">2 min ago</p>
                  </div></a></li>
            </div>
            <li class="app-notification__footer"><a href="#">See all notifications.</a></li>
          </ul>
        </li>
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/am/logout"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="${pageContext.request.contextPath}/<%=imagePath%>" width="50px" height="50px">
        <div>
          <p class="app-sidebar__user-name"><%=name %></p>
         <!-- <p class="app-sidebar__user-designation">Frontend Developer</p> -->
        </div>
      </div>
      <ul class="app-menu">
        <li><a id="dashboardLink" class="app-menu__item" href="${pageContext.request.contextPath}/dashboard/view"><i class="app-menu__icon fa fa-home"></i><span class="app-menu__label">Home</span></a></li>
        <li class="treeview"><a id="regionLink" class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-globe"></i><span class="app-menu__label">Region</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/region/create"><i class="icon fa fa-plus-circle"></i>Create</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/region/view"><i class="icon fa fa-eye"></i> View</a></li>
          </ul>
        </li>
        <li class="treeview"><a id="implementationLink" class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-building"></i><span class="app-menu__label">Implementation</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/implementation/load"><i class="icon fa fa-plus-circle"></i>Create</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/implementation/view"><i class="icon fa fa-eye"></i> View</a></li>
          </ul>
        </li>
        <li class="treeview"><a id="clinicLink" class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-h-square"></i><span class="app-menu__label">Clinic</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/clinic/load"><i class="icon fa fa-plus-circle"></i>Create</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/clinic/view"><i class="icon fa fa-eye"></i> View</a></li>
          </ul>
        </li>
        <li class="treeview"><a id="userLink" class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-user"></i><span class="app-menu__label">User</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/user/createDoctor"><i class="icon fa fa-user-md"></i>Create Doctor</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/user/viewDoctors"><i class="icon fa fa-user-md"></i> View Doctor</a></li>
             <li><a class="treeview-item" href="${pageContext.request.contextPath}/user/createUser"><i class="icon fa fa fa-user"></i>Create User</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/user/viewUser"><i class="icon fa fa-user"></i> View User</a></li>
          </ul>
        </li>
        <li class="treeview"><a id="deviceLink" class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-desktop"></i><span class="app-menu__label">Device</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/device/load"><i class="icon fa fa-plus-circle"></i>Create</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/device/view"><i class="icon fa fa-eye"></i> View</a></li>
          </ul>
        </li>
         <li class="treeview"><a id="postLink" class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-upload"></i><span class="app-menu__label">Post</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/post/load"><i class="icon fa fa-plus-circle"></i>Create</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/post/view"><i class="icon fa fa-eye"></i> View</a></li>
          </ul>
        </li>
        <li class="treeview"><a id="roleLink" class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-users"></i><span class="app-menu__label">User Role</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/role/load"><i class="icon fa fa-plus-circle"></i>Create</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/role/view"><i class="icon fa fa-eye"></i> View</a></li>
          </ul>
        </li>
      </ul>
      <div >
      <br>
      <p style="background: #198fc5;text-align:center;color: white;">Master Info</p>
      </div>
      <ul class="app-menu">
        <li class="treeview"><a id="educationLink" class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-graduation-cap"></i><span class="app-menu__label">Education</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/education/load"><i class="icon fa fa-plus-circle"></i>Create</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/education/view"><i class="icon fa fa-eye"></i> View</a></li>
          </ul>
        </li>
        <li class="treeview"><a id="specialityLink" class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-heartbeat"></i><span class="app-menu__label">Speciality</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/speciality/load"><i class="icon fa fa-plus-circle"></i>Create</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/speciality/view" ><i class="icon fa fa-eye"></i> View</a></li>
          </ul>
        </li>
        <li class="treeview"><a id="countryLink" class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-flag"></i><span class="app-menu__label">Country</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/country/load"><i class="icon fa fa-plus-circle"></i>Create</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/country/view" ><i class="icon fa fa-eye"></i> View</a></li>
          </ul>
        </li>
        <li class="treeview"><a id="stateLink" class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-globe"></i><span class="app-menu__label">State</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/state/load"><i class="icon fa fa-plus-circle"></i>Create</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/state/view" ><i class="icon fa fa-eye"></i> View</a></li>
          </ul>
        </li>
        </ul>
        <br>
        <br>
    </aside>
    <script>
    	$(document).ready(function(){
    		var currentUrl = window.location.toString().split("/").reverse()[1];
    		var currentActveLink = $(".app-menu__item").closest(".active").attr("id");
    		$("#"+currentActveLink).removeClass("active");
			$("#"+currentUrl+"Link").addClass("active");
    	});
    </script>