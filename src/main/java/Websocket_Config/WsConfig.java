package Websocket_Config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.websocket.server.ServerContainer;
import javax.websocket.server.ServerEndpointConfig;
import WebSocket_Api.WsEndPoint;

public class WsConfig {

    public static void configure(ServletContext servletContext) throws ServletException {
        // Get the WebSocket server container
        ServerContainer serverContainer = (ServerContainer) servletContext.getAttribute("javax.websocket.server.ServerContainer");

        // Register the WebSocket API endpoint
        ServerEndpointConfig endpointConfig = ServerEndpointConfig.Builder
                .create(WsEndPoint.class, "/websocket")
                .build();

        try {
            serverContainer.addEndpoint(endpointConfig);
        } catch (Exception e) {
            throw new ServletException("Failed to register WebSocket endpoint", e);
        }
    }
}
