from address_services.base_address_service import BaseAddressService
from smartystreets_python_sdk import StaticCredentials, exceptions, ClientBuilder
from smartystreets_python_sdk.us_street import Lookup as StreetLookup
from middleware import context


class SmartyAddressService(BaseAddressService):

    def __init__(self):
        pass

    @classmethod
    def get_api_keys(cls):
        smarty_info = context.get_smarty_info()

        auth_id = smarty_info["auth_id"]
        auth_token = smarty_info["auth_token"]

        return auth_id, auth_token

    @classmethod
    def get_credentials(cls):
        auth_id, auth_token = cls.get_api_keys()
        credentials = StaticCredentials(auth_id, auth_token)
        return credentials

    @classmethod
    def verify_address(cls, address_dto):
        creds = cls.get_credentials()
        client = ClientBuilder(creds).with_licenses(["us-core-cloud"]).build_us_street_api_client()

        lookup = StreetLookup()

        lookup.street = address_dto.get_street()
        lookup.street2 = address_dto.get_street2()
        lookup.state = address_dto.get_state()
        lookup.city = address_dto.get_city()
        lookup.zipcode = address_dto.get_zipcode()
        lookup.candidates = 3
        lookup.match = "strict"

        try:
            client.send_lookup(lookup)
        except exceptions.SmartyException as err:
            print(err)
            return

        result = lookup.result
        # first_candidate = result[0]
        #
        # print("Address is valid. (There is at least one candidate)\n")
        # print("ZIP Code: " + first_candidate.components.zipcode)
        # print("County: " + first_candidate.metadata.county_name)

        if not result:
            return False
        else:
            return True
