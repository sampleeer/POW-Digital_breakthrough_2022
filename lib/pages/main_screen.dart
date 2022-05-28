import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:win/pages/Statist.dart';
import 'package:win/main.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'package:sqflite/sqflite.dart';




class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  FilePickerResult? result;




  PageController pageController = PageController();
  //ignore_for_file: prefer_const_constructors
  //ignore_for_file: sort_child_properties_last
  //ignore_for_file: prefer_const_literals_to_create_immutables
  @override
  Widget build(BuildContext context) {
    const leftPanel = const Color(0xff28226b);
    const redIcons = const Color(0xffF52A67);


    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIconTheme: IconThemeData(color: redIcons, opacity: 100),
            backgroundColor: leftPanel,
            unselectedIconTheme: IconThemeData(color: Colors.white),
            selectedLabelTextStyle: TextStyle(color: redIcons),
            unselectedLabelTextStyle: TextStyle(color: Colors.white),
            onDestinationSelected: (newIndex) {
              setState(() {
                selectedIndex = newIndex;
                pageController.animateToPage(newIndex,
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeInOut);
              });
            },
            selectedIndex: selectedIndex,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(
                    Icons.menu_outlined,
                    size: 40,
                  ),
                  label: Text(
                    '',
                  )),
              NavigationRailDestination(
                  icon: Icon(
                    Icons.home,
                    size: 40,
                  ),
                  label: Text(
                    'Главная',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'MyFont',
                    ),
                  )),
              NavigationRailDestination(
                  icon: Icon(Icons.stacked_bar_chart, size: 40),
                  label: Text(
                    'Статистика',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'MyFont',
                    ),
                  )),
              NavigationRailDestination(
                  icon: Icon(Icons.help_outline, size: 40),
                  label: Text(
                    'Помощь',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'MyFont',
                    ),
                  )),
              NavigationRailDestination(
                  icon: Icon(
                    Icons.info_outline,
                    size: 40,
                  ),
                  label: Text(
                    'Информация',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'MyFont',
                    ),
                  ))
            ],
          ),
          Expanded(
              child: PageView(
            controller: pageController,
            children: [
              Container(
                color: Colors.blue,
              ),
              Container(
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Добро",
                                  style: TextStyle(
                                      fontSize: 45,
                                      color: Colors.white,
                                      fontFamily: 'MyFont',
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "пожаловать!",
                                  style: TextStyle(
                                      fontSize: 45,
                                      color: Colors.white,
                                      fontFamily: 'MyFont',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 55, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "С помощью этого приложения вы можете",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                      fontFamily: 'MyFont',
                                    )
                                  ),
                                  Text(
                                    "загрузить полученные данные для",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                      fontFamily: 'MyFont',
                                    ),
                                  ),
                                  Text(
                                    "дальнейшей обработки или продолжить",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                      fontFamily: 'MyFont',
                                    ),
                                  ),
                                  Text(
                                    "работу с ранее загруженными файлами",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                      fontFamily: 'MyFont',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 80, 20),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    uploadFiles();
                                    setState(() => {});
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(leftPanel)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      //((result?.files.first  != null) ? ((result?.files.first.name != null) ? result?.files.first.name : 'Загрузить данные') : 'Загрузить данные') ?? '',
                                      (result?.files.first.name ?? 'Загрузить данные'),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: 'MyFont',
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Image(
                        image: AssetImage('assets/morj.png'),
                        alignment: Alignment.bottomRight,
                      )),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/MainScreen.png'))),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/Stata.png'))),
                child: Statist(),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/help.png'))),
              ),
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/info.png'))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(150.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                  child: TextButton(
                                      onPressed: () {
                                        showbd();
                                      },
                                      child: Text(
                                        'Лицензионное соглашение',
                                        style: TextStyle(
                                            fontFamily: 'MyFont',
                                            color: leftPanel),
                                      )),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 50, 5),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Версия приложения',
                                          style: TextStyle(
                                              fontFamily: 'MyFont',
                                              color: leftPanel),
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  leftPanel)),
                                      onPressed: () {},
                                      child: Text(
                                        'Политика конфиденциальности',
                                        style: TextStyle(
                                            fontFamily: 'MyFont',
                                            color: Colors.white),
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ))
        ],
      ),
    );
  }
  void uploadFiles() async {
     result = await FilePicker.platform.pickFiles(allowMultiple: true);
     //print('File Name: ${result?.files.first.name}');
     int id = (Random()).nextInt(10);
     //int id = 0;
     String iddir = "$dir\\$id";
     print(result?.files.map((val) => val.path).toList().join(" \n "));
     print("locdir : $iddir");
  }
  void showbd() async {
    final db = await database;
    var rnd = Random();
    db?.insert("scans", {
      'id': rnd.nextInt(100),
      'file_name': "",
      'place_name': "",
      'date_uploaded': "",
      'date_shooted': "",
      'result': rnd.nextInt(100)
    });

    /*
        "'id' INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,"
        "'file_name' TEXT,"
        "'place_name' TEXT,"
        "'date_uploaded' DATE,"
        "'date_shooted' DATE,"
        "'result' INTEGER"
        ");"
    */
  }
}
//its 19:45