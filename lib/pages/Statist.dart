import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class Statist extends StatefulWidget {
  const Statist({Key? key}) : super(key: key);

  @override
  State<Statist> createState() => _StatistState();
}

class _StatistState extends State<Statist> {
  void _showDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        dateTime = value!;
        ListTime.add(dateTime);
      });
    });
  }

  int count = 0;

  List<DateTime> ListTime = [];
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Container()),);
  }
}

class _yourVariable {
  DateTime first = DateTime.now();
  int firstData = 0;
  int secondData = 0;
}
