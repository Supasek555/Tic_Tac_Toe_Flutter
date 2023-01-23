import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/color.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  // int oScore = 0;
  // int xScore = 0;
  // int filledBox = 0;

  String resultDeclaration = '';

  static var customFontWhite = GoogleFonts.coiny(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 28),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(child: Text("Score Board")),
            ),
            Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 5,
                              color: MainColor.primaryColor,
                            ),
                            color: MainColor.secondaryColor),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: GoogleFonts.coiny(
                                textStyle: TextStyle(
                              fontSize: 64,
                              color: MainColor.primaryColor,
                            )),
                          ),
                        ),
                      ),
                    );
                  },
                )),
            Expanded(
              flex: 2,
              child: Text(
                resultDeclaration,
                style: customFontWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        oTurn = !oTurn;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        oTurn = !oTurn;
      }

      _checkWinner();
    });

    print("$index is selected");
    if (oTurn) {
      print("Now is O turn");
    } else {
      print("Now is X turn");
    }
  }

  void _checkWinner() {
    // check 1st row
    if ((displayXO[0] == displayXO[1] && displayXO[1] == displayXO[2]) &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[0] + " Wins!!! Hindustan Zindabaad";
      });
    }

    // check 2nd row
    if ((displayXO[3] == displayXO[4] && displayXO[4] == displayXO[5]) &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[3] + " Wins!!! Hindustan Zindabaad";
      });
    }

    // check 3rd row
    if ((displayXO[6] == displayXO[7] && displayXO[7] == displayXO[8]) &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[6] + " Wins!!! Hindustan Zindabaad";
      });
    }

    // check 1st column
    if ((displayXO[0] == displayXO[3] && displayXO[3] == displayXO[6]) &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[0] + " Wins!!! Hindustan Zindabaad";
      });
    }

    // check 2nd column
    if ((displayXO[1] == displayXO[4] && displayXO[4] == displayXO[7]) &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[1] + " Wins!!! Hindustan Zindabaad";
      });
    }

    // check 3rd column
    if ((displayXO[2] == displayXO[5] && displayXO[5] == displayXO[8]) &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[2] + " Wins!!! Hindustan Zindabaad";
      });
    }

    // check left diagonal
    if ((displayXO[0] == displayXO[4] && displayXO[4] == displayXO[8]) &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[0] + " Wins!!! Hindustan Zindabaad";
      });
    }

    // check right diagonal
    if ((displayXO[2] == displayXO[4] && displayXO[4] == displayXO[6]) &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[2] + " Wins!!! Hindustan Zindabaad";
      });
    }
  }
}
