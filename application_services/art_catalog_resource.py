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
    def get_by_name_prefix(cls, name_prefix):
        return d_service.get_by_prefix(
            cls.db_schema, cls.table_name, "", name_prefix
        )
