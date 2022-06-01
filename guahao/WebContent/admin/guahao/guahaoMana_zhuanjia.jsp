<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<c:forEach items="${requestScope.guahaoList}" var="guahao" varStatus="sta">
		               <fieldset style="width:95%; margin-left:5px;"><legend class="fieldtitle"></legend>
							<form action="<%=path %>/guahaoDel.action" name="111" method="post">
							<table class="bill" width="97%" cellpadding="3" cellspacing="3">
							    <tr>
							        <td>挂号专家：${guahao.zhuanjia.xingming}</td>
							    </tr>
							    <tr>
							        <td>挂号时间：${guahao.riqi}</td>
							    </tr>
							    <tr>
							        <td>所患疾病：${guahao.jibing}</td>
							    </tr>
							    <tr>
							        <td>患者姓名：${guahao.xingming}</td>
							    </tr>
							    <tr>
							        <td>联系方式：${guahao.lianxi}</td>
							    </tr>
							</table>
							</form>
					   </fieldset>
					   <br/>
					   </c:forEach>
	</body>
</html>
