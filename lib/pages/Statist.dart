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

  List<DateTime> ListTime = [];
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(120, 150, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CalendarDatePicker2WithActionButtons(
                config: CalendarDatePicker2WithActionButtonsConfig(
                  calendarType: CalendarDatePicker2Type.range,
                  selectedDayHighlightColor: Colors.purple[800],
                ),
                initialValue: [],
                onValueChanged: (values) => setState(
                  () => _yourVariable = values,
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Container(
                  color: Colors.cyan,
                  child: SizedBox(
                    width: 400,
                    height: 100,
                    child: Text(_yourVariable.map((val) => val.toString()).toList().join(" - ") ),
                  ),
                ),
                Container(
                  color: Colors.cyan,
                  child: SizedBox(
                    width: 400,
                    height: 300,
                    child: Text('aboba'),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
    return MaterialApp(home: Scaffold(body: Container()),);
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