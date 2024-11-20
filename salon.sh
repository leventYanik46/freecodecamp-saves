#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

# Function to display services
DISPLAY_SERVICES() {
  echo -e "Here are the services we offer:"
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME; do
    echo "$SERVICE_ID) $NAME"
  done
}

# Main menu function
MAIN_MENU() {
  echo -e "\nWelcome to My Salon. How can I help you today?\n"
  DISPLAY_SERVICES

  # Prompt for service selection
  echo -e "\nPlease enter the service ID you'd like:"
  read SERVICE_ID_SELECTED

  # Validate service selection
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]; then
    echo -e "\nI could not find that service. Please select from the list below:"
    MAIN_MENU
  else
    # Prompt for customer phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # Check if customer exists
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]; then
      # If customer doesn't exist, prompt for name
      echo -e "\nI don't have a record for that phone number. What's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi

    # Retrieve customer ID
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # Prompt for appointment time
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # Insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    # Confirm appointment
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]; then
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      echo -e "\nThere was an error scheduling your appointment. Please try again."
    fi
  fi
}

# Start the program
MAIN_MENU
