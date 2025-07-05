
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;


public class HiClient {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("localhost", 5000);
            InputStreamReader isr=new InputStreamReader(socket.getInputStream());
            OutputStreamWriter osw = new OutputStreamWriter(socket.getOutputStream());
            BufferedReader reader = new BufferedReader(isr);
            BufferedWriter writer = new BufferedWriter(osw);
            String msg="Hii";
            writer.write(msg);
            writer.newLine();
            writer.flush();
           String str = reader.readLine();
           System.out.println(str);
            
        } catch (IOException ex) {
            System.out.println("Error:"+ex.getMessage());
        }
    }
}

