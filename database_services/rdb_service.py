import pymysql
import json
import logging

import middleware.context as context

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger()
logger.setLevel(logging.INFO)


def _get_db_connection():

    db_connect_info = context.get_db_info()
    logger.info("rdb_service._get_db_connection:")
    logger.info("\t host = " + db_connect_info["host"])

    db_info = context.get_db_info()
    db_connection = pymysql.connect(**db_info)
    return db_connection


def fetch_all_records(db_schema, table_name):
    conn = _get_db_connection()
    cur = conn.cursor()

    sql = (
        "SELECT * FROM "
        + db_schema
        + "."
        + table_name
    )
    print("sql statement = " + cur.mogrify(sql, None))

    res = cur.execute(sql)
    res = cur.fetchall()
    conn.close()
    return res


def get_by_prefix(db_schema, table_name, column_name, value_prefix):
    conn = _get_db_connection()
    cur = conn.cursor()

    sql = (
        "SELECT * FROM "
        + db_schema
        + "."
        + table_name
        + " WHERE "
        + column_name
        + " LIKE "
        + "'"
        + value_prefix
        + "%'"
    )
    print("SQL Statement = " + cur.mogrify(sql, None))

    res = cur.execute(sql)
    res = cur.fetchall()
    conn.close()
    return res


def _get_where_clause_args(template):

    terms = []
    args = []
    clause = None

    if template is None or template == {}:
        clause = ""
        args = None
    else:
        for k, v in template.items():
            terms.append(k + "=%s")
            args.append(v)

        clause = " WHERE " + " AND ".join(terms)

    return clause, args


def find_by_template(db_schema, table_name, template, field_list):

    where_clause, args = _get_where_clause_args(template)

    conn = _get_db_connection()
    cur = conn.cursor()

    sql = "SELECT * FROM " + db_schema + "." + table_name + " " + where_clause
    res = cur.execute(sql, args=args)
    res = cur.fetchall()

    conn.close()
    return res
