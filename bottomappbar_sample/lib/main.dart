import 'package:flutter/material.dart';

/// Flutter code sample for [FloatingActionButton].

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
    );
  }
}

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  List<(Color, Icon, Text, FloatingActionButtonLocation)> myList = [
    (
      Colors.deepPurple,
      Icon(Icons.home, size: 30),
      Text("Home"),
      FloatingActionButtonLocation.startDocked,
    ),
    (
      Colors.orange,
      Icon(Icons.business, size: 30),
      Text("Business"),
      FloatingActionButtonLocation.centerDocked,
    ),
    (
      Colors.red,
      Icon(Icons.school, size: 30),
      Text("School"),
      FloatingActionButtonLocation.endDocked,
    ),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationBar Sample')),
      body: Center(child: Text("Hello , World")),

      ///Bottom App Bar
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizeScreen.width * 0.06, // حدود 4٪ از عرض صفحه
          vertical: sizeScreen.height * 0.05, // حدود 1.5٪ از ارتفاع صفحه
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomAppBar(
            color: Colors.black26,
            height: 100,
            // clipBehavior: Clip.hardEdge,
            shape: AutomaticNotchedShape(
              RoundedRectangleBorder(),
              // RoundedRectangleBorder(),
            ),
            // notchMargin: 1.0,
            child: Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Visibility(
                            visible: _selectedIndex != 0,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed:
                                      () => setState(() {
                                        _selectedIndex = 0;
                                      }),
                                  icon: myList[0].$2,
                                ),

                                myList[0].$3,
                              ],
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Visibility(
                          visible: _selectedIndex != 1,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed:
                                    () => setState(() {
                                      _selectedIndex = 1;
                                    }),
                                icon: myList[1].$2,
                              ),
                              myList[1].$3,
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Visibility(
                            visible: _selectedIndex != 2,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed:
                                      () => setState(() {
                                        _selectedIndex = 2;
                                      }),
                                  icon: myList[2].$2,
                                ),
                                myList[2].$3,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Floating Action Button
                AnimatedAlign(
                  alignment:
                      _selectedIndex == 0
                          ? Alignment.topLeft
                          : _selectedIndex == 1
                          ? Alignment.topCenter
                          : Alignment.topRight,
                  duration: Duration(milliseconds: 600),
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: myList[_selectedIndex].$1,
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
                    child: myList[_selectedIndex].$2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
