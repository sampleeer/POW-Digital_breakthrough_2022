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
      });
    });
  }

  int count = 0;

  final List<String> list = ['ouuf0', 'efefe', 'eifjeif'];

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/Stata.png'))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(color: Colors.blue, child: Text('Календарь')),
          Column(
            children: [
              Container(
                color: Colors.cyan,
                child: Row(children: [
                  Column(children: [
                    Column(
                      children: [Text('Файлы'), Text('Тут лист')],
                    )
                  ]),
                  Column(children: [
                    Column(
                      children: [Text('Дата съемки'), Text('Тут лист')],
                    )
                  ]),
                  Column(children: [Column(
                    children: [Text('Результаты'), Text('Тут лист')],
                  )])
                ]),
              ),
              Container(
                color: Colors.indigo,
                child: Row(children: [
                  Column(children: []),
                  Column(children: []),
                  Column(children: [])
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _yourVariable {
  DateTime first = DateTime.now();
  int firstData = 0;
  int secondData = 0;
}
//19:39