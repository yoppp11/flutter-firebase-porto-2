import 'package:flutter/material.dart';
import 'package:learn_firebase_3/models/bike.dart';

class SuccessBookingPage extends StatefulWidget {
  const SuccessBookingPage({super.key, required this.bike});
  final Bike bike;

  @override
  State<SuccessBookingPage> createState() => _SuccessBookingPageState();
}

class _SuccessBookingPageState extends State<SuccessBookingPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
