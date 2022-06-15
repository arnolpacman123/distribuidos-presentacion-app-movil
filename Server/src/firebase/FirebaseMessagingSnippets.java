package firebase;

import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.FirebaseMessaging;

public class FirebaseMessagingSnippets {

    static FirebaseOptions options;

    public static FirebaseOptions getOptions() {
        /*if (options == null) {
            options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.getApplicationDefault())
                    .setDatabaseUrl("https://<DATABASE_NAME>.firebaseio.com/")
                    .build();
        }*/
        return options;
    }

    public static void sendToToken() {
        try {
            // [START send_to_token]
            // This registration token comes from the client FCM SDKs.
            String registrationToken = "ccVd5FYoRvutnSkNm7ld8U:APA91bGzu6v6hU5dlcpEc2gs4JHPMk44x2fRaqhxijnC6kBqQMWkrDlsEnln1lHXSdiyICq4D2sW2_37yw7yo1Or3_e22cMq3nZfxK6LsBCOriyQ-xFS2ooHRFYYTWco-TXBgjZxmxUm";

            // See documentation on defining a message payload.
            Message message = Message.builder()
                    .putData("title", "Nuevo cliente conectado")
                    .setToken(registrationToken)
                    .build();

            // Send a message to the device corresponding to the provided
            // registration token.
            String response = FirebaseMessaging.getInstance().send(message);
            // Response is a message ID string.
            System.out.println("Successfully sent message: " + response);
            // [END send_to_token]
        } catch (FirebaseMessagingException e) {
            e.printStackTrace();
        }

    }
}
