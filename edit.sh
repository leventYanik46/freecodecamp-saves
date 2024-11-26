#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Update type_id values in the properties table based on type
$PSQL "UPDATE properties SET type_id = 1 WHERE type = 'metal';"
$PSQL "UPDATE properties SET type_id = 2 WHERE type = 'metalloid';"
$PSQL "UPDATE properties SET type_id = 3 WHERE type = 'nonmetal';"

# Fetch all symbols and iterate through them
$PSQL "SELECT atomic_number, symbol FROM elements;" | while IFS="|" read -r ATOMIC_NUMBER SYMBOL; do
  # Capitalize the first letter of the symbol
  UPDATED_SYMBOL="$(echo "${SYMBOL:0:1}" | tr '[:lower:]' '[:upper:]')${SYMBOL:1}"
  
  # Update the database with the capitalized symbol
  $PSQL "UPDATE elements SET symbol = '$UPDATED_SYMBOL' WHERE atomic_number = $ATOMIC_NUMBER;"
  echo "Updated ATOMIC_NUMBER $ATOMIC_NUMBER: $SYMBOL -> $UPDATED_SYMBOL"
done