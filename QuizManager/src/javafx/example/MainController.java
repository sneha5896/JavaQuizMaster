package javafx.example;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.stage.Window;
import java.net.URL;
import java.util.ResourceBundle;
import java.sql.*;

public class MainController implements Initializable {
    @FXML
    private TextField tfName;
    
    @FXML
    private Button btStart;    
    
    @FXML
    private ComboBox<String> cbTopics;
    
    @FXML
    private ComboBox<Integer> cbDifficult;
    
    public Connection connection;
    public void initialize(URL location, ResourceBundle resources) {
    	ObservableList<String> options = 
    		    FXCollections.observableArrayList(
    		        "Java Language Basics",
    		        "Flow Control & Exception",
    		        "Object Oriented Programming"
    		    );
    	
    	cbTopics.setItems(options);
    	
    	ObservableList<Integer> difficaultOptions = 
    		    FXCollections.observableArrayList(
    		        1,
    		        2,
    		        3
    		    );
    	
    	cbDifficult.setItems(difficaultOptions);   
    	
    	cbTopics.getSelectionModel().select(0);
    	cbDifficult.getSelectionModel().select(0);
    	
    }
  

    @FXML
    protected void handleSelectAction(ActionEvent event) {
        Window owner = btStart.getScene().getWindow();
        
        if(tfName.getText().isEmpty()) {
            AlertHelper.showAlert(Alert.AlertType.ERROR, owner, "Name Empty Error!",
                    "Please enter the name of student");
            return;
        }  
        
        
        String dbName = "javaquiz";
        String username = "root";
        String password = "";        
        
        Student user = new Student();
        user.name = tfName.getText();
        try
        {
        	
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	connection = DriverManager.getConnection("jdbc:mysql://localhost/"+dbName, username, password);
        	Statement statement = connection.createStatement();
        	
        	String sqlSelect = "SELECT * FROM userinfo WHERE name = '"+ tfName.getText() +"'";        	
        	ResultSet result = statement.executeQuery(sqlSelect);
        	if(!result.next())
        	{
        	
        		String sqlInsert = "INSERT INTO userinfo (name) VALUES ('"+ tfName.getText() +"')";
            	statement.executeUpdate(sqlInsert);
            	result = statement.executeQuery(sqlSelect);
        	}
        	
        	if(result.next())
        	{
        		user.id = result.getInt("id");
        	}
        	
        	GameController.quiz.user = user;
        	GameController.quiz.currentTopics = cbTopics.getSelectionModel().getSelectedItem().toString();
        	GameController.quiz.currentDifficaulty = Integer.parseInt(cbDifficult.getSelectionModel().getSelectedItem().toString());
        	FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("Game.fxml"));
            Parent root = (Parent) fxmlLoader.load();
            Stage stage = new Stage();
            stage.setScene(new Scene(root));  
            stage.show();
            stage.setTitle("Game");                        
            Main.stg.close();
        	
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        }  
              
    }

}
