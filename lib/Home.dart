import 'package:flutter/material.dart';
import 'package:tic_tac_toe/gameBoard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select Tile',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
            GestureDetector(
              onTap: (() => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GameBoard(
                            choice: 0,
                          )))),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 13,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: Image.asset(
                  'assets/white-circle-plastic-buttons-background-260nw-99601631-removebg-preview.png',
                  scale: 1,
                ),
              ),
            ),
            GestureDetector(
              onTap: (() => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GameBoard(choice: 1)))),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 13,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: Image.asset(
                    'assets/hd-white-x-cross-mark-icon-png-31624472741i2gfrqrqgy-removebg-preview.png'),
              ),
            )
          ],
        )),
      ),
    );
  }
}
