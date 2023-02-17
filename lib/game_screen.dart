import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:tictactoe/game_model.dart';
import 'package:tictactoe/widgets/glassmorphic_box.dart';
import 'package:tictactoe/widgets/glassmorphic_button.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    //Building background theme using linear gradient.
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xFF6D35B5), Color(0xFF115EA6)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: Scaffold(
        //Make scaffold background color transparent so container color gradient is visible.
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 30 * MediaQuery.of(context).size.height / 740,
                horizontal: 45 * MediaQuery.of(context).size.width / 360),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(children: [
                  Text('Tik Tak Toe',
                      style: Theme.of(context).textTheme.headline1),
                  Text('Multiplayer Game',
                      style: Theme.of(context).textTheme.headline2),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: 100 * MediaQuery.of(context).size.width / 360,
                          child: Center(
                            child: Text('First Player',
                                style: Theme.of(context).textTheme.headline3),
                          ),
                        ),
                        Text('${GameModel.instance.playerScores[0]}',
                            style: Theme.of(context).textTheme.headline3)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: 100 * MediaQuery.of(context).size.width / 360,
                          child: Center(
                            child: Text('Second Player',
                                style: Theme.of(context).textTheme.headline3),
                          ),
                        ),
                        Text('${GameModel.instance.playerScores[1]}',
                            style: Theme.of(context).textTheme.headline3)
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (() {
                        setState(() {
                          if (GameModel.instance.suggestionActive == false &&
                              GameModel.instance
                                  .moveLeft(GameModel.instance.board) &&
                              GameModel.instance.gameFinished == false) {
                            GameModel.instance.board[GameModel.instance
                                    .findBestMove(
                                        GameModel.instance.board,
                                        GameModel.instance.totalTurn % 2 == 0
                                            ? GameModel.instance.player01
                                            : GameModel.instance.player02)] =
                                GameModel.instance.suggestion;
                          }
                          GameModel.instance.suggestionActive = true;
                        });
                      }),
                      child: const GlassmorphicButton(
                        title: 'Best Move',
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {
                        setState(() {
                          GameModel.instance.resign(
                              GameModel.instance.totalTurn % 2 == 0
                                  ? GameModel.instance.player01
                                  : GameModel.instance.player02);
                        });
                      }),
                      child: const GlassmorphicButton(title: 'Resign'),
                    ),
                  ],
                ),
                //Creating 3 x 3 boxes to play the game.
                Column(
                  children: [
                    GlassmorphicContainer(
                        width: 300 * MediaQuery.of(context).size.width / 360,
                        height: 30 * MediaQuery.of(context).size.height / 740,
                        borderRadius:
                            50 * MediaQuery.of(context).size.height / 740,
                        linearGradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(102, 255, 255, 255),
                              Color.fromARGB(13, 255, 255, 255)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        border: 2 * MediaQuery.of(context).size.height / 740,
                        blur: 40,
                        borderGradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(102, 255, 255, 255),
                              Color.fromARGB(13, 255, 255, 255)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        child: Center(
                            child: Text(GameModel.instance.status,
                                style: Theme.of(context).textTheme.headline4))),
                    SizedBox(
                        height: 20 * MediaQuery.of(context).size.height / 740),
                    SizedBox(
                      height: 300 * MediaQuery.of(context).size.height / 740,
                      width: 300 * MediaQuery.of(context).size.width / 360,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10 *
                                      MediaQuery.of(context).size.width /
                                      360,
                                  mainAxisSpacing: 10 *
                                      MediaQuery.of(context).size.height /
                                      740),
                          itemCount: GameModel.instance.board.length,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: (() {
                                setState(() {
                                  if ((GameModel.instance.board[index] == '' ||
                                          GameModel.instance.board[index] ==
                                              GameModel.instance.suggestion) &&
                                      GameModel.instance.gameFinished ==
                                          false) {
                                    if (GameModel.instance.totalTurn % 2 == 0) {
                                      GameModel.instance.drawX(index);
                                    } else {
                                      GameModel.instance.drawO(index);
                                    }
                                    GameModel.instance.totalTurn =
                                        GameModel.instance.totalTurn + 1;
                                  }
                                });
                              }),
                              child: GlassmorphicBox(
                                  imageURL: GameModel.instance.board[index]))),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (() {
                        setState(() {
                          GameModel.instance.newGame();
                        });
                      }),
                      child: const GlassmorphicButton(
                        title: 'New Game',
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {
                        setState(() {
                          GameModel.instance.restart();
                        });
                      }),
                      child: const GlassmorphicButton(title: 'Restart'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
