<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link
	href="${pageContext.request.contextPath }/mutualResource/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/mutualResource/css/style.css" />
<link
	href="${pageContext.request.contextPath }/mutualResource/assets/css/codemirror.css"
	rel="stylesheet">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath }/mutualResource/assets/css/ace.min.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath }/mutualResource/assets/css/font-awesome.min.css" />
	<!--[if IE 7]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath }/mutualResource/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
	<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath }/mutualResource/assets/css/ace-ie.min.css" />
		<![endif]-->
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/js/jquery.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

	<!--[if !IE]> -->

	<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath }/mutualResource/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${pageContext.request.contextPath }/mutualResource/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

	<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath }/mutualResource/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/js/typeahead-bs2.min.js"></script>
	<!-- page specific plugin scripts -->
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/js/jquery.dataTables.bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/mutualResource/js/H-ui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/mutualResource/js/H-ui.admin.js"></script>
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/layer/layer.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath }/mutualResource/assets/laydate/laydate.js"
		type="text/javascript"></script>
</head>

<body>
	<div class="page-content clearfix">
		<div id="Member_Ratings">
			<div class="d_Confirm_Order_style">
				<div class="search_style">
					<div class="title_names">????????????</div>
					<ul class="search_content clearfix">
						<form
							action="${pageContext.request.contextPath }/admin/AnnouncmentServlet?m=listAnnouncment"
							method="post">

							<li><label class="l_f">?????????</label><input name="creater"
								type="text" class="text_add" placeholder="?????????"
								value="${search.creater }" /></li>
							<li><label class="l_f">??????</label><input name="title"
								type="text" class="text_add" placeholder="????????????"
								value="${search.title }" /></li>

							<li><label class="l_f">??????</label><input name="name"
								type="text" class="text_add" placeholder="????????????"
								value="${search.context }" /></li>
							<li><label class="l_f">??????????????????</label><input
								style="width: 120px;" id="startTime" name="startTime"
								type="text" class="inline laydate-icon" placeholder="???????????????"
								value="${search.startTime }" /></li>
							<li><label class="l_f">???</label><input style="width: 120px;"
								id="endTime" name="endTime" type="text"
								class="inline laydate-icon" placeholder="?????????"
								value="${search.endTime }" />???</li>


							<li><button type="submit" class="btn_search">
									<i class="icon-search"></i>??????
								</button></li>

						</form>

					</ul>
				</div>
				<!---->
				<div class="border clearfix">
					<span class="l_f"> <a href="javascript:void()"
						id="member_add" class="btn btn-warning"><i class="icon-plus"></i>????????????</a>
					</span> <span class="r_f">??????<b>${listSize }</b>???
					</span>
				</div>
				<!---->
				<div class="table_menu_list">
					<table class="table table-striped table-bordered table-hover"
						id="sample-table">

						<thead>
							<tr>
								<th width="100">?????????</th>
								<th width="100">??????</th>
								<th>??????</th>
								<th width="100">????????????</th>
								<th width="70">??????</th>
								<th width="250">??????</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${announcementList }" var="announcement">

								<tr>

									<td>${announcement.admin.name }</td>


									<td>${announcement.title }</td>


									<td class="text-l">${announcement.context }</td>

									<td>
									<fmt:formatDate value="${announcement.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>

									<c:if test="${announcement.isActive eq 1}">
										<td class="td-status"><span
											class="label label-success radius">??????</span></td>

										<td class="td-manage"><a
											onClick="member_stop(this,${announcement.announcementId })"
											href="javascript:;" title="??????" class="btn btn-xs btn"><i
												class="icon-ok bigger-120"></i></a> <a
											style="text-decoration: none"
											onClick="member_show(this,${announcement.announcementId })"
											href="javascript:;" title="????????????"
											class="btn btn-xs btn-success">????????????</a></td>

									</c:if>
									<c:if test="${announcement.isActive eq 0}">
										<td class="td-status"><span
											class="label label-defaunt radius">??????</span></td>
										<td><a style="text-decoration: none"
											onClick="member_start(this,${announcement.announcementId })"
											href="javascript:;" title="??????" class="btn btn-xs btn-success"><i
												class="icon-ok bigger-120"></i></a> <a
											style="text-decoration: none"
											onClick="member_show(this,${announcement.announcementId })"
											href="javascript:;" title="????????????"
											class="btn btn-xs btn-success">????????????</a></td>
									</c:if>

								</tr>


							</c:forEach>



						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--??????????????????-->
	<div class="add_menber" id="add_menber_style" style="display: none">
		<form id="announcementForm">
			<ul class=" page-content">

				<li><label class="label_name">???????????????</label><span
					class="add_name"><input name="title" type="text" id="title"
						class="text_add" /></span>
				<div class="prompt r_f"></div></li>

				<li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span
					class="add_name"> <label><input name="isActive"
							value="1" type="radio" id="isActive1" class="ace"><span
								class="lbl">??????</span></label>&nbsp;&nbsp;&nbsp; <label><input
							name="isActive" value="0" type="radio" id="isActive0" class="ace"><span
								class="lbl">??????</span></label></span>
				<div class="prompt r_f" id="isActiveDiv"></div></li>

				<li><label class="label_name">????????????:</label> <textarea
						name="context" id="context" class="textarea"
						onKeyUp="textarealength(this,1000)" cols="100" rows="10"></textarea>
					<p class="textarea-numberbar">
						<em class="textarea-length">0</em>/1000
					</p>
					<div class="prompt r_f" id="contextDiv"></div></li>

			</ul>

		</form>
	</div>
	<div id=announcementSee class="add_menber" style="display: none">
		<h1 id="titleSee">??????</h1>
		<hr />
		<div id="contextSee">????????????</div>
		<hr />
		<font style="color:green">
		???:<span id="createrSee">?????????</span>???<span id="createTimeSee">??????</span> ??????
		</font>
	</div>


</body>
</html>
<script>
jQuery(function($) {
	
	
				
	var oTable1 = $('#sample-table').dataTable( {
		 "bSort" : true, //???????????????????????????????????????  
		"bStateSave": true,//????????????
		"bPaginate" : true, 
		 "bInfo" : true, //???????????????????????????DataTables??????????????????????????????  
		"searching": true//?????????????????????
		
	} );
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				
				
				
				/**
				*???????????????????????????
				*/
				$("#announcementForm :input").each(function(){
					
					var thisElement = $(this);
					
					//???????????????????????????????????????
					$(this).change(function(){ 
						
						isAbleCheckOne(thisElement);

					});	
				})
				
			});
 
			
/*??????-??????*/
 $('#member_add').on('click', function(){
	 
    layer.open({
        type: 1,
        title: '????????????&nbsp;&nbsp;<font style="color:red">*??????:??????????????????????????????*</font>',
		maxmin: true, 
		shadeClose: false, //?????????????????????
        area : ['800px' , '500px'],
        content:$('#add_menber_style'),
		btn:['??????','??????'],
		yes:function(index,layero){	
			
			var msg = "";
			
			if(isAble()){
				//??????????????????
				
				//ajax??????
			     $.ajax({  
			          url: '${pageContext.request.contextPath }/announcment/AnnouncmentServlet?m=addAnnouncement' ,  
			          type: 'POST',  
			          dataType:'json', 
			          data: $("#announcementForm").serialize(),  
			          cache: false,  
			          success: function (data) { 
			        	  
			        	  if(data.isSuccess){
			        		  
			        		  msg = "???????????????";
			        		  
			        		  //??????
			        		  $("#tilte,#context").val("");
			        		  $("#tilte,#context").text("");
			        		  $("#announcementForm").find("input:radio:checked").removeAttr('checked');
			        		  $('#add_menber_style').find("div[class='prompt r_f']").text("");
			        		  
			        		  layer.alert(msg,
						    		  
			   	 	               {title: '?????????',				
			   	 					icon:1,	}	,
			   	 					function(){
			   	 						location.reload();
			   	 				  }); 
			        		  
			        	  }else{
			        		  msg = data.msg;
			        		  layer.alert(msg,
						    		  
			   	 	               {title: '?????????',				
			   	 					icon:1,	}	,
			   	 					);
			        	  }
			          },  
			          error: function (returndata) {  
			        	  msg = "????????????????????????"; 
			        	  layer.alert(msg,
					    		  
				 	               {title: '?????????',				
				 					icon:1,	}	,
				 					);
			        	  
			          }  
			     }); 
				
			     layer.close(index);
			     
				
			}else{
				
				layer.alert("???????????????????????????",{
	 	               title: '?????????',				
	 				icon:1,		
	 				  });
				
			}
			
			
		     
		}
    });
});


/*??????-??????
 * ????????????oclick???????????????
 */
function member_show(an,id){
	
	//?????????????????????
	selectedDoctor(id);
	
	//??????????????????
	  layer.open({
      type: 1,
      title: '????????????',
		maxmin: true, 
		shadeClose:false, //?????????????????????
      area : ['500px' , '500px'],
      content:$('#announcementSee'),
		btn:['????????????'],
		yes:function(index,layero){	
			layer.close(index);				
		}
  });
}
/*????????????*/
function member_stop(obj,id){
	layer.confirm('?????????????????????',function(index){
		
		//ajax
		$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/announcment/AnnouncmentServlet?m=updateActive&action=0&id="+id,
		dataType : "json",
		success : function(data) {
			
			if (data['isSuccess'] == true) {
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success " onClick="member_start(this,' + id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">??????</span>');
				$(obj).remove();
				layer.msg('?????????!',{icon: 5,time:1000});
			}else{
				layer.msg('????????????! '+data['msg'],{icon: 0,time:1000});
			}
		}
	});
		
	});
}

/*????????????*/
function member_start(obj,id){
	layer.confirm('?????????????????????',function(index){
		
		//ajax
		$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/announcment/AnnouncmentServlet?m=updateActive&action=1&id="+id,
		dataType : "json",
		success : function(data) {
			
			if (data['isSuccess'] == true) {
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn" onClick="member_stop(this,' + id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">??????</span>');
				$(obj).remove();
				layer.msg('?????????!',{icon: 6,time:1000});
			}else{
				layer.msg('????????????! '+data['msg'],{icon: 0,time:1000});
			}
		}
	});
		
		
	});
}





/**
 * ?????????????????????
 */
function selectedDoctor(id){
	
	//ajax
	$.ajax({
	type : "GET",
	url : "${pageContext.request.contextPath}/announcment/AnnouncmentServlet?m=selecteAnnouncement&id="+id,
	dataType : "json",
	success : function(data) {
		
		//????????????
		if (data['isSuccess'] == true) {
			
			
			//???????????????
			
			//??????
			$("#titleSee").text(data.dataList[0].title);
			console.log("data.dataList[0].title-> " + data.dataList[0].title);
			
			//??????
			$("#contextSee").text(data.dataList[0].context);
			
			//????????????
			$("#createTimeSee").text(data.dataList[0].createTime);
			
			//?????????
			$("#createrSee").text(data.dataList[0].admin.name);
			/* 
			$("#announcementSee").each(function(){
				
				if($(this).is("h1")){
					
					console.log("data.dataList[0].title-> " + data.dataList[0].title);
					$(this).val(data.dataList[0].title);
					return;
				}
				
				if($(this).is("div")){
					
					console.log("data.dataList[0].context-> " + data.dataList[0].context);
					
					$(this).val(data.dataList[0].context);
					return;
				}
				
				if($(this).is("#createTime")){
					
					console.log("data.dataList[0].createTime-> " + data.dataList[0].createTime);
					
					$(this).val(data.dataList[0].createTime);
					return;
				}
				
				if($(this).is("#creater")){
					
					console.log("data.dataList[0].admin.name-> " + data.dataList[0].admin.name);
					
					$(this).val(data.dataList[0].admin.name);
					return;
				}
				
			}); */
			
		
		
		}else{
			layer.msg(data['msg'],{icon: 0,time:1000});
		}
	}
	});
	
	
}



/**
 * ????????????????????????
 */
 function isAble(){
	
	var isOk = true;
	
	 $("#announcementForm :input").each(function(){
		 
		 //????????????????????????
		 if( !isAbleCheckOne($(this))){
			 isOk = false;
		 }
		 
	 });
	 
	 return isOk;
	
}

 function isAbleCheckOne(thisElement){
	 
	 var isOk = true;
	 
	//????????????
	 if($(thisElement).is("#title")){
		 
		 var len = $(thisElement).val().length;
		 
         if(len > 10 || len < 1){
        	 
             var errorMsg = "?????????1-10????????????";
             
             $(thisElement).parent().next("div").attr("style","color:red");
             
             $(thisElement).parent().next("div").html(errorMsg);
             
             isOk = false;
             
         }else{
        	 
        	 $(thisElement).parent().next("div").attr("style","color:green");
        	 
        	 $(thisElement).parent().next("div").html("??????");
         }
         
	 }
	
	//????????????
	 if($(thisElement).is("#context")){
		 
		 var len = $(thisElement).val().length;
		 
         if(len > 1000 || len < 1){
        	 
             var errorMsg = "?????????1-1000????????????";
             
             $("#contextDiv").attr("style","color:red");
             
             $("#contextDiv").html(errorMsg);
             
             isOk = false;
             
         }else{
        	 
        	 $("#contextDiv").attr("style","color:green");
        	 
        	 $("#contextDiv").html("??????");
         }
         
	 }
	 
	 
		//???????????????????????????????????????
		if($(thisElement).is("input[name='isActive']")){
			
			var msg = "";
			
			if( $("input[name='isActive']:checked").val() == null){
				
				msg = "????????????";
				$("#isActiveDiv").attr("style","color:red");
				
				isOk = false;
				
			}else{
				
				$("#isActiveDiv").attr("style","color:green");
				msg = "??????";
				
			}
			
			//????????????
			$("#isActiveDiv").html(msg);
			
		}
	 
		return isOk;
 }




 laydate({
    elem: '#startTime',
    event: 'focus' 
}); 
 laydate({
	    elem: '#endTime',
	    event: 'focus' 
	}); 

</script>