from application_services.base_application_resource import BaseApplicationResource
import database_services.rdb_service as d_service


class ArtCatalogResource(BaseApplicationResource):
    db_schema = "art_catalog"
    table_name = "products"

    def __init__(self):
        super().__init__()

    def get_links(self, resource_data):
        pass

    @classmethod
    def retrieve_all_records(cls):
        return d_service.fetch_all_records(cls.db_schema, cls.table_name)

    @classmethod
    def retrieve_single_record(cls, record_id):
        return d_service.find_by_template(
            cls.db_schema, cls.table_name, {"item_id": record_id}
        )

    @classmethod
    def add_new_product(cls, item_information):
        new_record_id = d_service.create_new_record(
            cls.db_schema, cls.table_name, **item_information
        )
        return {"item_id": new_record_id}

    @classmethod
    def update_item_by_id(cls, item_id, updated_information):
        return d_service.update_record(
            cls.db_schema, cls.table_name, "item_id", item_id, **updated_information
        )

    @classmethod
    def delete_item_by_id(cls, record_id):
        return d_service.delete_record_by_key(
            cls.db_schema, cls.table_name, "item_id", record_id
        )
