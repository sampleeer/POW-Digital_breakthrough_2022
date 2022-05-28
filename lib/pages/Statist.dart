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
        _yourVariable.add(dateTime);
      });
    });
  }

  //ignore_for_file: prefer_const_constructors
  //ignore_for_file: sort_child_properties_last
  //ignore_for_file: prefer_const_literals_to_create_immutables
  int count = 0;

  List<DateTime?> _yourVariable = [DateTime.now()];
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    /*return IntrinsicWidth(
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
    );*/
    //return MaterialApp(home: Scaffold(body: Container()),);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/Stata2.png'))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              color: Colors.blue,
              child: SizedBox(
                  width: 400,
                  height: 400,
                  child: CalendarDatePicker2WithActionButtons(
                    config: CalendarDatePicker2WithActionButtonsConfig(
                      calendarType: CalendarDatePicker2Type.range,
                      selectedDayHighlightColor: Colors.indigo[900],
                    ),
                    initialValue: [DateTime.now()],
                    onValueChanged: (values) => setState(
                      () => _yourVariable = values,
                    ),
                  ))),
          Expanded(
            child: SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border.all(
                            color: Colors.white54,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        DataTable(columns: [
                          DataColumn(
                              label: Text(
                            'Файлы',
                            style: TextStyle(fontFamily: 'MyFont'),
                          )),
                          DataColumn(
                              label: Text(
                            'Дата создания',
                            style: TextStyle(fontFamily: 'MyFont'),
                          )),
                          DataColumn(
                              label: Text(
                            'Результат',
                            style: TextStyle(fontFamily: 'MyFont'),
                          )),
                        ], rows: [
                          DataRow(cells: [DataCell(Text('in.png')),
                            DataCell(Text('10.05.22')),
                            DataCell(Text('Найдено 25 особей'))]),
                          DataRow(cells: [DataCell(Text('in.png')),
                            DataCell(Text('10.05.22')),
                            DataCell(Text('Найдено 25 особей'))]),
                          DataRow(cells: [DataCell(Text('in.png')),
                            DataCell(Text('10.05.22')),
                            DataCell(Text('Найдено 25 особей'))]),
                        ])
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border.all(
                            color: Colors.white54,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        DataTable(columns: [
                          DataColumn(
                              label: Text(
                                'Файлы',
                                style: TextStyle(fontFamily: 'MyFont'),
                              )),
                          DataColumn(
                              label: Text(
                                'Дата создания',
                                style: TextStyle(fontFamily: 'MyFont'),
                              )),
                          DataColumn(
                              label: Text(
                                'Результат',
                                style: TextStyle(fontFamily: 'MyFont'),
                              )),
                        ], rows: [
                          DataRow(cells: [DataCell(Text('in.png')),
                            DataCell(Text('10.05.22')),
                            DataCell(Text('Найдено 25 особей'))]),
                          DataRow(cells: [DataCell(Text('in.png')),
                            DataCell(Text('10.05.22')),
                            DataCell(Text('Найдено 25 особей'))]),
                          DataRow(cells: [DataCell(Text('in.png')),
                            DataCell(Text('10.05.22')),
                            DataCell(Text('Найдено 25 особей'))]),
                        ])
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      child: Text(
                        'Скачать данные в формате .xls',
                        style: TextStyle(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
/*
class _yourVariable {
  DateTime first = DateTime.now();
  int firstData = 0;
  int secondData = 0;
}
//1:44
}*/
