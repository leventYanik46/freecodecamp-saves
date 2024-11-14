#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "TRUNCATE teams, games"
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip the header line
  if [[ $YEAR = "year" ]]; then
    continue
  fi

  # Check and insert OPPONENT team if it doesn't exist
  TEAM_NAME_OPPONENT=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
  if [[ -z $TEAM_NAME_OPPONENT ]]; then
    $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')"
    echo "Inserted opponent team: $OPPONENT"
  fi

  # Check and insert WINNER team if it doesn't exist
  TEAM_NAME_WINNER=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
  if [[ -z $TEAM_NAME_WINNER ]]; then
    $PSQL "INSERT INTO teams(name) VALUES('$WINNER')"
    echo "Inserted team: $WINNER"
  fi
  #get the values to be inserted into the games table
  #get winner-id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  #insert the values into games table
   $PSQL "INSERT INTO games(year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES($YEAR,'$WINNER_ID', '$OPPONENT_ID', $WINNER_GOALS, $OPPONENT_GOALS, '$ROUND')"
done