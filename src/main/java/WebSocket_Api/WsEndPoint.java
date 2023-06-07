package WebSocket_Api;

import java.io.IOException;
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

@ServerEndpoint("/dashboard_servlet/{friendId}")
public class WsEndPoint {

    private static final Map<String, Set<Session>> friendSessionsMap = new ConcurrentHashMap<>();
    private static final AtomicInteger sessionCounter = new AtomicInteger(0);

    @OnOpen
    public void onOpen(Session session) {
        String friendId = extractFriendId(session);
        if (friendId != null) {
            friendSessionsMap.computeIfAbsent(friendId, key -> ConcurrentHashMap.newKeySet()).add(session);
            session.getUserProperties().put("friendId", friendId);
            addFriendSession(friendId, session);
            System.out.println("WebSocket opened for friend ID: " + friendId);
            System.out.println("Session ID: " + session.getId());
            System.out.println("Total sessions for friend ID " + friendId + ": " + friendSessionsMap.get(friendId).size());
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
        String friendId1 = extractFriendId(session);
        String[] parts = message.split(":", 3);  
        if (parts.length == 3) {
            String senderId = parts[0].trim(); 
            String friendId = parts[1].trim(); 
            String messageContent = parts[2].trim();
        
            String displayMessage = messageContent;

            try {
                session.getBasicRemote().sendText("Message received: " + displayMessage);
            } catch (IOException e) {
                e.printStackTrace();
            }
            
            
            if (friendId != null && friendId1.equals(friendId)) {
                try {
                    sendToFriend(message, friendId, session, senderId); 
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void sendToFriend(String message, String friendId, Session senderSession, String senderId) throws IOException {
        Set<Session> friendSessions = friendSessionsMap.get(senderId);

        friendSessions.removeIf(session -> !session.isOpen());

        System.out.println("Friend Sessions for friend ID " + friendId + ": " + friendSessions);
        System.out.println("Entering loop..." + senderId);
        System.out.println("Entering" + senderSession.getId());

        if (!friendSessions.isEmpty()) {
            for (Session session : friendSessions) {
                if (!session.getId().equals(senderSession.getId())) { 
                    try {
                        session.getBasicRemote().sendText(message);
                        System.out.println("Sending message to session: " + session.getId());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        System.out.println("Loop finished.");
    }

    @OnClose
    public void onClose(Session session) {
        String friendId = (String) session.getUserProperties().get("friendId");
        if (friendId != null) {
            removeFriendSession(friendId, session);
            System.out.println("WebSocket closed for friend ID: " + friendId);
            Set<Session> friendSessions = friendSessionsMap.get(friendId);
            if (friendSessions != null) {
                System.out.println("Total sessions for friend ID " + friendId + ": " + friendSessions.size());
            } else {
                System.out.println("No sessions found for friend ID " + friendId);
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
