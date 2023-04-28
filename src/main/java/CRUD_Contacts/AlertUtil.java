package CRUD_Contacts;
import javax.swing.JOptionPane;

public class AlertUtil {
    
    public static void showAlert(String message, String title, int messageType) {
        JOptionPane.showMessageDialog(null, message, title, messageType);
    }
}