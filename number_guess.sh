#!/bin/bash
PSQL="psql -U freecodecamp -d guess_number -t --no-align -c"


# -GUESS FUNCTION. Start function, colect the name, count the tries
GUESS(){
  echo "Enter your username:"
  read USERNAME

  VERIFY=$($PSQL "SELECT username FROM guesses WHERE username = '$USERNAME'")

  # new username
  if [[ -z $VERIFY ]]
  then
    INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO guesses(username) VALUES('$USERNAME')")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  
  # old username
  else  
    BEST_GAME=$($PSQL "SELECT MAX(best_game) FROM guesses WHERE username = '$USERNAME'")
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM guesses WHERE username = '$USERNAME'")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
}

# Function number - main fuction
NUMBER(){
  echo "Guess the secret number between 1 and 1000:"
  read NUMBER
  NUMBER_OF_GUESSES=1

  # not a number 
  if [[ ! $NUMBER =~ ^[0-9]*$ ]]; then
    echo "That is not an integer, guess again:"

    # Return
    NUMBER

  else

    # loop to find the secret number
    while [[ $NUMBER != $SECRET_NUMBER ]]
    do

      # 
      if [[ $NUMBER > $SECRET_NUMBER ]] 
	then
        echo "It's lower than that, guess again:" 
        # read NUMBER
      # else
      # number is lower than the secret number
      elif [[ $NUMBER < $SECRET_NUMBER ]]; then
        echo "It's higher than that, guess again:" 
      fi
      read NUMBER

      # increse the number_of _guesses
      ((NUMBER_OF_GUESSES++))
    done

    # finally the right number
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    ((GAMES_PLAYED++))
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE guesses SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'")
    
    # new best_game
    if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES < $BEST_GAME ]]
	then
      UPDATE_BEST_GAMES=$($PSQL "UPDATE guesses SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
    fi
  fi
}

# secret number 1 to 1000
SECRET_NUMBER=$((1 + ($RANDOM % 1000) ))



# MAIN PROGRAM
GUESS
NUMBER


