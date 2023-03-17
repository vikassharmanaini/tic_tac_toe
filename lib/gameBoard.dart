import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Home.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key, required this.choice});
  final int choice;
  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late String player;
  late String computer;
  List board = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  late List<int> computertilemem;
  @override
  void initState() {
    if (widget.choice == 0) {
      player =
          'assets/white-circle-plastic-buttons-background-260nw-99601631-removebg-preview.png';
      computer =
          'assets/hd-white-x-cross-mark-icon-png-31624472741i2gfrqrqgy-removebg-preview.png';
    } else {
      player =
          'assets/hd-white-x-cross-mark-icon-png-31624472741i2gfrqrqgy-removebg-preview.png';
      computer =
          'assets/white-circle-plastic-buttons-background-260nw-99601631-removebg-preview.png';
    }
    computertilemem = [0, 1, 2, 3, 4, 5, 6, 7, 8];
    super.initState();
  }

  String winner = '';
  @override
  Widget build(BuildContext context) {
    if (winner != '') {
      Future.delayed(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home())));
    }
    return Scaffold(
      body: Container(
          color: Colors.blueGrey,
          child: SafeArea(
            child: (winner == 'p')
                ? result('YOU WIN')
                : (winner == 'c')
                    ? result('COMPUTER WIN')
                    : (winner == 'd')
                        ? result('Match Draw')
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                Text(
                                  "Let's play",
                                  style: TextStyle(
                                      fontSize: 20,
                                      shadows: [
                                        Shadow(
                                            blurRadius: 10, color: Colors.grey)
                                      ],
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic),
                                ),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: GridView.builder(
                                      itemCount: board.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3),
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          tapping(index);
                                        },
                                        child: Container(
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.blueGrey,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.white,
                                                      blurRadius: 2,
                                                      blurStyle:
                                                          BlurStyle.outer)
                                                ]),
                                            child: (board[index] == 0)
                                                ? SizedBox()
                                                : (board[index] == 1)
                                                    ? Image.asset(computer)
                                                    : Image.asset(player)),
                                      ),
                                    )),
                              ]),
          )),
    );
  }

  tapping(int index) {
    print('youchoose : $index');
    if (board[index] == 0) {
      computertilemem.remove(index);
      board[index] = 2;
      if (checkwineer(1)) {
        setState(() {
          if (checkdraw()) {
            winner = 'd';
          } else {
            winner = 'c';
          }
        });
        return;
      } else if (checkwineer(2)) {
        setState(() {
          if (checkdraw()) {
            winner = 'd';
          } else {
            winner = 'p';
          }
        });
        return;
      }
      if (computertilemem.length > 0) {
        int rand = getRandomElement(computertilemem);
        computertilemem.remove(rand);
        print('computer choose : $rand');
        setState(() {
          board[rand] = 1;
        });
      } else {
        setState(() {
          winner = 'd';
        });
      }
      if (checkwineer(1)) {
        setState(() {
          if (checkdraw()) {
            winner = 'd';
          } else {
            winner = 'c';
          }
        });
        return;
      } else if (checkwineer(2)) {
        setState(() {
          if (checkdraw()) {
            winner = 'd';
          } else {
            winner = 'p';
          }
        });
        return;
      }
    }
  }

  Widget result(String val) => Center(
          child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 3, color: Colors.grey, blurStyle: BlurStyle.outer)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        child: Text(
          val,
          style: TextStyle(
              fontSize: 16,
              shadows: [
                Shadow(
                  blurRadius: 4,
                )
              ],
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ));
  bool checkwineer(int i) {
    if ((board[0] == i && board[1] == i && board[2] == i) || //horrizontal
            (board[3] == i && board[4] == i && board[5] == i) || //horrizontal
            (board[6] == i && board[7] == i && board[8] == i) || //horrizontal
            (board[0] == i && board[3] == i && board[6] == i) || //vertical
            (board[1] == i && board[4] == i && board[7] == i) || //vertical
            (board[2] == i && board[5] == i && board[8] == i) || //vertical
            (board[0] == i && board[4] == i && board[8] == i) || //crose
            (board[2] == i && board[4] == i && board[6] == i) //crose

        ) {
      return true;
    } else {
      return false;
    }
  }

  bool checkdraw() {
    for (var element in board) {
      if (element == 0) {
        return false;
      }
    }
    return true;
  }

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}
