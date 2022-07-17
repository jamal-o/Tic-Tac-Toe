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

typedef UnCallback = Function();

class _HomePageState extends State<HomePage> {
  static const IconData empty = Icons.check_box_outline_blank;
  static const IconData x = Icons.cancel_presentation;
  static const IconData o = Icons.circle;
  //final UnCallback uf; uf= (() {});
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
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Box(), Box(), Box()],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Box(), Box(), Box()],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Box(), Box(), Box()],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (() => print('gesture detected')),
                      child: Container(
                        child: Text('Elelvated Button'),
                      ),
                    )
                  ],
                )
              ],
            )

            /* Row(
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
            ) */
            ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(
          Icons.restart_alt_outlined,
        ),
        onPressed: () {},
      ),
    );
  }
}

int count = 0;

class Box extends StatefulWidget {
  Box({Key? key, int? this.status}) : super(key: key);

  final int? status;
  List<int> arr = [1, 2, 3];
  final mp = <int>{};

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int status = 1;

  final iconlist = DefaultTextStyle.merge(
      style: TextStyle(fontWeight: FontWeight.bold), child: Container());

  void _update() {
    setState(() {
      if (value == ' ') {
        if (count.isEven) {
          value = 'X';
          xo = false;
        } else {
          value = 'O';
          xo = true;
        }
        count++;
      } else {
        widget.arr.map((e) => print(e));
      }
    });
  }

  String value = ' ';
  bool xo = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _update,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.00,
          ),
        ),
        child: Center(child: SizedBox(child: Text(value))),
      ),
    );
  }
}
