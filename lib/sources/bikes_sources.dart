import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_firebase_3/models/bike.dart';

class BikeSources {
  static Future<List<Bike>?> fetchFeatureBikes() async {
    const String collectionName = 'Bikes';
    try {
      final firestore = FirebaseFirestore.instance
          .collection(collectionName)
          .where('rating', isGreaterThan: 4.5)
          .orderBy('rating', descending: true);
      final snapDoc = await firestore.get();
      return snapDoc.docs.map((doc) => Bike.fromJson(doc.data())).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<List<Bike>?> featureNewestBike() async {
    const String collectionName = 'Bikes';
    try {
      final firestore = FirebaseFirestore.instance
          .collection(collectionName)
          .orderBy('realese', descending: true)
          .limit(4);
      final snapDoc = await firestore.get();
      return snapDoc.docs.map((doc) => Bike.fromJson(doc.data())).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Bike?> featureDetailsBike(String bikeId) async {
    const String collectionName = 'Bike';
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final doc = await firestore.collection(collectionName).doc(bikeId).get();
      Bike? bike = doc.exists ? Bike.fromJson(doc.data()!) : null;
      return bike;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
