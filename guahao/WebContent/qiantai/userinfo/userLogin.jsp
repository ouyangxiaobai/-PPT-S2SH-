<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">
	        function login()
	        {
	           if(document.userLogin.userName.value=="")
	           {
	               alert("请输入用户名");
	               return;
	           }
	           if(document.userLogin.userPw.value=="")
	           {
	               alert("请输入密码");
	               return;
	           }
	           document.userLogin.submit();
	        }
	        
	        function gerenzhuye()
			{
			    var targetWinUrl="<%=path %>/auser/index.jsp";
				var targetWinName="newWin";
				var features="width="+screen.width+" ,height="+screen.height+" ,toolbar=yes, top=0, left=0, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=yes";
				var new_win=window.open(targetWinUrl,targetWinName,features);
			}
	</script>
  </head>
  
  <body>
        <s:if test="#session.userType !=2">
			<form action="<%=path %>/userLogin.action" name="userLogin" method="post">
			      <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
			          <tr>
			            <td align="center" colspan="2" height="10"></td>
			          </tr>
			          <tr>
			            <td align="right" width="31%" height="30" style="font-size: 11px;">账号：</td>
			            <td align="left" width="69%"><input name="userName" type="text" style="width: 100px;"/></td>
			          </tr>
			          <tr>
			            <td align="right" height="30" style="font-size: 11px;">密码：</td>
			            <td align="left"><input type="password" style="width: 100px;" name="userPw"/></td>
			          </tr>
			          <tr>
			            <td align="center" colspan="2" height="10"><font color="red"><s:property value="#request.error"/></font></td>
			          </tr>
			          <tr>
			            <td align="center" colspan="2" height="30">
			               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			               <input type="button" value="登录" onclick="login()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;width: 50px;" />
						   &nbsp;
						   <input type="reset" value="重置" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;width: 50px;" />
			            </td>
			          </tr>
			      </table>
		    </form>
	    </s:if>
	  
	    <s:if test="#session.userType ==2">
	        <br/>
		             欢迎您：<s:property value="#session.user.userName"/> &nbsp;&nbsp;
		    <a href="<%=path %>/userLogout.action">注销退出</a> &nbsp;&nbsp;
		    <a href="#" onclick="gerenzhuye()">管理中心</a> &nbsp;&nbsp;
		    <br/><br/><br/>
		</s:if>
  </body>
</html>
