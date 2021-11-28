from application_services.base_application_resource import BaseApplicationResource
from database_services.rdb_service import RDBService as d_service


class UsersResource(BaseApplicationResource):
    db_schema = "UsersAddresses"
    table_name = "users"

    def __init__(self):
        super().__init__()

    @classmethod
    def get_links(cls, resource_data):
        for r in resource_data:
            address_id = r.get("addressID")
            user_id = r.get("ID")
            links = []
            self_link = {"rel": "self", "href": "/users/" + str(user_id)}
            links.append(self_link)

            if address_id is not None:
                address_link = {"rel": "address", "href": "/address/" + str(address_id)}
                links.append(address_link)

            r["links"] = links
        return resource_data

    @classmethod
    def retrieve_all_records(cls):
        records = d_service.fetch_all_records(cls.db_schema, cls.table_name)
        return cls.get_links(records)

    @classmethod
    def retrieve_single_record(cls, record_id):
        record = d_service.find_by_template(
            cls.db_schema, cls.table_name, {"id": record_id}
        )
        return cls.get_links(record)

    @classmethod
    def retrieve_records_by_template(cls, template):
        records = d_service.find_by_template(cls.db_schema, cls.table_name, template)
        return cls.get_links(records)

    @classmethod
    def add_new_user(cls, user_information):
        new_record_id = d_service.create_new_record(
            cls.db_schema, cls.table_name, **user_information
        )
        return {"id": new_record_id}

    @classmethod
    def update_user_by_id(cls, user_id, updated_information):
        return d_service.update_record(
            cls.db_schema, cls.table_name, "ID", user_id, **updated_information
        )

    @classmethod
    def delete_user_by_id(cls, record_id):
        return d_service.delete_record_by_key(
            cls.db_schema, cls.table_name, "ID", record_id
        )

    @classmethod
    def retrieve_addressid_for_userid(cls, user_id):
        record = cls.retrieve_single_record(user_id)
        print(record)
        print(type(record))
        return record[0]["addressID"]
