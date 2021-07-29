/**
 * Author - Anas Uddin
 * GitHub - https://github.com/theanasuddin
 * 
 * Simplified Yahtzee game.
 * Use a full score card and play a complete one
 * player version of Yahtzee. 
 */

//Constants controlling the game.
//Using the score card the number of dice and sides should not be changed.
final int NUM_SIDES = 6;   //Sides on the dice
final int NUM_DICE = 5;    //The number of dice used
final int NUM_REROLLS = 2; //Number of rerolls after the initial roll

//Variable storing the dice moves.
int[] dice = new int[NUM_DICE];

void rollDice() {
  for (int i = 0; i < dice.length; i++) {
    dice[i] = (int) random(1, NUM_SIDES + 1);
  }
}//rollDice

void showDiceRoll() {
  for (int i = 0; i < NUM_DICE; i++) {
    drawDie(i, dice[i]);
  }
}//showDiceRoll

void reroll(boolean[] diceToRoll) {
  for (int i = 0; i < dice.length; i++) {
    if (diceToRoll[i]) {
      dice[i] = (int) random(1, NUM_SIDES + 1);
    }
  }
}//reroll

int scoreAs(int chosenNumber) {
  int score = 0;
  for (int i = 0; i < dice.length; i++) {
    if (dice[i] == chosenNumber) {
      score += dice[i];
    }
  }

  return score;
}//scoreAs

int[] freqCount(int[] roll) {
  //Count the frequencies of each number (1..NUM_SIDES) in
  //the given dice roll, returning the result as a array of
  //NUM_SIDES integers. Note that freqs[0..5] are the frequencies
  //of 1..6. The dice show 1-6 but subscripts must go 0-5.

  int[] frequencies = new int[NUM_SIDES];

  for (int i = 0; i < frequencies.length; i++) {
    int side = i + 1;
    int frequency = 0;
    for (int j = 0; j < roll.length; j++) {
      if (side == roll[j]) {
        frequency++;
      }
    }
    frequencies[i] = frequency;
  }

  return frequencies;
}//freqCount

int maxOfAKind(int[] freqs) {
  //Find and return the largest integer in an array of integers.

  int max = 0;
  for (int i = 0; i < freqs.length; i++) {
    if (freqs[i] > max) {
      max = freqs[i];
    }
  }

  return max;
}//maxOfAKind

int maxInARow(int[] freqs) {
  //Find the maximum number of consecutive non-zero values
  //that appear in the array freqs.

  int maxNonZeroCount = 0;
  int currentMaxNonZeroCount = 0;

  for (int i = 0; i < freqs.length; i++) {
    if (freqs[i] == 0) {
      currentMaxNonZeroCount = 0;
    } else {
      currentMaxNonZeroCount++;
      if (currentMaxNonZeroCount > maxNonZeroCount) {
        maxNonZeroCount = currentMaxNonZeroCount;
      }
    }
  }

  return maxNonZeroCount;
}//maxInARow

boolean hasFullHouse(int[] freqs) {
  //Determine whether or not the array of intgers (freqs)
  //contains both a 3 (anywhere) and a 2 (anywhere).

  boolean hasThree = false, hasTwo = false, hasFullHouse;

  for (int i = 0; i < freqs.length; i++) {
    if (freqs[i] == 3) {
      hasThree = true;
    } else if (freqs[i] == 2) {
      hasTwo =  true;
    }
  }

  if (hasThree && hasTwo) {
    hasFullHouse = true;
  } else {
    hasFullHouse = false;
  }

  return hasFullHouse;
}//hasFullHouse

int EMPTY = -1;              //Special code for a blank unused row
//The bonus is for getting 3 of each number from 1 to NUM_SIDES.
int BONUS_THRESHOLD = (NUM_SIDES) * (NUM_SIDES + 1) * 3 / 2; //That's the formula for it
int BONUS_VALUE = 35;        //The bonus for getting the above value

int[] scoreSheet;
final int SCORE_SHEET_SIZE = 17; //The number of rows required in a score sheet

//Named locations in the score sheet array, for readability.
//Elements 0 to 5 are for 1's to 6's. The rest are:
final int BONUS = 6; 
final int TOTAL_1_TO_6 = 7;
final int KIND_3 = 8;
final int KIND_4 = 9;
final int FULL_HOUSE = 10;
final int SM_STRAIGHT = 11;
final int LG_STRAIGHT = 12;
final int KIND_5 = 13;
final int CHANCE = 14;
final int SUBTOTAL = 15;
final int TOTAL = 16;

void resetScoreSheet() {
  //Reset the score sheet (17 rows total) array. All the entries will be
  //set to EMPTY. The bonus, subtotal, and total entries will be set to 0.

  scoreSheet = new int[SCORE_SHEET_SIZE];
  for (int i = 0; i < scoreSheet.length; i++) {
    if (i == BONUS || i == TOTAL_1_TO_6 || i == SUBTOTAL || i == TOTAL) {
      scoreSheet[i] = 0;
    } else {
      scoreSheet[i] = EMPTY;
    }
  }
}//resetScoreSheet

boolean enterScore(int row, int[] dice) {
  /* Enter the appropriate score into the scoreSheet, using the given
   * row (a value from 0 to SCORE_SHEET_SIZE-1).
   * Make sure that the row is valid (not a subtotal, total, or bonus
   * row). Return true if the row was valid and the score was entered,
   * and false if the attempt was rejected.
   */

  if (scoreSheet[row] != EMPTY) {
    return false;
  } else {
    if (row == 0 || row == 1 || row == 2 || row == 3 || row == 4 || row == 5) {
      scoreSheet[row] = scoreAs(row + 1);
    }

    int totalOneToSix = 0;
    for (int i = 0; i < 6; i++) {
      if (scoreSheet[i] != EMPTY) {
        totalOneToSix += scoreSheet[i];
      }
    }

    if (totalOneToSix >= BONUS_THRESHOLD) {
      scoreSheet[BONUS] = BONUS_VALUE;
      totalOneToSix += BONUS_VALUE;
    }

    scoreSheet[TOTAL_1_TO_6] = totalOneToSix;

    int[] freqs = freqCount(dice);
    switch(row) {
    case KIND_3:
      boolean hasThreeOrMore = false;

      for (int i = 0; i < freqs.length; i++) {
        if (freqs[i] >= 3) {
          hasThreeOrMore = true;
          break;
        }
      }

      if (hasThreeOrMore) {
        scoreSheet[row] = sumAllDice(dice);
      } else {
        scoreSheet[row] = 0;
      }
      break;
    case KIND_4:
      boolean hasFourOrMore = false;

      for (int i = 0; i < freqs.length; i++) {
        if (freqs[i] >= 4) {
          hasFourOrMore = true;
          break;
        }
      }

      if (hasFourOrMore) {
        scoreSheet[row] = sumAllDice(dice);
      } else {
        scoreSheet[row] = 0;
      }
      break;
    case FULL_HOUSE:
      if (hasFullHouse(freqs)) {
        scoreSheet[row] = 25;
      } else {
        scoreSheet[row] = 0;
      }     
      break;
    case SM_STRAIGHT:
      if (maxInARow(freqs) >= 4) {
        scoreSheet[row] = 30;
      } else {
        scoreSheet[row] = 0;
      }
      break;
    case LG_STRAIGHT:
      if (maxInARow(freqs) == 5) {
        scoreSheet[row] = 40;
      } else {
        scoreSheet[row] = 0;
      }
      break;
    case KIND_5:
      boolean hasFive = false;

      for (int i = 0; i < freqs.length; i++) {
        if (freqs[i] == 5) {
          hasFive = true;
          break;
        }
      }

      if (hasFive) {
        scoreSheet[row] = 50;
      } else {
        scoreSheet[row] = 0;
      }
      break;
    case CHANCE:
      scoreSheet[row] = sumAllDice(dice);
      break;
    }

    int totalKind3ToChance = 0;
    for (int i = KIND_3; i <= CHANCE; i++) {
      if (scoreSheet[i] != EMPTY) {
        totalKind3ToChance += scoreSheet[i];
      }
    }

    scoreSheet[SUBTOTAL] = totalKind3ToChance;
    scoreSheet[TOTAL] = scoreSheet[SUBTOTAL] + scoreSheet[TOTAL_1_TO_6];

    return true;
  }
}//enterScore

int sumAllDice(int[] dice) {
  int sum = 0;
  for (int i = 0; i < dice.length; i++) {
    sum += dice[i];
  }

  return sum;
}//sumAllDice

int rerollsMade = 0;        //Keep track of the number of rerolls done
boolean turnOver = true;    //True means a new turn will star on the next click
boolean scoringPhase = false; //True means the next click will choose where to score the roll
boolean gameOver = false;   //True when all turns have been played and the game is over
int turnsPlayed = 0;        //The number of turns that have been completed.

final int BG_COLOR = 255;   //Light background colour.

PImage icon;   //Game icon.

final String REROLL_MESSAGE = "Click all the dice you want to reroll.\nThen click anywhere else to roll.";
final String ROLL_MESSAGE = "Click to roll a new set of dice.";

final int NUM_TURNS = 13; //Total number of turns in a complete game

//This variable keeps track of which dice are to be rerolled.
//This will also control whether dice are red or grey.
boolean[] diceToRoll = new boolean[NUM_DICE];

final int WIDTH = 500, HEIGHT = 600; //MUST MATCH THE size() COMMAND BELOW

void setup() {
  size(500, 600);
  background(BG_COLOR);
  surface.setTitle("Yahtzee™ by Anas Uddin");
  icon = loadImage("dice.png");   //Load the icon.
  surface.setIcon(icon);
  displayMessage(ROLL_MESSAGE);
  resetScoreSheet();
  drawScoreSheet(scoreSheet);
}//setup

void draw() {
}//draw

void mouseClicked() {
  /* This is really the main function that controls the entire flow
   of the game, since everything happens as a result of a mouse
   click.
   */
  if (gameOver) return; //Just ignore everything after the game is over.

  if (turnOver)    //If the previous turn was over,
    if (scoringPhase) { //If it has not been scored yet, score it.
      int rowChosen = checkScoreClick();
      if (rowChosen >= 0) { //if it's a click on scoring cell
        boolean valid = enterScore(rowChosen, dice);
        if (valid) {
          drawScoreSheet(scoreSheet);
          scoringPhase = false;
          turnsPlayed++;
          if (turnsPlayed == NUM_TURNS) {
            gameOver = true;
            displayMessage("Game Over. Thanks for playing.");
          } else
            displayMessage(ROLL_MESSAGE);
        }//if scoresheet cell was empty
      }//if scoresheet cell chosen
    }//if in the socring phase
    else
      startTurn(); //Else start a new turn
  else { //We're in the middle of a turn, doing rerolls
    int clickedDie = checkForDieClick(); //See which die was clicked, if any
    if (clickedDie >= 0) {
      //When a die is clicked, just change its status and redraw the dice.
      diceToRoll[clickedDie] = !diceToRoll[clickedDie];
      showDiceRoll();
    } else
      doReroll(); //A click anywhere else means reroll the selected dice
  }
}//mouseClicked

void startTurn() {
  //Start a new turn with a fresh roll of the dice.
  rollDice();           //Roll the dice, and start a new turn
  background(BG_COLOR); //Erase the canvas
  showDiceRoll();       //Draw the dice
  drawScoreSheet(scoreSheet);
  turnOver = false;     //Indicate that the turn has started
  displayMessage("You have " + NUM_REROLLS + " rerolls.\n" + REROLL_MESSAGE);
  rerollsMade = 0;
}

void doReroll() {
  //Reroll the dice that are selected (grey) and update the dice and message.
  background(BG_COLOR);
  reroll(diceToRoll);
  for (int i = 0; i < NUM_DICE; i++) //Reset all dice back to..
    diceToRoll[i] = false;        //..unselected or red.
  showDiceRoll();
  drawScoreSheet(scoreSheet);
  rerollsMade++;
  if (rerollsMade < NUM_REROLLS)
    displayMessage("You have " + (NUM_REROLLS - rerollsMade) + " rerolls left.\n" + REROLL_MESSAGE);
  else {
    turnOver = true;
    scoreTheTurn();
  }
}

void scoreTheTurn() {
  displayMessage("Click on an empty score box to score that number.");
  scoringPhase = true; //Just set the flag and wait for mouse clicks.
}

int checkForDieClick() {
  //Check all of the dice to see if any were clicked on.
  //Retrun the die number if so, else return -1.
  for (int die = 0; die < NUM_DICE; die++)
    if (clickInDie(die))
      return die;
  return -1;
}

//Constants that control the way the dice, scoresheet, and
//message area are displayed graphically.

//Message box at the bottom
final int MESSAGE_HEIGHT = 100;   //Bottom 50 pixels of the window
final int MESSAGE_BG = #2B2B47;   //Dark navy-blue background

//Dice
final float X_SPACING = (float)WIDTH / NUM_DICE; //X spacing of the dice
final float DIE_SIZE = X_SPACING * 0.8;    //width and height of one die
final float X_LEFT_DIE = X_SPACING * 0.1;  //left side of the leftmost die
final float Y_OFFSET = X_SPACING * 0.15;   //slight Y offset of the odd-numbered ones
final float Y_POSITION = HEIGHT - DIE_SIZE - Y_OFFSET - MESSAGE_HEIGHT; //Y coordinate of most dice
final float PIP_OFFSET = DIE_SIZE / 3.5;  //Distance from centre to pips, and between pips
final float PIP_DIAM = DIE_SIZE / 5;    //Diameter of the pips (dots)
final float DIE_BORDER_RADIUS = DIE_SIZE / 16;    //border radius of one die

//Constants controlling the way the scoresheet (SS) is drawn.
final int SS_LEFT_PART1 = 5;   //The left edge of part 1 (1's-6's)
final int SS_LEFT_PART2 = 250; //The left edge of part 2 (3 of a kind ... Total)
final int SS_TOP = 10;         //The top edge of both halves
final int SS_WIDTH = 240;      //The width of both halves
final int SS_CELL_HEIGHT = 40; //The height of one row in the sheet
final int SS_MARGIN = 5;        //Margin on all four sides
final int SS_ROWS_PART1 = 8;    //Number of rows in left half
final int SS_ROWS_PART2 = 9;    //and right half
final int SS_COLS = 2;          //Both halves have 2 columns in them
final int SS_BACKGROUND = #2B2B47; //Dark navy-blue background
final float SS_TEXT_SIZE = 0.50;   //Text size as a proportion of box height

void displayMessage(String message) {
  //Display the given message in the centre of the message area.
  //Draw the coloured box to erase any old message.
  fill(MESSAGE_BG);
  stroke(SS_BACKGROUND); //Dark navy-blue outline
  rect(0, height - MESSAGE_HEIGHT, width, MESSAGE_HEIGHT);
  //Set the text size, and colour.
  final int TEXT_SIZE = 18;
  textSize(TEXT_SIZE);
  fill(#9595A3); //Light grey text
  //Allow for multi-line messages. Count the \n characters to see.
  int numLines = 1; //One by default
  for (int i = 0; i < message.length(); i++)
    if (message.charAt(i) == '\n')
      numLines++; //Add one more line for every \n character found
  text(message, (width - textWidth(message)) / 2, 
    (height - MESSAGE_HEIGHT / 2) - TEXT_SIZE * numLines / 2);
}

boolean clickInDie(int dieNumber) {
  //Check to see if the indicated die was clicked on.
  //This function requires some of the constants above.
  float dieX = X_LEFT_DIE + dieNumber * X_SPACING;
  float dieY = Y_POSITION - Y_OFFSET * (dieNumber % 2);
  return mouseX >= dieX && mouseX <= dieX + DIE_SIZE &&
    mouseY >= dieY && mouseY <= dieY + DIE_SIZE;
}

int checkScoreClick() {
  for (int r = 0; r < SS_ROWS_PART1 + SS_ROWS_PART2; r++) {
    //Determine where the rectangle for that score entry is
    float left, top;
    float colWidth = (SS_WIDTH - 2 * SS_MARGIN) / SS_COLS;
    if (r < SS_ROWS_PART1) {
      left = SS_LEFT_PART1 + SS_MARGIN + colWidth;
      top = SS_TOP + SS_MARGIN + r * SS_CELL_HEIGHT;
    } else {
      left = SS_LEFT_PART2 + SS_MARGIN + colWidth;
      top = SS_TOP + SS_MARGIN + (r - SS_ROWS_PART1) * SS_CELL_HEIGHT;
    }
    //Check for a click in that rectangle
    if (clickIn(left, top, colWidth, SS_CELL_HEIGHT))
      return r;
  }//for each row in the score sheet
  return -1; //Nothing valid was clicked
}

boolean clickIn(float left, float top, float wide, float high) {
  /* Determine whether or not the values of mouseX and mouseY
   * mean that the cursor is inside the rectangle with the
   * given position and size.
   */
  return mouseX >= left && mouseX <= left + wide &&
    mouseY >= top && mouseY <= top + high;
}

void drawDie(int position, int value) {
  /* Draw one die in thecanvas.
   * **This will only work for dice with up to 6 sides.**
   * position - must be 0..NUM_DICE-1, indicating which die is being drawn
   * value - must be 1..6, the amount showing on that die
   */

  //From the constants above, and which die it is, find its top left corner
  float dieX = X_LEFT_DIE + position * X_SPACING;
  float dieY = Y_POSITION - Y_OFFSET * (position % 2);

  //1.Draw either orange or blue square with a dark navy-blue outline
  stroke(SS_BACKGROUND); //Dark navy-blue outline
  if (diceToRoll[position])
    fill(#0E71EB); //Blue fill for dice to reroll
  else
    fill(255, 116, 46); //Orange fill for dice to keep
  rect(dieX, dieY, DIE_SIZE, DIE_SIZE, DIE_BORDER_RADIUS);

  //2.Draw the pips (dots)
  fill(255);   //White dots
  stroke(255); //White outline

  //The centre dot (if the value is odd)
  if (1 == value % 2)
    ellipse(dieX + DIE_SIZE / 2, dieY + DIE_SIZE / 2, PIP_DIAM, PIP_DIAM);

  //The top-left and bottom-right dots (if the value is more than 1)
  if (value > 1) {
    ellipse(dieX + DIE_SIZE / 2 - PIP_OFFSET, 
      dieY + DIE_SIZE / 2 + PIP_OFFSET, PIP_DIAM, PIP_DIAM);
    ellipse(dieX + DIE_SIZE / 2 + PIP_OFFSET, 
      dieY + DIE_SIZE / 2 - PIP_OFFSET, PIP_DIAM, PIP_DIAM);
  }//if

  //The bottom-left and top-right dots (if the value is more than 3)
  if (value > 3) {
    ellipse(dieX + DIE_SIZE / 2 + PIP_OFFSET, 
      dieY + DIE_SIZE / 2 + PIP_OFFSET, PIP_DIAM, PIP_DIAM);
    ellipse(dieX + DIE_SIZE / 2 - PIP_OFFSET, 
      dieY + DIE_SIZE / 2 - PIP_OFFSET, PIP_DIAM, PIP_DIAM);
  }//if

  //The left and right dots (only if the value is 6)
  if (value == 6) {
    ellipse(dieX + DIE_SIZE / 2 - PIP_OFFSET, 
      dieY + DIE_SIZE / 2, PIP_DIAM, PIP_DIAM);
    ellipse(dieX + DIE_SIZE / 2 + PIP_OFFSET, 
      dieY + DIE_SIZE / 2, PIP_DIAM, PIP_DIAM);
  }//if
}//drawDie

void drawScoreSheet(int[] score) {
  /* Draw a "Yahtzee" score sheet
   * containing the given scores.
   */

  final String[] TITLES = {
    "1's", "2's", "3's", "4's", "5's", "6's", "Bonus", "Subtotal", 
    "3 of a kind", "4 of a kind", "Full house", "Sm straight", 
    "Lg straight", "5 of a kind", "Chance", "Subtotal", "Total"
  };

  //Draw the overall rectangles, and calculate the size of the small boxes.
  fill(#9595A3); //Light grey fill
  stroke(SS_BACKGROUND);
  rect(SS_LEFT_PART1, SS_TOP, SS_WIDTH, SS_CELL_HEIGHT * SS_ROWS_PART1 + 2 * SS_MARGIN);
  rect(SS_LEFT_PART2, SS_TOP, SS_WIDTH, SS_CELL_HEIGHT * SS_ROWS_PART2 + 2 * SS_MARGIN);
  stroke(#9595A3); //Inset light grey rectangles
  float colWidth = (SS_WIDTH - 2 * SS_MARGIN) / SS_COLS;

  //Draw all of the rows and columns of the sheet
  for (int r = 0; r < SS_ROWS_PART1 + SS_ROWS_PART2; r++)
    for (int c = 0; c < SS_COLS; c++) {
      //Determine what should be drawn in this position
      String contents;
      if (c == 0)
        contents = TITLES[r];
      else if (score[r] == EMPTY)
        contents = " ";
      else
        contents = str(score[r]);
      //Draw the contents of this small rectangular area
      float left, top;
      if (r < SS_ROWS_PART1) {
        left = SS_LEFT_PART1;
        top = SS_TOP + SS_MARGIN + r * SS_CELL_HEIGHT;
      } else {
        left = SS_LEFT_PART2;
        top = SS_TOP + SS_MARGIN + (r - SS_ROWS_PART1) * SS_CELL_HEIGHT;
      }
      boxedText(contents, SS_BACKGROUND, 
        left + SS_MARGIN + c * colWidth, top, 
        colWidth, SS_CELL_HEIGHT);
    }//nested for
}//drawScoreSheet

void boxedText(String textToDraw, int colour, 
  float left, float top, float wide, float high) {
  /* Draw the given text, against a background of the supplied
   * colour, in the given rectangular area. The text should be
   * exactly centred, and with a text size that is
   * TEXT_SIZE_FACTOR of the height of the rectangle.
   * There will be black text and a black outline to the box.
   */
  final float TEXT_SIZE_FACTOR = 0.45;

  fill(colour);
  rect(left, top, wide, high);
  fill(#9595A3); //Light grey text
  float textHeight = high * TEXT_SIZE_FACTOR;
  textSize(textHeight);
  float textLeft = left + (wide / 2) - textWidth(textToDraw) / 2;
  float textBase = top + high / 2 + textHeight / 2;
  text(textToDraw, textLeft, textBase);
}
