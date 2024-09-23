// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:learn_firebase_3/models/bike.dart';

class PinPage extends StatefulWidget {
  const PinPage({
    Key? key,
    required this.bike,
  }) : super(key: key);
  final Bike bike;

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
