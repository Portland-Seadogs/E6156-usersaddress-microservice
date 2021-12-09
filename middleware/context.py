import os
import pymysql


def get_db_info():
    """
    :return: A dictionary with connect info for MySQL
    """
    db_host = os.environ.get("DBHOST", None)
    db_user = os.environ.get("DBUSER", None)
    db_password = os.environ.get("DBPASSWORD", None)

    if any(value is None for value in [db_host, db_user, db_password]):
        print(
            "Please ensure DBHOST, DBUSER, and DBPASSWORD environmental variables are set"
        )
        exit(1)

    return {
        "host": db_host,
        "user": db_user,
        "password": db_password,
        "cursorclass": pymysql.cursors.DictCursor,
    }


def get_smarty_info():
    """
    :return: A dictionary with connect info for MySQL
    """
    auth_id = os.environ.get("SMARTYID", None)
    auth_token = os.environ.get("SMARTYTOKEN", None)

    if any(value is None for value in [auth_id, auth_token]):
        print("Please ensure SMARTYID, SMARTYTOKEN environmental variables are set")
        exit(1)

    return {"auth_id": auth_id, "auth_token": auth_token}
