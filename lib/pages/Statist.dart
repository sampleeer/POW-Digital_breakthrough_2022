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
              fit: BoxFit.fill, image: AssetImage('assets/Stata.png'))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(color: Colors.blue, child: Text('Календарь должен быть тут')),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white54,
                    border: Border.all(
                      color: Colors.white54,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Файлы', style: TextStyle(fontSize: 25),), Text('Тут лист')],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Дата съемки', style: TextStyle(fontSize: 25)), Text('Тут лист')],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Результаты', style: TextStyle(fontSize: 25)), Text('Тут лист')],
                      ),
                    )
                  ]),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border.all(
                      color: Colors.white54,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Название лежбища', style: TextStyle(fontSize: 25)), Text('Тут имя')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Название файла', style: TextStyle(fontSize: 25)), Text('Тут имя')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Дата загрузки', style: TextStyle(fontSize: 25)), Text('Тут чиселки')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Результаты', style: TextStyle(fontSize: 25)), Text('Тут чиселки')]),
                  )
                ]),
              ),
              ElevatedButton(onPressed: (){}, child: Text('Скачать данные в формате .xls', style: TextStyle(),),)
            ],
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
//19:39
}*/
