from application_services.base_application_resource import BaseApplicationResource
from database_services.rdb_service import RDBService as d_service


class AddressResource(BaseApplicationResource):

    db_schema = "UsersAddresses"
    table_name = "addresses"

    def __init__(self):
        super().__init__()

    @classmethod
    def create(cls, new_address):
        pass

    @classmethod
    def get_links(self, resource_data):
        pass

    @classmethod
    def get_data_resource_info(self):
        return {"db_name": self}

    @classmethod
    def get_address_record(cls, address_id):
        return d_service.find_by_template(
            cls.db_schema, cls.table_name, {"address_id": address_id}
        )

    @classmethod
    def add_new_address(cls, address_information):
        new_record_id = d_service.create_new_record(
            cls.db_schema, cls.table_name, **address_information
        )
        return {"address_id": new_record_id}

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
