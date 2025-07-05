
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.Scanner;


public class ReverseClient {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("localhost", 5000);
            InputStreamReader isr=new InputStreamReader(socket.getInputStream());
            OutputStreamWriter osw = new OutputStreamWriter(socket.getOutputStream());
            BufferedReader reader = new BufferedReader(isr);
            BufferedWriter writer = new BufferedWriter(osw);
            Scanner sc = new Scanner(System.in);
            System.out.println("Enter a string");
            String n= sc.next();
            writer.write(n);
            writer.newLine();
            writer.flush();
           String msg = reader.readLine();
           System.out.println("Reversed:" +msg);
            
        } catch (IOException ex) {
            System.out.println("Error:"+ex.getMessage());
        }
    }
}

