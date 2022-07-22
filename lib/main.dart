import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

int count = 1;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
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
      //home: Text('id'),
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
  List<Box>? boxesList;
  var filledBoxes = <Box>{};

  createboxList() {
    boxesList = [
      Box(updateBox: updateBox, id: 0), //0
      Box(updateBox: updateBox, id: 1),
      Box(updateBox: updateBox, id: 2),
      Box(updateBox: updateBox, id: 3),
      Box(updateBox: updateBox, id: 4),
      Box(updateBox: updateBox, id: 5),
      Box(updateBox: updateBox, id: 6),
      Box(updateBox: updateBox, id: 7),
      Box(updateBox: updateBox, id: 8),
    ];
  }

  check() {
    // if filled boxes contains box 11
    if (filledBoxes.contains(boxesList![0])) {
      if (verticalCheck(boxesList![0])) return true;
      if (horizontalCheck(boxesList![0])) return true;
      if (crossCheck(boxesList![0])) return true;
    }

    // if filled boxes contains box 13
    if (filledBoxes.contains(boxesList![2])) {
      if (verticalCheck(boxesList![2])) return true;
      if (crossCheck(boxesList![2])) return true;
    }

    //if filled boxes contains box 21
    if (filledBoxes.contains(boxesList![3])) {
      if (horizontalCheck(boxesList![3])) return true;
    }

    //if filled boxes contains box 31
    if (filledBoxes.contains(boxesList![6])) {
      if (horizontalCheck(boxesList![6])) return true;
    }

    //if filled boxes contains box 12
    if (filledBoxes.contains(boxesList![1])) {
      if (verticalCheck(boxesList![3])) return true;
    }

    //if no pattern was found it will return false
    return false;
  }

  verticalCheck(Box boxToBeChecked) {
    if (boxesList![boxToBeChecked.id + 3] == null ||
        boxesList![boxToBeChecked.id + 6] == null) {
      return false;
    }
    if (boxToBeChecked.value == boxesList![boxToBeChecked.id + 3].value &&
        boxToBeChecked.value == boxesList![boxToBeChecked.id + 6].value) {
      return true;
    }
  }

  horizontalCheck(Box boxToBeChecked) {
    if (boxToBeChecked.value == boxesList![boxToBeChecked.id + 1].value &&
        boxToBeChecked.value == boxesList![boxToBeChecked.id + 2].value) {
      return true;
    }
  }

  crossCheck(Box boxToBeChecked) {
    //special check for box 11
    if (boxToBeChecked == boxesList![0]) {
      if (boxToBeChecked.value == boxesList![4].value &&
          boxToBeChecked.value == boxesList![8].value) {
        return true;
      }
    }

    // special check for box 13
    if (boxToBeChecked == boxesList![2]) {
      if (boxToBeChecked.value == boxesList![4].value &&
          boxToBeChecked.value == boxesList![6].value) {
        return true;
      }
    }
  }

  String? winner = '';
  Widget winnerStatus = Text('');

  updateBox(int id) {
    setState(() {
      if (boxesList![id].value == '') {
        // Add it to list of filled boxes
        filledBoxes.add(boxesList![id]);

        if (count.isOdd) {
          boxesList![id].value = 'X';
        } else {
          boxesList![id].value = 'O';
        }
      }

      //widget.updateBox();

      //advance the counter

      count++;
      print(count);
      // check for a solution
      if (count > 5) {
        if (check()) {
          winner = count.isOdd ? 'X' : 'O';
          winnerStatus = Text('The Winner is $winner!!!!!');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    createboxList();

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
                  children: [boxesList![0], boxesList![1], boxesList![2]],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [boxesList![3], boxesList![4], boxesList![5]],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [boxesList![6], boxesList![7], boxesList![8]],
                ),
                Row(children: [
                  winnerStatus,
                ]),
              ],
            )),
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

// ignore: must_be_immutable
class Box extends StatefulWidget {
  Box({Key? key, required this.updateBox, required this.id}) : super(key: key);

  int id;
  String value = '';
  final Function updateBox;

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  final iconlist = DefaultTextStyle.merge(
      style: TextStyle(fontWeight: FontWeight.bold), child: Container());

  void _playTurn() {
    //setState(() {});

    widget.updateBox(widget.id);
  }

  //String value = '';

  bool xo = true;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 50,
    //   width: 50,
    //   decoration: BoxDecoration(
    //     border: Border.all(
    //       color: Colors.black,
    //       width: 2.00,
    //     ),
    //   ),
    //   child: Center(
    //     child: Text(widget.value),
    //   ),
    // );
    return InkWell(
      onTap: (() {
        print('ontap');

        _playTurn();
      }),
      onTapUp: (xo) => setState(() {}),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.00,
          ),
        ),
        child: Center(
          child: Text(widget.value),
        ),
      ),
    );
  }
}
