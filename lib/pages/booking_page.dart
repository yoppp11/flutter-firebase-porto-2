// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    Key? key,
    required this.bikeId,
  }) : super(key: key);
  final String bikeId;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
