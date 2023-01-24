import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/color.dart';

import 'dart:async';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  int oScore = 0;
  int xScore = 0;
  int filledBox = 0;
  bool winnerFound = false;

  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;

  String resultDeclaration = '';

  static var customFontWhite = GoogleFonts.coiny(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 28),
  );

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }

  void resetTimer() {
    seconds = maxSeconds;
  }

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
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Player O',
                          style: customFontWhite,
                        ),
                        Text(
                          oScore.toString(),
                          style: customFontWhite,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Player X',
                          style: customFontWhite,
                        ),
                        Text(
                          xScore.toString(),
                          style: customFontWhite,
                        )
                      ],
                    )
                  ],
                ),
              ),
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      resultDeclaration,
                      style: customFontWhite,
                    ),
                    SizedBox(height: 10),
                    _buildTimer()
                  ],
                ),
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
        filledBox++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        oTurn = !oTurn;
        filledBox++;
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
        _updatedScore(displayXO[0]);
      });
    }

    // check 2nd row
    else if ((displayXO[3] == displayXO[4] && displayXO[4] == displayXO[5]) &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[3] + " Wins!!! Hindustan Zindabaad";
        _updatedScore(displayXO[3]);
      });
    }

    // check 3rd row
    else if ((displayXO[6] == displayXO[7] && displayXO[7] == displayXO[8]) &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[6] + " Wins!!! Hindustan Zindabaad";
        _updatedScore(displayXO[6]);
      });
    }

    // check 1st column
    else if ((displayXO[0] == displayXO[3] && displayXO[3] == displayXO[6]) &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[0] + " Wins!!! Hindustan Zindabaad";
        _updatedScore(displayXO[0]);
      });
    }

    // check 2nd column
    else if ((displayXO[1] == displayXO[4] && displayXO[4] == displayXO[7]) &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[1] + " Wins!!! Hindustan Zindabaad";
        _updatedScore(displayXO[1]);
      });
    }

    // check 3rd column
    else if ((displayXO[2] == displayXO[5] && displayXO[5] == displayXO[8]) &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[2] + " Wins!!! Hindustan Zindabaad";
        _updatedScore(displayXO[2]);
      });
    }

    // check left diagonal
    else if ((displayXO[0] == displayXO[4] && displayXO[4] == displayXO[8]) &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[0] + " Wins!!! Hindustan Zindabaad";
        _updatedScore(displayXO[0]);
      });
    }

    // check right diagonal
    else if ((displayXO[2] == displayXO[4] && displayXO[4] == displayXO[6]) &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration =
            'Player ' + displayXO[2] + " Wins!!! Hindustan Zindabaad";
        _updatedScore(displayXO[2]);
      });
    }

    // Draw
    if (!winnerFound && filledBox == 9) {
      setState(() {
        resultDeclaration = "No body wins! Hindustan Zindabaad";
      });
    }
  }

  void _updatedScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      resultDeclaration = '';
      winnerFound = false;
    });
    filledBox = 0;
  }

  Widget _buildTimer() {
    final isRunning = timer == null ? false : timer!.isActive;

    return isRunning
        ? SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / maxSeconds,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 8,
                  backgroundColor: MainColor.accentColor,
                )
              ],
            ),
          )
        : ElevatedButton(
            onPressed: () {
              startTimer();
              _clearBoard();
            },
            child: Text(
              "Play Again",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
          );
  }
}
