from database_services.rdb_service import RDBService


class UserRDBService(RDBService):

    def __init__(self):
        pass

    @classmethod
    def get_address_by_one_user(cls, user_id):
        addressquery = "select addressID from usersaddresses.users where users.ID =" + user_id




        # wc, args = RDBService._get_where_clause_args(template)
        # sql = "select address.* from  usersaddresses.users join usersaddresses.address on " + \
        #         "users.addressID = address.ID"
        # res = RDBService._execute_db_commit_query(sql, args)
        # return res


    # def get_user_and_address(cls, template):
    #
    #     wc, args = RDBService._get_where_clause_args(template)
    #     sql = "select * from usersaddresses.users left join usersaddresses.address on " + \
    #             "users.addressID = address.ID"
    #
    #     res = RDBService._execute_db_commit_query(sql, args)
    #     return res



