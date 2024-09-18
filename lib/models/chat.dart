import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String roomId;
  final String message;
  final String receiverId;
  final String senderId;
  final Map? bikeDetails;
  final Timestamp timestamp;
  Chat({
    required this.roomId,
    required this.message,
    required this.receiverId,
    required this.senderId,
    this.bikeDetails,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'roomId': roomId,
      'message': message,
      'receiverId': receiverId,
      'senderId': senderId,
      'bikeDetails': bikeDetails,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      roomId: json['roomId'] as String,
      message: json['message'] as String,
      receiverId: json['receiverId'] as String,
      senderId: json['senderId'] as String,
      bikeDetails: json['bikeDetails'] != null
          ? Map.from(json['bikeDetails'] as Map<String, dynamic>)
          : null,
      timestamp: json['timestamp'],
    );
  }
}
