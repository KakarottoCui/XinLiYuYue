<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="${pageContext.request.contextPath }/mutualResource/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath }/mutualResource/css/style.css"/>       
        <link href="${pageContext.request.contextPath }/mutualResource/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/mutualResource/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath }/mutualResource/font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath }/mutualResource/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${pageContext.request.contextPath }/mutualResource/js/jquery-1.9.1.min.js"></script>
        <script src="${pageContext.request.contextPath }/mutualResource/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/mutualResource/assets/js/typeahead-bs2.min.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath }/mutualResource/js/H-ui.js"></script>      	
		<script src="${pageContext.request.contextPath }/mutualResource/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath }/mutualResource/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath }/mutualResource/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="${pageContext.request.contextPath }/mutualResource/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/mutualResource/assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="${pageContext.request.contextPath }/mutualResource/js/lrtk.js" type="text/javascript" ></script>
<title>???????????????</title>
</head>

<body>
<div class="margin clearfix">
<div class="Order_Details_style">
 <div class="detailed_style">

    <!--???????????????-->
    <div class="product_style">
    <div class="title_name">?????????</div>
    <div class="Info_style clearfix">
    
    <c:forEach items="${doctorList }" var="doctor">
    
    <div class="product_info clearfix" style="margin: 10px 6%;">
    
    <c:if test="${ empty doctor.img }">
         <a href="#" class="img_link"> <img src="${pageContext.request.contextPath }/mutualResource/images/image.png"  width="200px" height="200px"/></a>
     </c:if>
          <c:if test="${not empty doctor.img }">

          <a href="#" class="img_link"><img src="/mindSubscribe/mutualResource/images/${doctor.img}"  width="200px" height="200px"/></a>
          </c:if>
    
     <%-- <a href="#" class="img_link"><img src="/mindSubscribe/mutualResource/images/${doctor.img}"  width="200" height="200"/></a> --%>

      <span>
     
      <b>${doctor.name }</b>
      <p>?????????${doctor.sex eq 1 ? "???":"???" }</p>
      <p>?????????${doctor.age }</p>
      <p>??????:${doctor.level }</p>
      <p>???????????????${doctor.skill }</p>
      <p> ????????????????????? ${doctor.place } </p>
      <p>?????????${doctor.phone }</p>
      <p>???????????????${doctor.email }</p>
      <a href="${pageContext.request.contextPath }/client/ClientSubServlet?m=subStep1&doctorId=${doctor.doctorId}" id="member_add" class="btn btn-warning">????????????</a>
      <a style="text-decoration:none" onClick="sendMessage(this,'${doctor.doctorId}','${doctor.name}','doctor')"
											href="javascript:;" title="??????"
											class="btn btn-xs btn-success">????????????</a>
      </span>
    </div>
    
    </c:forEach>
    
      
    </div>
    </div>

 </div>
</div>
<%@include file="/mutualResource/form/SendMessageForm.jsp"%>
</body>
</html>
