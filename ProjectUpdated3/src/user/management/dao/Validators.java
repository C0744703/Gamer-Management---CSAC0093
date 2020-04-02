package user.management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import user.management.db.DbConnection;
import user.management.model.Sub_user;
import user.management.model.User;

public class Validators {

	private static Connection connection;
	private static ResultSet resultSet;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	
	
	public static boolean verifyUserInfo(User userObj) {
		
		
		String userName=userObj.getUserName();
		String userPassword=userObj.getUserPassword();
		String qry="select * from user where userEmail='"+userName+"'  and userPassword='"+userPassword+"'";
		System.out.println(qry);
		try {
			connection=DbConnection.getConnection();
			statement=connection.createStatement();
			resultSet=statement.executeQuery(qry);
			
			if(resultSet.next())
			{
				userObj.setUserName(resultSet.getString(3));
				return true;
			}
			
			
		} catch (Exception e) {
			System.out.println("User Login Exceptionn "+e);
		}
		
		
		return false;
	}



	public static boolean registerUserInfo(User userObj) {
		try {
			connection=DbConnection.getConnection();
			
			String qrySearch="select * from user where userEmail='"+userObj.getUserEmail()+"'";
			statement=connection.createStatement();
			resultSet=statement.executeQuery(qrySearch);
			if(resultSet.next())
			{
				return false;
			}
			else {
				String qry="insert into user(userEmail, userName, userLastName, userPassword, userConfPassword, userDob, userCaptcha,userCity,userPhn,userAccessType,userAccessTypeActive  )values(?,?,?,?,?,?,?,?,?,?,?)";
				
				preparedStatement=connection.prepareStatement(qry);
				preparedStatement.setString(1, userObj.getUserEmail());
				
				preparedStatement.setString(2, userObj.getUserName());
				preparedStatement.setString(3, userObj.getUserLastName());
				
				preparedStatement.setString(4, userObj.getUserPassword());
				preparedStatement.setString(5, userObj.getUserConfPassword());
				
				preparedStatement.setString(6, userObj.getUserDob());
				preparedStatement.setString(7, userObj.getUserCaptcha());
				
				preparedStatement.setString(8, userObj.getUserCity());
				preparedStatement.setString(9, userObj.getUserPhn());
				
				preparedStatement.setString(10, "Waiting for Approval");
				preparedStatement.setString(11, "Waiting for Approval");
				
				
				int i=preparedStatement.executeUpdate();
				if(i>0)
				{
					return true;
				}
			}
			
			
			
		} catch (Exception e) {
			System.out.println("User Register Exceptionn "+e);
		}
		return false;
	}
	
	
	public static boolean storeUserDataByAdmin(User sub_user)
	{
		try {
			connection=DbConnection.getConnection();
			
			String qrySearch="select * from user where userEmail='"+sub_user.getUserEmail()+"'";
			statement=connection.createStatement();
			resultSet=statement.executeQuery(qrySearch);
			if(resultSet.next())
			{
				return false;
			}
			else {
				String qry="insert into user(userEmail, userPassword, userName, userLastName, userDob, userAccessType, userPhn,userDepartment	,userAdrress,userPostal,userConfPassword)values(?,?,?,?,?,?,?,?,?,?,?)";
				
				preparedStatement=connection.prepareStatement(qry);
				preparedStatement.setString(1, sub_user.getUserEmail());
				
				preparedStatement.setString(2, sub_user.getUserPassword());
				preparedStatement.setString(3, sub_user.getUserName());
				
				preparedStatement.setString(4, sub_user.getUserLastName());
				preparedStatement.setString(5, sub_user.getUserDob());
				
				preparedStatement.setString(6, sub_user.getAccess_Type());
				preparedStatement.setString(7, sub_user.getUserPhn());
				
				preparedStatement.setString(8, sub_user.getDepartment());
				preparedStatement.setString(9, sub_user.getAdrress());
				
				preparedStatement.setString(10, sub_user.getPostal());
				preparedStatement.setString(11, sub_user.getUserPassword());
				int i=preparedStatement.executeUpdate();
				if(i>0)
				{
					return true;
				}
			}
			
			
			
		} catch (Exception e) {
			System.out.println("user Register Exceptionn "+e);
		}
		return false;
	}
	
	public static boolean updateUserInfo(User user)
	{
		try {
			connection=DbConnection.getConnection();
			
			
				String qry="update  user set userPassword=?, userName=?, userLastName=?, userDob=?,userAccessType=?,userPhn=?,userDepartment=?,userAdrress=?,userPostal=? where userEmail=?";
				
				preparedStatement=connection.prepareStatement(qry);
				
				
				preparedStatement.setString(1, user.getUserPassword());
				preparedStatement.setString(2, user.getUserName());
				
				preparedStatement.setString(3, user.getUserLastName());
				preparedStatement.setString(4, user.getUserDob());
				
				preparedStatement.setString(5, user.getAccess_Type());
				preparedStatement.setString(6, user.getUserPhn());
				
				preparedStatement.setString(7, user.getDepartment());
				preparedStatement.setString(8, user.getAdrress());
				
				preparedStatement.setString(9, user.getPostal());
				preparedStatement.setString(10, user.getUserEmail());
				int i=preparedStatement.executeUpdate();
				System.out.println(preparedStatement);
				if(i>0)
				{
					return true;
				}
		
			
			
			
		} catch (Exception e) {
			System.out.println("sub_user Register Exceptionn "+e);
		}
		return false;
		
	}

	public static boolean verifyAdminInfo(User userObj) {
		String adminName=userObj.getUserName();
		String adminPassword=userObj.getUserPassword();
	
		
		try {
			if(adminName.equals("admin")||adminName.equals("admin@gmail.com")&&adminPassword.equals("Admin@123"))
			
			
			{
				
				return true;
			}
			
			
		} catch (Exception e) {
			System.out.println("Admin Login Exceptionn "+e);
		}	
		
		return false;
	}

}
