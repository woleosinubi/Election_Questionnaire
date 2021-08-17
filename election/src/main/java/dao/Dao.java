package dao;

import java.sql.DriverManager;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import data.Candidates;

import java.awt.List;
import java.sql.Connection;

public class Dao {
	private String url;
	private String user;
	private String pass;
	 private static Connection jdbcConnection;
	
	public Dao(String url, String user, String pass) {
		this.url=url;
		this.user=user;
		this.pass=pass;
	}
	
	public boolean Connect() {
		try {
	        if (jdbcConnection== null || jdbcConnection.isClosed()) {
	            try {
	                Class.forName("com.mysql.jdbc.Driver").newInstance();
	            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
	                throw new SQLException(e);
	            }
	            jdbcConnection = DriverManager.getConnection(url, user, pass);
	        }
	        return true;
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
    
    public static boolean insertCandidates(Candidates candidates) throws SQLException {
      

	 
		String sql = "INSERT INTO candidates (fullname, email, age, party, proffesion) VALUES ( ?, ?, ?,?,?)";
	
	         
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, candidates.getFullname());
	        statement.setString(2, candidates.getEmail());
	        statement.setString(3, candidates.getAge());
	        statement.setString(4, candidates.getParty());
	        statement.setString(5, candidates.getProffesion());
	         
	        boolean rowInserted = statement.executeUpdate() > 0;
	        statement.close();
	    
	        return rowInserted;
	    }

	
    public ArrayList<Candidates> listAllCandidates() throws SQLException {
    	ArrayList<Candidates> candidateslist = new ArrayList<>();
         
        String sql = "SELECT * from candidates";
         
   
         
        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
         
        while (resultSet.next()) {
           String id = resultSet.getString("id");
            String fullname = resultSet.getString("fullname");
            String email = resultSet.getString("email");
            String age = resultSet.getString("age");
            String party = resultSet.getString("party");
            String proffesion = resultSet.getString("proffesion");
             
            Candidates candidates = new Candidates(id, fullname, email, age, party,proffesion);
            candidateslist.add(candidates);
        }
         
        resultSet.close();
        statement.close();
              
        return candidateslist;
    }
     
    
	public ArrayList<Candidates> updateCandidates(Candidates Candi) {
		try {
			String sql="update candidates set fullname=?, email=?, age=?, party=?, proffesion=?  where id=?";
			PreparedStatement pstmt=jdbcConnection.prepareStatement(sql);
	
			pstmt.setString(1, Candi.getFullname());
			pstmt.setString(2, Candi.getEmail());
			pstmt.setString(3, Candi.getAge());
			pstmt.setString(4, Candi.getParty());
			pstmt.setString(5, Candi.getProffesion());
			pstmt.setInt(6, Candi.getId());
	
			pstmt.executeUpdate();
			return listAllCandidates();
		}
		catch(SQLException e) {
			return null;
		}
	}


	public ArrayList<Candidates> deleteCandidates(String id) {
		try {
			String sql="DELETE from candidates where id=?";
			PreparedStatement pstmt=jdbcConnection.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			return listAllCandidates();
		}
		catch(SQLException e) {
			return null;
		}
	}

	public Candidates readCandidates(String id) {
		Candidates Candi=null;
		try {
			String sql="select * from candidates where id=?";
			PreparedStatement pstmt=jdbcConnection.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet RS=pstmt.executeQuery();
			while (RS.next()){
				Candi=new Candidates();
				Candi.setId(RS.getInt("id"));
				Candi.setFullname(RS.getString("fullname"));
				Candi.setEmail(RS.getString("email"));
				Candi.setAge(RS.getString("age"));
				Candi.setParty(RS.getString("party"));
				Candi.setProffesion(RS.getString("proffesion"));

			}
			return Candi;
		}
		catch(SQLException e) {
			return null;
		}
	}
}