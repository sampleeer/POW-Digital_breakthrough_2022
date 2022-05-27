import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.indigo[900]),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 35, 10),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu_outlined,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 35, 15),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Text(
                'Главная',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 35, 15),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.stacked_bar_chart,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Text('Статистика', style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 35, 15),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.help_outline,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),//
              child: Text('Помощь', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[100],
    );
  }
}
