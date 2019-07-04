package javafx.example;

import java.util.ArrayList;
import java.util.List;

public class MCQQuestion extends Question{
	public String title;
	public String question;
	public String contents;
	List<MCQChoice> mcqChoice = new ArrayList<MCQChoice>();
	public MCQAnswer answer;
	public boolean correct = false;
}
