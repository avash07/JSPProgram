
import java.io.IOException;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Asus
 */
public class HiServer {
    public static void main(String[] args) throws IOException {
        try{
        ServerSocket serversocket= new ServerSocket(5000);
            System.out.println("Server Started");
            Socket socket = serversocket.accept();
            InputStreamReader isr=new InputStreamReader(socket.getInputStream());
            OutputStreamWriter osw = new OutputStreamWriter(socket.getOutputStream());
            BufferedReader reader = new BufferedReader(isr);
            BufferedWriter writer = new BufferedWriter(osw);
            writer.write("Hello");
            writer.newLine();
            String msg = reader.readLine();
            System.out.println(msg);
            writer.flush();
    }catch (IOException ex){
            System.out.println("Error"+ex.getMessage());
    }
    }
    
    
}


