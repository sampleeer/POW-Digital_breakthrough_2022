import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:math';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Color> myColors = [
    Colors.yellowAccent,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    const leftPanel = const Color(0xff28226b);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: leftPanel),
        child: Column(
          children: <Widget>[
            SizedBox(
                height: 100,
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.menu_outlined,
                      size: 70,
                      color: Colors.white,
                    ))),
            Container(
              child: SizedBox(
                  height: 100,
                  child: InkWell(
                    onTap: () async {
                      final result = await FilePicker.platform.pickFiles();
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.home,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          'Главная',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
                height: 100,
                child: InkWell(
                  focusColor: Colors.indigo.withOpacity(0.3),
                  onTap: () {
                    setState(() {});
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.stacked_bar_chart,
                        size: 60,
                        color: Colors.white,
                      ),
                      Text(
                        'Статистика',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                )),
            SizedBox(
                height: 100,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.help_outline,
                        size: 60,
                        color: Colors.white,
                      ),
                      Text(
                        'Помощь',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                )),
            SizedBox(
                height: 100,
                width: 100,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 60,
                        color: Colors.white,
                      ),
                      Text(
                        'Информация',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
      backgroundColor: Colors.blue[100],
    );
  }
}
