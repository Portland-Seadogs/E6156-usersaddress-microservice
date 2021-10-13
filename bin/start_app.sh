#! /bin/bash

# setup environment parameters
export DBHOST=localhost
export DBUSER=
export DBPASSWORD=
export FLASK_APP='application.py'

# ready to run actual app
flask run
