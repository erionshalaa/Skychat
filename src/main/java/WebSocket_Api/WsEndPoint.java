package WebSocket_Api;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/dashboard_servlet/{friendId}/{senderId}")
public class WsEndPoint {

    private static final Map<String, Set<Session>> friendSessionsMap = new ConcurrentHashMap<>();
    private static final AtomicInteger sessionCounter = new AtomicInteger(0);

    @OnOpen
    public void onOpen(Session session) {
        String senderId = extractSenderId(session);
        String friendId = extractFriendId(session);
        if (friendId != null) {
        	String id = friendId +"/" +senderId;
            friendSessionsMap.computeIfAbsent(id, key -> ConcurrentHashMap.newKeySet()).add(session);
            session.getUserProperties().put("id", id);
            
            addFriendSession(id, session);
            System.out.println("WebSocket opened for friend ID: " + friendId);
            System.out.println("Session ID: " + session.getId());
            System.out.println("Total sessions for friend ID " + friendId + ": " + friendSessionsMap.get(id).size());
            System.out.println("Session ID: " + session);
        } else {
            System.err.println("Failed to extract friend ID from the WebSocket connection URL");
            try {
                session.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        System.out.println("Received message: " + message);
        String friendId;
        String[] parts = message.split(":", 3);  
        if (parts.length == 3) {
            String senderId = parts[0].trim(); 
             friendId = parts[1].trim(); 
            String messageContent = parts[2].trim();
        
            String displayMessage = messageContent;

            try {
                session.getBasicRemote().sendText("Message received: " + displayMessage);
            } catch (IOException e) {
                e.printStackTrace();
            }
            
            
            if (friendId != null) {
                try {
                    sendToFriend(message, friendId, session, senderId); 
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void sendToFriend(String message, String friendId, Session senderSession, String senderId) throws IOException {
    	String id = senderId + "/" +friendId;
        Set<Session> friendSessions = friendSessionsMap.get(id);

        friendSessions.removeIf(session -> !session.isOpen());
        System.out.println(friendSessions);
        System.out.println("Friend Sessions for friend ID " + friendId + ": " + friendSessions);
        System.out.println("Entering loop..." + senderId);
        System.out.println("Entering" + senderSession.getId());

        if (!friendSessions.isEmpty()) {
            
            	Iterator<Session> iterator = friendSessions.iterator();
                Session firstSession = iterator.next();
                if (!firstSession.getId().equals(senderSession.getId())) { 
                    try {
                    	firstSession.getBasicRemote().sendText(message);
                        System.out.println("Sending message to session: " + firstSession.getId());
                        System.out.println(friendSessions);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
        }
            }
        

    

    @OnClose
    public void onClose(Session session) {
        String id = (String) session.getUserProperties().get("id");
        if (id != null) {
            removeFriendSession(id, session);
            System.out.println("WebSocket closed for friend ID: " + id);
            Set<Session> friendSessions = friendSessionsMap.get(id);
            if (friendSessions != null) {
                System.out.println("Total sessions for friend ID " + id + ": " + friendSessions.size());
            } else {
                System.out.println("No sessions found for friend ID " + id);
            }
        }
    }


    @OnError
    public void onError(Session session, Throwable error) {
        error.printStackTrace();
    }

    private String extractFriendId(Session session) {
        String friendId = null;
        String path = session.getRequestURI().getPath();
        String[] pathParts = path.split("/");
        if (pathParts.length >= 2) {
            friendId = pathParts[pathParts.length - 2];
        }
        return friendId;
    }
    private String extractSenderId(Session session) {
        String friendId = null;
        String path = session.getRequestURI().getPath();
        String[] pathParts = path.split("/");
        if (pathParts.length >= 2) {
            friendId = pathParts[pathParts.length - 1];
        }
        return friendId;
    }

    private void addFriendSession(String friendId, Session session) {
        Set<Session> friendSessions = friendSessionsMap.computeIfAbsent(friendId, key -> ConcurrentHashMap.newKeySet());
        session.getUserProperties().put("sessionId", sessionCounter.incrementAndGet());
        friendSessions.add(session);
    }

    private void removeFriendSession(String friendId, Session session) {
        Set<Session> friendSessions = friendSessionsMap.get(friendId);
        if (friendSessions != null) {
            friendSessions.remove(session);
            if (friendSessions.isEmpty()) {
                friendSessionsMap.remove(friendId);
            }
        }
    }
}
