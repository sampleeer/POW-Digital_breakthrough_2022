import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:win/main.dart';
import 'package:intl/intl.dart';

class Statist extends StatefulWidget {
  const Statist({Key? key}) : super(key: key);
  @override
  State<Statist> createState() => _StatistState();
}

class _StatistState extends State<Statist> {
  /*void _showDate() {
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
  }*/
  _StatistState() {
    getShotsFrom(DateTime.now(), DateTime.now()).then((value) => updateDfiles(value));
  }

  //ignore_for_file: prefer_const_constructors
  //ignore_for_file: sort_child_properties_last
  //ignore_for_file: prefer_const_literals_to_create_immutables
  int count = 0;

  List<DateTime?> _yourVariable = [DateTime.now()];
  DateTime dateTime = DateTime.now(), fir = DateTime.now(), sec = DateTime.now();
  List<Map<String, Object?>> dfiles = <Map<String, Object?>>[];
//f
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
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Container(
                color: Colors.blue,
                child: SizedBox(
                    width: 400,
                    height: 400,
                    child: CalendarDatePicker2WithActionButtons(
                      config: CalendarDatePicker2WithActionButtonsConfig(
                        calendarType: CalendarDatePicker2Type.range,
                        selectedDayHighlightColor: Colors.indigo[900],
                      ),
                      initialValue: [fir, sec],
                      onValueChanged: (values) =>
                          setState(
                                () => updateDates(values),
                          ),
                    ))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 70),
              child: SizedBox(
                height: 400,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              border: Border.all(
                                color: Colors.white54,
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 445,
                                height: 100,
                                child: ListView(children: [
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
                                  ], rows: getFirstRows()),
                                ]),
                              ),
                            ],
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              border: Border.all(
                                color: Colors.white54,
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 445,
                                height: 170,
                                child: ListView(children: [
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
                                  ], rows: getFirstRows()),
                                ]),
                              ),
                            ],
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            exportSingleTable();
                          },
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
              ),
            ),
          )
        ],
      ),
    );
  }
  void updateDates(List<DateTime?> values) {
    if(values.isEmpty){
      return;
    }
    _yourVariable = values;
    if(values.length == 1){
      values.add(values[0]);
    }
    fir = values[0]!;
    sec = values[1]!;
    getShotsFrom(values[0]!, values[1]!).then((value) => updateDfiles(value));
  }
  void updateDfiles(List<Map<String, Object?>> value) {
    dfiles = value;
    print("Dfiles: ${dfiles.length}");
    for(Map<String, Object?> st in dfiles) {
      print(st.values.join(" "));
    }
  }
  List<DataRow> getFirstRows() {
    List<DataRow> ls = <DataRow>[];
    for(Map<String, Object?> st in dfiles) {
      ls.add(DataRow(cells: [
        DataCell(Text(st['file_name'].toString())),
        DataCell(Text(DateFormat('d.MM.yyyy').format(DateTime.parse(st['date_shooted'].toString())))),
        DataCell(Text("Найдено ${st['result']} особей"))
      ]));
    }

    return ls;
  }/*cells: [DataCell(Text('in.png')),
  DataCell(Text('10.05.22')),
  DataCell(Text('Найдено 25 особей'))]),*/
}
/*
class _yourVariable {
  DateTime first = DateTime.now();
  int firstData = 0;
  int secondData = 0;
}
//1:44
}*/
