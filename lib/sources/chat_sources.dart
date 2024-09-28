import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_firebase_3/models/chat.dart';

class ChatSources {
  static Future<void> openChatRoom(String uid, String userName) async {
    final firestore = FirebaseFirestore.instance;
    final doc = await firestore.collection('CS').doc(uid).get();
    if (doc.exists) {
      firestore.collection('CS').doc(uid).update({'newFromCs': false});
      return;
    }

    await firestore.collection('CS').doc(uid).set({
      'roomId': uid,
      'name': userName,
      'lastMessage': 'Kamu mau ga jadi pacar aku?',
      'newFromCs': true,
      'newFromUser': false,
    });

    await firestore.collection('CS').doc(uid).collection('chats').add({
      'roomId': uid,
      'message': 'Kamu mau ga jadi pacar aku?',
      'receiverId': uid,
      'senderId': 'cs',
      'bikeDetails': null,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  static Future<void> send(Chat chat, String uid) async {
    final firestore = FirebaseFirestore.instance;

    await firestore.collection('CS').doc(uid).update({
      'lastMessage': chat.message,
      'newFromUser': true,
      'newFromCs': false,
    });

    await firestore.collection('CS').doc(uid).collection('chats').add({
      'roomId': chat.roomId,
      'message': chat.message,
      'receiverId': chat.receiverId,
      'senderId': chat.senderId,
      'bikeDetails': chat.bikeDetails,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
