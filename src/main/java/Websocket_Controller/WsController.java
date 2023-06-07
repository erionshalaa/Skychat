package Websocket_Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import CRUD_Users.User;
import CRUD_Users.registerdb;

@ServerEndpoint(value = "/websocket")
public class WsController {

    private Session session;

    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        System.out.println("WebSocket connection opened: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("Received message: " + message);

        // Retrieve the loggedInUser from the WebSocket session
        User loggedInUser = (User) session.getUserProperties().get("loggedInUser");

        String[] parts = message.split(":", 2);
        if (parts.length == 2) {
            String senderUserId = parts[0].trim();
            String messageContent = parts[1].trim();

            boolean isSenderCurrentUser = senderUserId.equals(loggedInUser.getId());

            String displayMessage = isSenderCurrentUser ? "me: " + messageContent : senderUserId + ": " + messageContent;

            try {
                session.getBasicRemote().sendText("Message received: " + displayMessage);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
    @OnClose
    public void onClose(Session session) {
        System.out.println("WebSocket connection closed: " + session.getId());
    }

    @OnError
    public void onError(Session session, Throwable error) {
        System.err.println("Error occurred on WebSocket: " + session.getId());
        error.printStackTrace();
    }
}
