package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TUserDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport
{
    private int userId;
	private String userName;
	private String userPw;
	private String userRealname;
	
	private String userAddress;
	private String userTel;
	private String userEmail;
	private String userDel;
   
	
	
	
	private String message;
	private String path;
	
	private TUserDAO userDAO;
	
	
	
	public String userReg()
	{
		TUser user=new TUser();
		
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		
		user.setUserRealname(userRealname);
		user.setUserEmail(userEmail);
		user.setUserDel("no");
		
		userDAO.save(user);
		
		this.setMessage("ע��ɹ������¼");
		this.setPath("qiantai/default.jsp");
		return "succeed";
	}
	
	
	public String userLogin()
	{
		String sql="from TUser where userName=? and userPw=? and userDel='no'";
		Object[] con={userName,userPw};
		List userList=userDAO.getHibernateTemplate().find(sql,con);
		
		System.out.println(userList.size()+"%%");
		if(userList.size()==0)
		{
			this.setMessage("�û������������");
			this.setPath("qiantai/default.jsp");
		}
		else
		{
			 Map session= ServletActionContext.getContext().getSession();
			 TUser user=(TUser)userList.get(0);
			 session.put("user", user);
			 session.put("userType", 2);
			 
			 this.setMessage("�ɹ���¼");
			 this.setPath("qiantai/default.jsp");
		}
		
		return "succeed";
	}
	
	public String userLogout()
	{
		Map session= ServletActionContext.getContext().getSession();
		session.put("user", null);
		session.put("userType", null);
		 
		this.setMessage("��ȫ�˳�ϵͳ");
		this.setPath("qiantai/default.jsp");
		return "succeed";
	}
	
	public String userEdit()
	{
		TUser user=userDAO.findById(userId);
		
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		
		user.setUserRealname(userRealname);
		user.setUserEmail(userEmail);
		user.setUserDel("no");
		
		userDAO.attachDirty(user);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "�޸ĳɹ�,���µ�½����Ч");
		return "msg";
	}
	
	
	
	
	public String userMana()
	{
		String sql="from TUser where userDel='no'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String userDel()
	{
		TUser user=userDAO.findById(userId);
		user.setUserDel("yes");
		
		userDAO.attachDirty(user);
		this.setMessage("ɾ���ɹ�");
		this.setPath("userMana.action");
		return "succeed";
	}
	
	
	
	
	
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getUserPw()
	{
		return userPw;
	}
	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}
	public String getUserRealname()
	{
		return userRealname;
	}
	public void setUserRealname(String userRealname)
	{
		this.userRealname = userRealname;
	}
	public String getUserAddress()
	{
		return userAddress;
	}
	public void setUserAddress(String userAddress)
	{
		this.userAddress = userAddress;
	}
	public String getUserTel()
	{
		return userTel;
	}
	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
	}
	public String getUserEmail()
	{
		return userEmail;
	}
	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}
	public String getUserDel()
	{
		return userDel;
	}
	public void setUserDel(String userDel)
	{
		this.userDel = userDel;
	}
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public TUserDAO getUserDAO()
	{
		return userDAO;
	}
	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}
	
}
