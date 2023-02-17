import 'dart:math';

class GameModel {
  GameModel._internal();
  static final GameModel instance = GameModel._internal();
  factory GameModel() => instance;

  String status = 'X\'s move (Player 01)';

  List<String> board = ['', '', '', '', '', '', '', '', ''];

  String player01 = 'assets/player1.png';
  String player02 = 'assets/player2.png';
  String suggestion = 'assets/suggestion.png';

  int totalTurn = 0;
  bool gameFinished = false;
  bool suggestionActive = false;

  List<int> playerScores = [0, 0];

  removeSuggestion() {
    for (int i = 0; i < 9; i++) {
      if (board[i] == suggestion) {
        board[i] = '';
      }
    }
  }

  newGame() {
    board = ['', '', '', '', '', '', '', '', ''];
    gameFinished = false;
    suggestionActive = false;
    totalTurn = 0;
    status = 'X\'s move (Player 01)';
  }

  restart() {
    board = ['', '', '', '', '', '', '', '', ''];
    gameFinished = false;
    suggestionActive = false;
    playerScores = [0, 0];
    totalTurn = 0;
    status = 'X\'s move (Player 01)';
  }

  resign(String player) {
    if (player == player01) {
      playerScores[1] = playerScores[1] + 1;
    } else {
      playerScores[0] = playerScores[0] + 1;
    }
    board = ['', '', '', '', '', '', '', '', ''];
    gameFinished = false;
    suggestionActive = false;
    totalTurn = 0;
    status = 'X\'s move (Player 01)';
  }

  drawX(int index) {
    removeSuggestion();
    board[index] = player01;

    suggestionActive = false;
    status = 'O\'s move (Player 02)';
    checkStatus(player01);
  }

  drawO(int index) {
    removeSuggestion();
    board[index] = player02;

    suggestionActive = false;
    status = 'X\'s move (Player 01)';
    checkStatus(player02);
  }

  int findBestMove(tempBoard, player) {
    int bestValue = -1000;
    int bestMove = -1;

    for (int i = 0; i < 9; i++) {
      if (tempBoard[i] == '') {
        tempBoard[i] = player;
        int moveValue = minimax(tempBoard, 0, false, player, -1000, 1000);
        tempBoard[i] = '';

        if (moveValue > bestValue) {
          bestMove = i;
          bestValue = moveValue;
        }
      }
    }

    return bestMove;
  }

  int minimax(tempBoard, int depth, isMax, player, int alpha, int beta) {
    int score = evaluate(tempBoard, player);
    if (score != 0) {
      return score;
    }

    if (moveLeft(tempBoard) == false) {
      return 0;
    }

    if (isMax) {
      int best = -1000;
      for (int i = 0; i < 9; i++) {
        if (tempBoard[i] == '') {
          if (player == player01) {
            tempBoard[i] = player01;
            best = max(best,
                minimax(tempBoard, depth + 1, !isMax, player01, alpha, beta));
            tempBoard[i] = '';
          } else {
            tempBoard[i] = player02;
            best = max(best,
                minimax(tempBoard, depth + 1, !isMax, player02, alpha, beta));
            tempBoard[i] = '';
          }
          alpha = max(alpha, best);
          if (beta <= alpha) {
            break;
          }
        }
      }
      return best;
    } else {
      int best = 1000;
      for (int i = 0; i < 9; i++) {
        if (tempBoard[i] == '') {
          if (player == player01) {
            tempBoard[i] = player02;
            best = min(best,
                minimax(tempBoard, depth + 1, !isMax, player02, alpha, beta));
            tempBoard[i] = '';
          } else {
            tempBoard[i] = player01;
            best = min(best,
                minimax(tempBoard, depth + 1, !isMax, player01, alpha, beta));
            tempBoard[i] = '';
          }
          beta = min(beta, best);
          if (beta <= alpha) {
            break;
          }
        }
      }
      return best;
    }
  }

  int evaluate(tempBoard, player) {
    if (checkWinner(tempBoard)) {
      if (player == player02) {
        return 10;
      } else {
        return -10;
      }
    }
    return 0;
  }

  bool checkWinner(tempBoard) {
    if (check(0, 1, 2, board) ||
        check(3, 4, 5, board) ||
        check(6, 7, 8, board) ||
        check(0, 3, 6, board) ||
        check(1, 4, 7, board) ||
        check(2, 5, 8, board) ||
        check(0, 4, 8, board) ||
        check(2, 4, 6, board)) {
      return true;
    }
    return false;
  }

  bool check(i, j, k, gameBoard) {
    if (gameBoard[i] != '' && gameBoard[j] != '' && gameBoard[k] != '') {
      if (gameBoard[i] == gameBoard[j] && gameBoard[j] == gameBoard[k]) {
        return true;
      }
    }
    return false;
  }

  bool moveLeft(tempBoard) {
    for (int i = 0; i < 9; i++) {
      if (tempBoard[i] == '') {
        return true;
      }
    }
    return false;
  }

  void checkStatus(player) {
    if (checkWinner(board)) {
      player == player01
          ? {
              playerScores[0] = playerScores[0] + 1,
              status = 'Winner (Player 01)'
            }
          : {
              playerScores[1] = playerScores[1] + 1,
              status = 'Winner (Player 02)'
            };
      gameFinished = true;
    }
    if (!moveLeft(board) && !gameFinished) {
      gameFinished = true;
      status = 'Tie (Good Match)';
    }
  }
}
