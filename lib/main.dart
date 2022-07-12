import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const IconData empty = Icons.check_box_outline_blank;
  static const IconData x = Icons.cancel_presentation;
  static const IconData o = Icons.circle;
  var status_squares = [
    [empty, empty, empty],
    [empty, empty, empty],
    [empty, empty, empty]
  ];

  Widget tile_builder() {
    int row = 0, col = 0;

    return Row(
      children: [
        Icon(
          status_squares[row][col],
          size: 100.00,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          height: 100.00,
          child: Row(
            children: [
              //Row 0

              Column(children: [
                Icon(
                  status_squares[0][0],
                  size: 100.00,
                ),
                Icon(
                  status_squares[0][1],
                  size: 100.00,
                ),
                Icon(
                  status_squares[0][2],
                  size: 100.00,
                )
              ]),

              //Row 1
              Column(
                children: [
                  Icon(
                    status_squares[1][0],
                    size: 100.00,
                  ),
                  Icon(
                    status_squares[1][1],
                    size: 100.00,
                  ),
                  Icon(
                    status_squares[1][2],
                    size: 100.00,
                  )
                ],
              ),

              //Row 2
              Column(children: [
                Icon(
                  status_squares[2][0],
                  size: 100.00,
                ),
                Icon(
                  status_squares[2][1],
                  size: 100.00,
                ),
                Icon(
                  status_squares[2][2],
                  size: 100.00,
                ),
              ]),
            ],
          )),
      floatingActionButton: Icon(Icons.restart_alt_outlined),
    );
  }
}
