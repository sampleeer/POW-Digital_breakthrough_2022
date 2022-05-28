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
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: SizedBox(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border.all(
                            color: Colors.white54,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      // child:
                    ),
                    Expanded(
                      child: ListView(
                        // shrinkWrap: true,
                          children: [
                            DataTable(columns: [
                              DataColumn(
                                  label: Text('Файлы',
                                      style: TextStyle(
                                          fontSize: 25, fontFamily: 'MyFont')))
                            ], rows: [
                              DataRow(cells: [DataCell(Text('input.png'))]),
                              DataRow(cells: [DataCell(Text('input.png'))]),
                              DataRow(cells: [DataCell(Text('input.png'))]),
                              DataRow(cells: [DataCell(Text('input.png'))]),
                            ]),
                            DataTable(columns: [
                              DataColumn(
                                  label: Text('Дата съемки',
                                      style: TextStyle(
                                          fontSize: 25, fontFamily: 'MyFont')))
                            ], rows: [
                              DataRow(cells: [DataCell(Text('10.05.22'))]),
                              DataRow(cells: [DataCell(Text('11.05.22'))]),
                              DataRow(cells: [DataCell(Text('13.05.22'))]),
                              DataRow(cells: [DataCell(Text('15.05.22'))]),
                            ]),
                            DataTable(columns: [
                              DataColumn(
                                  label: Text('Результат',
                                      style: TextStyle(
                                          fontSize: 25, fontFamily: 'MyFont')))
                            ], rows: [
                              DataRow(cells: [DataCell(Text('Найдено 20 особей'))]),
                              DataRow(cells: [DataCell(Text('Найдено 18 особей'))]),
                              DataRow(cells: [DataCell(Text('Найдено 25 особей'))]),
                              DataRow(cells: [DataCell(Text('Найдено 17 особей'))]),
                            ]),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(75, 10, 75, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Дата съемки',
                                      style: TextStyle(
                                          fontSize: 25, fontFamily: 'MyFont')),
                                  Text('Тут лист',
                                      style: TextStyle(fontFamily: 'MyFont'))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(75, 10, 75, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Результаты',
                                      style: TextStyle(
                                          fontSize: 25, fontFamily: 'MyFont')),
                                  Text('Тут лист',
                                      style: TextStyle(fontFamily: 'MyFont'))
                                ],
                              ),
                            )
                          ]),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border.all(
                            color: Colors.white54,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Название лежбища',
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: 'MyFont')),
                                Text('Тут имя')
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Название файла',
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: 'MyFont')),
                                Text('Тут имя')
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Дата загрузки',
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: 'MyFont')),
                                Text('Тут чиселки')
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Результаты',
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: 'MyFont')),
                                Text('Тут чиселки')
                              ]),
                        )
                      ]),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      child: Text(
                        'Скачать данные в формате .xls',
                        style: TextStyle(),
                      ),
                    )
                  ],
                ),
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
//0:42
}*/
