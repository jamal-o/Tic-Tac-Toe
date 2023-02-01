import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());

  runApp(ChangeNotifierProvider(
    create: (context) => BoxDataNotifier(),
    child: const MyApp(),
  ));
}

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
  late List<Box> boxesList;
  List<Box> filledBoxes = <Box>[];
  int count = 0;

  @override
  initState() {
    super.initState();
  }

  check() {
    // if filled boxes contains box 11
    if (boxesList[0].value != '') {
      if (verticalCheck(boxesList[0])) return true;
      if (horizontalCheck(boxesList[0])) return true;
      if (crossCheck(boxesList[0])) return true;
    }

    // if filled boxes contains box 13
    if (boxesList[2].value != '') {
      if (verticalCheck(boxesList[2])) return true;
      if (crossCheck(boxesList[2])) return true;
    }

    //if filled boxes contains box 21
    if (boxesList[3].value != '') {
      if (horizontalCheck(boxesList[3])) return true;
    }

    //if filled boxes contains box 31
    if (boxesList[6].value != '') {
      if (horizontalCheck(boxesList[6])) return true;
    }

    //if filled boxes contains box 12
    if (boxesList[1].value != '') {
      if (verticalCheck(boxesList[1])) return true;
    }

    //if no pattern was found it will return false
    return false;
  }

  verticalCheck(Box boxToBeChecked) {
    // if (boxesList![boxToBeChecked.id + 3] == null ||
    //     boxesList![boxToBeChecked.id + 6] == null) {
    //   return false;
    // }
    if (boxToBeChecked.value == boxesList[boxToBeChecked.id + 3].value &&
        boxToBeChecked.value == boxesList[boxToBeChecked.id + 6].value) {
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

    if (boxToBeChecked.value == boxesList[boxToBeChecked.id + 1].value &&
        boxToBeChecked.value == boxesList[boxToBeChecked.id + 2].value) {
      return true;
    }
    return false;
  }

  crossCheck(Box boxToBeChecked) {
    //special check for box 11
    if (boxToBeChecked.id == 0) {
      if (boxToBeChecked.value == boxesList[4].value &&
          boxToBeChecked.value == boxesList[8].value) {
        return true;
      }
    }

    // special check for box 13
    if (boxToBeChecked.id == 2) {
      if (boxToBeChecked.value == boxesList[4].value &&
          boxToBeChecked.value == boxesList[6].value) {
        return true;
      }
    }
    return false;
  }

  String? winner;
  // Widget winnerStatus = Text(winner?'':'');

  updateGame(int id) {
    boxesList[id].value =
        Provider.of<BoxDataNotifier>(context, listen: false).boxValue[id];
    filledBoxes.add(boxesList[id]);

    // check for a solution
    if (count >= 5) {
      if (check()) {
        setState(() {
          winner = count.isOdd ? 'X' : 'O';
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

  createBoxList() {
    boxesList = [
      Box(
        updateGame: updateGame,
        id: 0,
        value: Provider.of<BoxDataNotifier>(context).getBoxValue(0),
      ), //0
      Box(
        updateGame: updateGame,
        id: 1,
        value: Provider.of<BoxDataNotifier>(context).getBoxValue(1),
      ),
      Box(
        updateGame: updateGame,
        id: 2,
        value: Provider.of<BoxDataNotifier>(context).getBoxValue(2),
      ),
      Box(
        updateGame: updateGame,
        id: 3,
        value: Provider.of<BoxDataNotifier>(context).getBoxValue(3),
      ),
      Box(
        updateGame: updateGame,
        id: 4,
        value: Provider.of<BoxDataNotifier>(context).getBoxValue(4),
      ),
      Box(
        updateGame: updateGame,
        id: 5,
        value: Provider.of<BoxDataNotifier>(context).getBoxValue(5),
      ),
      Box(
        updateGame: updateGame,
        id: 6,
        value: Provider.of<BoxDataNotifier>(context).getBoxValue(6),
      ),
      Box(
        updateGame: updateGame,
        id: 7,
        value: Provider.of<BoxDataNotifier>(context).getBoxValue(7),
      ),
      Box(
        updateGame: updateGame,
        id: 8,
        value: Provider.of<BoxDataNotifier>(context).getBoxValue(8),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    createBoxList();
    count = Provider.of<BoxDataNotifier>(context).count;
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
                  children: [boxesList[0], boxesList[1], boxesList[2]],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [boxesList[3], boxesList[4], boxesList[5]],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [boxesList[6], boxesList[7], boxesList[8]],
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
          Provider.of<BoxDataNotifier>(context, listen: false).restartGame();
        },
      ),
    );
  }
}

class Box extends StatefulWidget {
  Box({
    Key? key,
    required this.id,
    required this.updateGame,
    required this.value,
  }) : super(key: key);

  final int id;
  final Function updateGame;
  String value = '';

  //value = Provider.of<BoxDataNotifier>(context, listen: false).getBoxValue(id);

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  String value = '';

  final iconlist = DefaultTextStyle.merge(
      style: const TextStyle(fontWeight: FontWeight.bold), child: Container());

  void _playTurn() {
    Provider.of<BoxDataNotifier>(context, listen: false).updateValue(widget.id);
    Provider.of<BoxDataNotifier>(context, listen: false).incrementCounter();
    widget.updateGame(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    value = Provider.of<BoxDataNotifier>(context).getBoxValue(widget.id);
    return InkWell(
      onTap: (() {
        if (value != '') {
          return;
        }

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
          child: Text(value),
        ),
      ),
    );
  }
}

class BoxDataNotifier extends ChangeNotifier {
  int count = 1;
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

    notifyListeners();
  }

  void incrementCounter() {
    count++;
  }

  void restartGame() {
    boxValue = [
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
    notifyListeners();
  }

  String getBoxValue(int boxId) => boxValue[boxId];
}
