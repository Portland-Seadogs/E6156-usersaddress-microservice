#! /bin/bash

# setup environment parameters
export DBHOST=localhost
export DBUSER=root
export DBPASSWORD=root
export FLASK_APP='application.py'

# ready to run actual app
flask run
