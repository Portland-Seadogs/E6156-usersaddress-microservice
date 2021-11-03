from address_services.base_address_service import AddressDataTransferObject
from smartystreets_python_sdk import StaticCredentials, exceptions, ClientBuilder
from smartystreets_python_sdk.us_street import Lookup as StreetLookup
from middleware.service_factory import ServiceFactory


def t1():
    info = {
        "street": "1745 T Street Southeast",
        "street2": "closet under the stairs",
        "city": "Washington",
        "state": "DC",
        "zipcode": "20020"
    }

    address_service = ServiceFactory.get_address_service()

    # get the request.json information into a DTO object
    dto = AddressDataTransferObject()
    dto.load(info)
    # print(dto.get_city())

    valid_address = address_service.verify_address(dto)

    print(valid_address)


t1()
