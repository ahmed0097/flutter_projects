import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe_app/constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  List<String> displayXO = ["", "", "", "", "", "", "", "", ""];
  List<int> matchedIndexes = [];
  int atteempts = 0;

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String reslutDeclation = "";
  bool winnerFound = false;

  static const maxSeconds = 15;
  int seconds = maxSeconds;
  Timer? timer;

  static var customFontWhite = GoogleFonts.coiny(
    textStyle: const TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 25,
    ),
  );

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
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

  void resetTimer() => seconds = maxSeconds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
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
                      Text(oScore.toString(), style: customFontWhite),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Player X',
                        style: customFontWhite,
                      ),
                      Text(xScore.toString(), style: customFontWhite),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          color: MainColors.primaryColor,
                          width: 2,
                        ),
                        color: matchedIndexes.contains(index)
                            ? MainColors.accentColor
                            : MainColors.secodaryColor,
                      ),
                      child: Center(
                          child: Text(
                        displayXO[index],
                        style: GoogleFonts.coiny(
                            textStyle: TextStyle(
                          color: MainColors.primaryColor,
                          letterSpacing: 3,
                          fontSize: 65,
                        )),
                      )),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      reslutDeclation,
                      style: customFontWhite,
                    ),
                    const SizedBox(height: 10),
                    _buildTimer(),
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
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      setState(
        () {
          if (oTurn && displayXO[index] == "") {
            displayXO[index] = "O";
            filledBoxes++;
          } else if (!oTurn && displayXO[index] == "") {
            displayXO[index] = "X";
            filledBoxes++;
          }
          oTurn = !oTurn;
          _checkWinner();
        },
      );
    }
  }

  void _checkWinner() {
    //check rows
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != "") {
      setState(() {
        reslutDeclation = 'Player ${displayXO[0]} Wins!';
        matchedIndexes = [0, 1, 2];
        stopTimer();
        _updareScore(displayXO[0]);
      });
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != "") {
      setState(() {
        reslutDeclation = 'Player ${displayXO[3]} Wins!';
        matchedIndexes = [3, 4, 5];
        stopTimer();
        _updareScore(displayXO[3]);
      });
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != "") {
      setState(() {
        reslutDeclation = 'Player ${displayXO[6]} Wins!';
        matchedIndexes = [6, 7, 8];
        stopTimer();
        _updareScore(displayXO[6]);
      });
    }
    //check columns
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != "") {
      setState(() {
        reslutDeclation = 'Player ${displayXO[0]} Wins!';
        matchedIndexes = [0, 3, 6];
        stopTimer();
        _updareScore(displayXO[0]);
      });
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != "") {
      setState(() {
        reslutDeclation = 'Player ${displayXO[1]} Wins!';
        matchedIndexes = [1, 4, 7];
        stopTimer();
        _updareScore(displayXO[1]);
      });
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != "") {
      setState(() {
        reslutDeclation = 'Player ${displayXO[2]} Wins!';
        matchedIndexes = [2, 5, 8];
        stopTimer();
        _updareScore(displayXO[2]);
      });
    }
    //check diagonals
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != "") {
      setState(() {
        reslutDeclation = 'Player ${displayXO[0]} Wins!';
        matchedIndexes = [0, 4, 8];
        stopTimer();
        _updareScore(displayXO[0]);
      });
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != "") {
      setState(() {
        reslutDeclation = 'Player ${displayXO[2]} Wins!';
        matchedIndexes = [2, 4, 6];
        stopTimer();
        _updareScore(displayXO[2]);
      });
    }
    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        reslutDeclation = 'Game Draw!';
        stopTimer();
      });
    }
  }

  void _updareScore(String winner) {
    if (winner == 'O' && !winnerFound) {
      oScore++;
    } else if (winner == 'X' && !winnerFound) {
      xScore++;
    }
    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = "";
      }
      reslutDeclation = "";
      filledBoxes = 0;
      winnerFound = false;
      matchedIndexes = [];
    });
  }

  Widget _buildTimer() {
    final isRunning = timer == null ? false : timer!.isActive;
    return isRunning
        ? SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - (seconds / maxSeconds),
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 8,
                  backgroundColor: MainColors.accentColor,
                ),
                Center(
                  child: Text(
                    '$seconds',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                )),
            onPressed: () {
              startTimer();
              _clearBoard();
              atteempts++;
            },
            child: Text(
              atteempts == 0 ? 'Start' : 'Play Again !',
              style: TextStyle(
                fontSize: 20,
                color: MainColors.accentColor,
              ),
            ),
          );
  }
}
