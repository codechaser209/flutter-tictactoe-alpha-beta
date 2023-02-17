# Two Player TikTakToe Game in Flutter with Best Move Feature

This is a simple implementation of the classic two player game, TikTakToe, using Flutter with a feature of best move using alpha-beta pruning.

## Features
* Play against a friend in a 3x3 grid.
* Turn-based gameplay where players take turns placing X or O on the board.
* Detects when a player has won or the game ends in a tie.
* Displays the final result.
* Allows players to restart the game after it ends.
* Uses alpha-beta pruning to determine the best move for the player.

## Screenshots
![Gameplay Screenshot](https://user-images.githubusercontent.com/97142240/219706984-3dc258ed-d8ca-4ba3-a66e-2ad1d1d300cb.png)
![Suggestion Screenshot](https://user-images.githubusercontent.com/97142240/219707110-478d7e8d-6174-41a6-a120-bf116da1dbc5.png)

![Winning Screenshot](https://user-images.githubusercontent.com/97142240/219707123-05ea86cb-b65e-4ee4-8048-01a2455bef49.png)
![Tie Screenshot](https://user-images.githubusercontent.com/97142240/219707144-529ff157-ae08-4d65-97bb-f8ebaf2e1fbb.png)
## Usage
To play the game, simply clone this repository to your local machine and run it in a Flutter environment. Ensure that you have flutter version 3.3.10 installed and configured on your machine.

Once the app starts running, the will game begins and continues until a player wins or the board is full.

The game will use alpha-beta pruning to determine the best move for the player. The best move will be displayed on the board. You can check the best move by clicking the "Best Move" button.

After the game ends, You can start a new game by clicking the "New Game" button.

One point will be added to the player point when a player wins a game or another player resign by clicking the "Resign" button.

The score of both players can be set to zero by clicking the "Restart" button.

## Contributions
Contributions are welcome! If you find a bug or have an idea for a new feature, feel free to create a pull request.
