import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:win/pages/Statist.dart';

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
            destinations: [
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
                                    ),
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
                                      onPressed: () {},
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
}
