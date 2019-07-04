package javafx.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Quiz {	
	public String currentTopics = "";
	public Integer currentDifficaulty = -1;	
	public Student user;
	List<MCQQuestion> questions = new ArrayList<MCQQuestion>(); 
	
	private String dbName = "javaquiz";
	private String username = "root";
	private String password = ""; 
	private Connection connection;
    public int correctCount = 0;
    Quiz()
    {
    	try
    	{
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		connection = DriverManager.getConnection("jdbc:mysql://localhost/"+ dbName, username, password);
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    }
    
	public void makeQuestion()
	{
		if(this.currentTopics == "")
		{
			return;
		}
		
		if(this.currentDifficaulty < 1)
		{
			return;
		}
		
		try 
		{
			Statement statement = connection.createStatement();
	    	String sqlSelect = "SELECT * FROM questions WHERE topic = '"+ this.currentTopics +"' AND difficult = " +  this.currentDifficaulty;        	
	    	ResultSet rs = statement.executeQuery(sqlSelect);
	    	questions.clear();
	    	while (rs.next())
	        {
	    	  MCQQuestion item = new MCQQuestion();
	    	  int question_Id = rs.getInt("id");
	    	  Statement s = connection.createStatement();
		      String sqlAnswer = "SELECT * FROM answer WHERE question_Id = "+ question_Id;        	
		      ResultSet r = s.executeQuery(sqlAnswer);
		      
		      while (r.next())
		      {
		    	  MCQChoice choice =  new MCQChoice();
		    	  choice.choice = r.getString("answer");
		    	  choice.valid = r.getInt("valid");
		    	  item.mcqChoice.add(choice);
		      }
	    	  s.close();
	    	  r.close();
	    	  
	    	  item.title = rs.getString("title");
	    	  item.question = rs.getString("question");
	    	  item.contents = rs.getString("contents"); 
	    	  
	    	  questions.add(item);
	        }
	    	
	    	rs.close();
	    	statement.close();
		}		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}	
	
}
