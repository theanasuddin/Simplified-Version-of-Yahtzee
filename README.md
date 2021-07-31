# Simplified-Version-of-Yahtzee™

A single-player version of the classic probability dice 🎲 game [Yahtzee™](https://en.wikipedia.org/wiki/Yahtzee) written in Processing. Download [executables for Windows](https://cutt.ly/LQak6SB). Download [executables for Linux](https://cutt.ly/CQfVdiX) distributions. Download [installer for Windows](https://cutt.ly/TQalec7) (64-bit). If you are interested to run the source code in Processing IDE on your preferred OS, you can go through the steps mentioned later in this document.

![cover](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/cover.png)

## User Interface:

![user interface](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/main_ui.png)

## How To Run ▶ The Source Code?

 1. [Download](https://processing.org/download/) Processing.  Processing is available for Linux, Mac OS X, and Windows. Select your choice to download the IDE.
 2. [Download](https://github.com/theanasuddin/Simplified-Version-of-Yahtzee/archive/refs/heads/main.zip) the source code (zipped) for Yahtzee™ and unzip it.
 3. Goto the project folder 📁 and rename the *"Simplified-Version-of-Yahtzee-main"* folder to *"Yahtzee"* found inside the project folder.
 4. Move the *"Yahtzee"* folder to sketchbook location. Default sketchbook location is `C:\Users\<name>\Documents\Processing` for Windows, here `<name>` is the name of your user account.
 5. Go inside the *"Yahtzee"* folder and open the *"Yahtzee.pde"* source file with Processing.
 6. Click on Run ▶ button inside Processing and play.

## How To Run ▶ On A Linux Distribution?

 1. Download [executables for Linux](https://cutt.ly/CQfVdiX) distributions.
 ![executables for linux](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/screenshots/how%20to%20run%20on%20linux/1.png)
 2. Unzip the *"Yahtzee-Linux-Executables.zip"* file.
 ![extract executables for linux](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/screenshots/how%20to%20run%20on%20linux/2.png)
 ![extracted folder](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/screenshots/how%20to%20run%20on%20linux/3.png)
 3. Goto the specific folder 📁 from the folders *"application.linux32"*, *"application.linux64"*, *"application.linux-arm64"*, and *"application.linux-armv6hf"* found inside the unzipped *"Yahtzee-Linux-Executables"* folder for your specific Linux machine.
 ![all folders](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/screenshots/how%20to%20run%20on%20linux/4.png)
 4. Right click on the *"Yahtzee"* file found inside a specific folder dedicated for for your specific machine.
 5. Click on "Properties", then goto 👉 "Permissions" tab and check ☒ "Allow executing file as program" under the "Execute:" label.
 ![click on properties](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/screenshots/how%20to%20run%20on%20linux/5.png)
 ![check](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/screenshots/how%20to%20run%20on%20linux/6.png)
 6. Close the window and again right click on an empty area to "Open in Terminal".
 ![open terminal](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/screenshots/how%20to%20run%20on%20linux/7.png)
 7. Click on "Open in Terminal" to open the terminal and run the following command:

    ```sh
    $ ./Yahtzee
    ```
    ![run the command](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/screenshots/how%20to%20run%20on%20linux/8.png)
 8. Play.
 ![play](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/screenshots/how%20to%20run%20on%20linux/9.png)

## About The Game :game_die::

### Gist: 

:pushpin: Yahtzee™ is a dice game based on Poker. The object of the game is to roll certain combinations of numbers with five 6-sided dice. At each round, you throw dice trying to get a good combination of numbers.  Different combinations give different scores. While luck plays a big role in Yahtzee™, the strategy makes a significant difference. The reason for this is that you score each combination just once, and the number of different combinations in which you can score is equal to the number of rounds in the game. This means that you have to make wise choices about when to score in each combination and you have to be careful about what combinations you seek at each round.

### How To Play :video_game:?

:pushpin: The game consists of thirteen rounds. Each round consists of up to three separate rolls of the dice. On the first roll, you roll all five of the dice. After the first and second roll, you can hold any subset of the five dice you want (including none of the dice or all of the dice) and roll the rest trying to get a good combination. After the three rolls (or after the first or second roll if you choose to stop) you must find a place among the thirteen scoring boxes in the scoresheet to put your score. The scoring categories have varying point values, some of which are fixed values and others for which the score depends on the value of the dice. The score you get depends on the box that you choose and the combination that you have rolled. After a scoring box is used, you can't use it again, so you have to choose wisely. This means that, in general, you don't have to choose the box that gives you the highest score for the combination you have rolled, since it may be advantageous to save that box for an even better roll later in the game. In fact, there are many situations in which it makes sense to put a 0 in a "bad" box instead of a low score in another "good" box because doing so would block the "good" box for future rounds. 

:pushpin: The game is completed after 13 rounds, with all the scoring boxes filled. The total score is calculated by summing all thirteen boxes, together with any bonuses. The winner is the player who scores the most points. The Yahtzee™ scoresheet contains 13 scoring boxes divided into upper and lower sections.

### Upper Section of Scoresheet :clipboard::

In the upper section there are six boxes. The score in each of these boxes is determined by adding the total number of dice matching that box.

| Categories | Descriptions | Scores | Examples |
| :--------: | :----------: | :----: | :------: |
**1's** | Any combination | The sum of dice with the number 1 | <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/Dice-1.svg" alt="Dice-1" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/Dice-1.svg" alt="Dice-1" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/Dice-1.svg" alt="Dice-1" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Dice-4.svg" alt="Dice-4" width="40" height="40" /> scores 3
**2's** | Any combination | The sum of dice with the number 2 | <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Dice-2.svg" alt="Dice-2" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Dice-2.svg" alt="Dice-2" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Dice-2.svg" alt="Dice-2" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/d7/Dice-6a.svg" alt="Dice-6" width="40" height="40" /> scores 6
**3's** | Any combination | The sum of dice with the number 3 | <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Dice-4.svg" alt="Dice-4" width="40" height="40" /> scores 12
**4's** | Any combination | The sum of dice with the number 4 | <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Dice-4.svg" alt="Dice-4" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Dice-4.svg" alt="Dice-4" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> scores 8
**5's** | Any combination | The sum of dice with the number 5 | <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/Dice-1.svg" alt="Dice-1" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/Dice-1.svg" alt="Dice-1" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Dice-2.svg" alt="Dice-2" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Dice-2.svg" alt="Dice-2" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> scores 5
**6's** | Any combination | The sum of dice with the number 6 | <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Dice-2.svg" alt="Dice-2" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/d7/Dice-6a.svg" alt="Dice-6" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/d7/Dice-6a.svg" alt="Dice-6" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/d7/Dice-6a.svg" alt="Dice-6" width="40" height="40" /> scores 18

If a player scores a total of 63 or more points in these six boxes, a bonus of 35 is added to the upper section score. Although 63 points corresponds to scoring exactly three-of-a-kind for each of the six boxes, a common way to get the bonus is by scoring four-of-a-kind for some numbers so that fewer of other numbers are needed. A player can earn the bonus even if they score a "0" in an upper section box.

### Lower Section of Scoresheet :clipboard::

The lower section contains a number of poker-themed categories with specific point values.

| Categories | Descriptions | Scores | Examples |
| :--------: | :----------: | :----: | :------: |
**3 Of A Kind** | At least three dice the same | Sum of all dice | <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Dice-2.svg" alt="Dice-2" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Dice-4.svg" alt="Dice-4" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Dice-4.svg" alt="Dice-4" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Dice-4.svg" alt="Dice-4" width="40" height="40" /> scores 17
**4 Of A Kind** | At least four dice the same | Sum of all dice | <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Dice-4.svg" alt="Dice-4" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> scores 24
**Full House** | Three of one number and two of another | 25 | <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Dice-2.svg" alt="Dice-2" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Dice-2.svg" alt="Dice-2" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> scores 25
**Small Straight** | Four sequential dice (1-2-3-4, 2-3-4-5, or 3-4-5-6) | 30 | <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/Dice-1.svg" alt="Dice-1" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Dice-4.svg" alt="Dice-4" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/d7/Dice-6a.svg" alt="Dice-6" width="40" height="40" /> scores 30
**Large Straight** | Five sequential dice (1-2-3-4-5 or 2-3-4-5-6) | 40 | <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/Dice-1.svg" alt="Dice-1" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Dice-2.svg" alt="Dice-2" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Dice-4.svg" alt="Dice-4" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> scores 40
**5 Of A Kind** | All five dice the same | 50 | <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> scores 50
**Chance** | Any combination | Sum of all dice | <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/Dice-1.svg" alt="Dice-1" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/0/09/Dice-1.svg" alt="Dice-1" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Dice-3.svg" alt="Dice-3" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Dice-4.svg" alt="Dice-4" width="40" height="40" /> <img src="https://upload.wikimedia.org/wikipedia/commons/d/dc/Dice-5.svg" alt="Dice-5" width="40" height="40" /> scores 14

If a category is chosen but the dice do not match the requirements of the category the player scores 0 in that category. Some combinations offer the player a choice as to which category to score them under; e.g., a full house could be scored in the Full House, the Three-Of-A-Kind, or the Chance categories. The Chance category is often used for a turn that will not score well in any other category.

## Demo GIF:

![demo](https://raw.githubusercontent.com/theanasuddin/Simplified-Version-of-Yahtzee/main/demo.gif)
