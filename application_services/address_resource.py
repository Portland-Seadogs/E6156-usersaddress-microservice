from application_services.BaseApplicationResource import BaseApplicationResource
from database_services.RDBService import RDBService


class AddressResource(BaseApplicationResource):

    db_name = "aaaaF21"
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
        return RDBService.find_by_template(
            cls.db_schema, cls.table_name, {"address_id": address_id}
        )

    @classmethod
    def delete_address(cls, address_id):
        return RDBService.delete_record_by_key(
            cls.db_schema, cls.table_name, "address_id", address_id
        )
