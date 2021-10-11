#! /bin/bash

# setup environment parameters
export DBHOST='database-2.clbmc2tqyqce.us-east-2.rds.amazonaws.com'
export DBUSER='admin'
export DBPASSWORD='seadogs!'

# ready to run actual app
flask run
