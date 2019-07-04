package javafx.example;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.scene.control.ToggleGroup;
import javafx.stage.Window;

import java.io.PrintWriter;
import java.net.URL;
import java.util.ResourceBundle;

import javax.swing.JOptionPane;

public class GameController implements Initializable {
   
    
	public static Quiz quiz = new Quiz();
	
	public int seek = 0;
	public int count = 0;
	
    @FXML
    private Label lbName;
    
    @FXML
    private Label lbTopic;
    
    @FXML
    private Label lbTitle;
    
    @FXML
    private Label lbQuestion;
    
    @FXML
    private TextArea taContents;
    
    @FXML
    private RadioButton rdAnswer1;
    
    @FXML
    private RadioButton rdAnswer2;
    
    @FXML
    private RadioButton rdAnswer3;
    
    @FXML
    private RadioButton rdAnswer4;
    
    @FXML
    private Button btNext;
    
    @FXML
    private Button btViewResult;
    
    final ToggleGroup group = new ToggleGroup();
    
    public void initialize(URL location, ResourceBundle resources) {
    	count = 0;
    	seek = 0;
    	
    	rdAnswer1.setToggleGroup(group);
    	rdAnswer2.setToggleGroup(group);
    	rdAnswer3.setToggleGroup(group);
    	rdAnswer4.setToggleGroup(group);
    	
    	lbName.setText(quiz.user.name);
    	lbTopic.setText(quiz.currentTopics);
    	quiz.makeQuestion();
    	count = quiz.questions.size();
    	displayQuestion();
    	rdAnswer1.setSelected(true);  
    	btViewResult.setDisable(true);
    }  
    
    public void displayQuestion()
    {    	
    	if(seek >= count)
    	{
    		AlertHelper.showAlert(Alert.AlertType.ERROR, null, "End!",
                    "There is no question");
    		disableAllControl();
    		return;
    	}
    	
    	MCQQuestion question =  quiz.questions.get(seek);
    	lbTitle.setText(question.title);
    	lbQuestion.setText(question.question);
    	taContents.setText(question.contents);
    	
    	rdAnswer1.setText(question.mcqChoice.get(0).choice);
    	rdAnswer2.setText(question.mcqChoice.get(1).choice);
    	rdAnswer3.setText(question.mcqChoice.get(2).choice);
    	rdAnswer4.setText(question.mcqChoice.get(3).choice);
    	
    	seek++;
    }
    
    
    public void disableAllControl()
    {
    	rdAnswer1.setDisable(true);
    	rdAnswer2.setDisable(true);
    	rdAnswer3.setDisable(true);
    	rdAnswer4.setDisable(true);
    	btNext.setDisable(true);
    	btViewResult.setDisable(false);
    }
    
    public void getResultAndSave()
    {
    	RadioButton selectedRadioButton = (RadioButton) group.getSelectedToggle();
    	String toogleGroupValue = selectedRadioButton.getText();
    	MCQAnswer answer =  new MCQAnswer();
    	answer.answer = toogleGroupValue;
    	int curSeek = seek - 1;
    	quiz.questions.get(curSeek).answer = answer;
    	
    	for(MCQChoice choice : quiz.questions.get(curSeek).mcqChoice)
    	{
    		if(choice.choice == answer.answer && choice.valid == 1)
    		{
    			quiz.questions.get(curSeek).correct = true;
    			quiz.correctCount ++;
    			break;
    		}
    	}
    }
    
    
    public void saveResultAsText()
    {
    	try (PrintWriter out = new PrintWriter("result.txt")) {
    		out.println("Student : " + quiz.user.name);
    		for(MCQQuestion question : quiz.questions)
    		{    			
    			out.println("");
    			out.println("=================================================================");
    			out.println("");
    			out.println("Title : " + question.title);
    			out.println("Question : " + question.question);
    			out.println("");
    			out.println("------------------Contents-----------------------");
    			out.print(question.contents);
    			out.println("");
    			out.println("");
    			out.println("-------------------Answers-----------------------");
    			
    			String correctAnswer = "";
    	    	for(MCQChoice choice : question.mcqChoice)
    	    	{
    	    		out.println(choice.choice);
    	    		if(choice.valid == 1)
    	    		{
    	    			correctAnswer = choice.choice;
    	    		}
    	    		
    	    	}
    			out.println("");
    			out.println("-----------------Your Answer---------------------");
    			out.println(question.answer.answer);
    			out.println("");
    			
    			out.println("-----------------Correct Answer-------------------");
    			out.println(correctAnswer);
    			
    			out.println("=================================================================");
    		}
    		
    		ProcessBuilder pb = new ProcessBuilder("Notepad.exe", "result.txt");
    		pb.start();
    	    
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    }
    
    @FXML
    protected void handleNextAction(ActionEvent event) {
    	getResultAndSave();    	
    	displayQuestion();
    }
    
    @FXML
    protected void handleViewResult(ActionEvent event) {
    	int incorrect = count - quiz.correctCount;
    	String resultInfo = "Correct : " + quiz.correctCount + " Incorrect : " + incorrect;
    	JOptionPane.showMessageDialog(null, resultInfo, "Result", JOptionPane.INFORMATION_MESSAGE);
    	saveResultAsText();
    }
    
}
