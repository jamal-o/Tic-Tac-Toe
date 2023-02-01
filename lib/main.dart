import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());

  runApp(ChangeNotifierProvider(
    create: (context) => BoxData(),
    child: const MyApp(),
  ));
}

int count = 1;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      // home: Text('id'),
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

  @override
  initState() {
    boxesList = [
      Box(
        updateBox: updateBox,
        id: 0,
        key: UniqueKey(),
      ), //0
      Box(
        updateBox: updateBox,
        id: 1,
        key: UniqueKey(),
      ),
      Box(
        updateBox: updateBox,
        id: 2,
        key: UniqueKey(),
      ),
      Box(
        updateBox: updateBox,
        id: 3,
        key: UniqueKey(),
      ),
      Box(
        updateBox: updateBox,
        id: 4,
        key: UniqueKey(),
      ),
      Box(
        updateBox: updateBox,
        id: 5,
        key: UniqueKey(),
      ),
      Box(
        updateBox: updateBox,
        id: 6,
        key: UniqueKey(),
      ),
      Box(
        updateBox: updateBox,
        id: 7,
        key: UniqueKey(),
      ),
      Box(
        updateBox: updateBox,
        id: 8,
        key: UniqueKey(),
      ),
    ];
    super.initState();
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
      if (verticalCheck(boxesList![1])) return true;
    }

    //if no pattern was found it will return false
    return false;
  }

  verticalCheck(Box boxToBeChecked) {
    // if (boxesList![boxToBeChecked.id + 3] == null ||
    //     boxesList![boxToBeChecked.id + 6] == null) {
    //   return false;
    // }
    if (boxToBeChecked.value == boxesList![boxToBeChecked.id + 3].value &&
        boxToBeChecked.value == boxesList![boxToBeChecked.id + 6].value) {
      return true;
    }

    return false;
  }

  horizontalCheck(Box boxToBeChecked) {
    //assert(boxesList![boxToBeChecked.id + 1]);
    // if (boxesList![boxToBeChecked.id + 1].value =='' ||
    //     boxesList![boxToBeChecked.id + 2].value == '') {
    //   return false;
    // }

    if (boxToBeChecked.value == boxesList![boxToBeChecked.id + 1].value &&
        boxToBeChecked.value == boxesList![boxToBeChecked.id + 2].value) {
      return true;
    }
    return false;
  }

  crossCheck(Box boxToBeChecked) {
    //special check for box 11
    if (boxToBeChecked.id == 0) {
      if (boxToBeChecked.value == boxesList![4].value &&
          boxToBeChecked.value == boxesList![8].value) {
        return true;
      }
    }

    // special check for box 13
    if (boxToBeChecked.id == 2) {
      if (boxToBeChecked.value == boxesList![4].value &&
          boxToBeChecked.value == boxesList![6].value) {
        return true;
      }
    }
    return false;
  }

  String? winner;
  // Widget winnerStatus = Text(winner?'':'');

  updateBox(int id) {
    //setState(() {

    //widget.updateBox();

    // Add it to list of filled boxes

    filledBoxes.add(boxesList![id]);
    // print(count);

    // check for a solution
    if (count >= 5) {
      if (check()) {
        setState(() {
          winner = count.isEven ? 'X' : 'O';
          print('the winner is $winner');

          count = 1;
        });

        //winnerStatus = Text('The Winner is $winner!!!!!');
      }
    }
    //advance the counter
    //count++;

    //});
  }

  @override
  Widget build(BuildContext context) {
    //createboxList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10),
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
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(winner != null ? '$winner is the winner' : ''),
                ]),
              ],
            )),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.restart_alt_outlined,
        ),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return const HomePage();
          }), (route) => false);
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return const HomePage();
          // }));
          Provider.of<BoxData>(context, listen: false).boxValue = [
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            ''
          ];
          count = 1;
        },
      ),
    );
  }
}

class Box extends StatelessWidget {
  Box({Key? key, required this.id, required this.updateBox}) : super(key: key);

  final int id;
  final Function updateBox;
  String value = '';

  final iconlist = DefaultTextStyle.merge(
      style: const TextStyle(fontWeight: FontWeight.bold), child: Container());

  void _playTurn() {
    updateBox(id);
    // notifyListeners();
  }

  //String value = '';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        // ignore: avoid_print
        print('ontap');

        Provider.of<BoxData>(context, listen: false).updateValue(id);
        value = Provider.of<BoxData>(context, listen: false).boxValue[id];
        _playTurn();
      }),
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
          child: Consumer<BoxData>(
            builder: (context, boxData, child) => Text(boxData.boxValue[id]),
          ),
        ),
      ),
    );
  }
}

class BoxData extends ChangeNotifier {
  List<String> boxValue = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void updateValue(int id) {
    if (boxValue[id] == '') {
      if (count.isOdd) {
        boxValue[id] = 'X';
      } else {
        boxValue[id] = 'O';
      }
    }
    count++;
    notifyListeners();
  }
}
