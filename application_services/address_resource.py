from application_services.base_application_resource import BaseApplicationResource
from database_services.rdb_service import RDBService as d_service


class AddressResource(BaseApplicationResource):

    db_schema = "UsersAddresses"
    table_name = "address"

    def __init__(self):
        super().__init__()

    @classmethod
    def get_links(cls, resource_data):
        for r in resource_data:
            address_id = r.get('ID')
            links = []
            self_link = {"rel": "self", "href": "/address/" + str(address_id)}
            links.append(self_link)

            if address_id is not None:
                address_link = {"rel": "users", "href": "/users?addressID=" + str(address_id)}
                links.append(address_link)

            r["links"] = links
        return resource_data

    @classmethod
    def get_all_addresses(cls):
        records = d_service.fetch_all_records(
            cls.db_schema, cls.table_name)
        return cls.get_links(records)

    @classmethod
    def get_address_record(cls, address_id):
        records = d_service.find_by_template(
            cls.db_schema, cls.table_name, {"addressID": address_id}
        )
        return cls.get_links(records)

    @classmethod
    def add_new_address(cls, address_information):
        new_record_id = d_service.create_new_record(
            cls.db_schema, cls.table_name, **address_information
        )
        return {"addressID": new_record_id}

    @classmethod
    def update_address(cls, address_id, updated_information):
        return d_service.update_record(
            cls.db_schema, cls.table_name, "address_id", address_id, **updated_information
        )

    @classmethod
    def delete_address(cls, address_id):
        return d_service.delete_record_by_key(
            cls.db_schema, cls.table_name, "address_id", address_id
        )
