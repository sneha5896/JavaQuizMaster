package javafx.example;
	
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;
import javafx.scene.Parent;
import javafx.scene.Scene;


public class Main extends Application {
	
	static Stage stg;
	
	@Override
    public void start(Stage primaryStage) throws Exception{
		Main.stg = primaryStage;
        Parent root = FXMLLoader.load(getClass().getResource("main_form.fxml"));
        primaryStage.setTitle("QuizManager");
        primaryStage.setScene(new Scene(root, 620, 281));
        primaryStage.show();
        primaryStage.setResizable(false);
    }


    public static void main(String[] args) {
        launch(args);
    }
}
