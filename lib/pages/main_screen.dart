import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:math';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    const leftPanel = const Color(0xff28226b);
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIconTheme: IconThemeData(color: Colors.white, opacity: 100),
            backgroundColor: leftPanel,
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
            destinations: [
              NavigationRailDestination(
                  icon: Icon(
                    Icons.menu_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                  label: Text(
                    '',
                  )),
              NavigationRailDestination(
                  icon: Icon(
                    Icons.home,
                    size: 40,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Главная',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
              NavigationRailDestination(
                  icon: Icon(Icons.stacked_bar_chart,
                      color: Colors.white, size: 40),
                  label: Text(
                    'Статистика',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
              NavigationRailDestination(
                  icon: Icon(Icons.help_outline, color: Colors.white, size: 40),
                  label: Text(
                    'Помощь',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
              NavigationRailDestination(
                  icon: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 40,
                  ),
                  label: Text(
                    'Информация',
                    style: TextStyle(color: Colors.white, fontSize: 12),
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
                                      fontSize: 45, color: Colors.white, fontFamily: 'Fonts',),
                                ),
                                Text(
                                  "пожаловать!",
                                  style: TextStyle(
                                      fontSize: 45, color: Colors.white),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 60, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "С помощью этого приложения вы можете",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                  Text(
                                    "загрузить полученные данные для",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                  Text(
                                    "дальнейшей обработки или продолжить",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                  Text(
                                    "работу с ранее загруженными файлами",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 60, 20),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    final result =
                                        await FilePicker.platform.pickFiles();
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(leftPanel)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      'Загрузить данные',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
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
                        image: AssetImage('assets/MainScreen.png')
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/MainScreen.png')
                  )
                ),
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/MainScreen.png'),
                ),
              ),
              Container(
                color: Colors.white70,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
