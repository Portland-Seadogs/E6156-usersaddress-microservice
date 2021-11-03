from abc import ABC, abstractmethod


class AddressDataTransferObject:

    def __init__(self):
        self.street = None  # "1600 Amphitheatre Pkwy"
        self.street2 = None  # "Closet under the stairs"
        self.city = None
        self.state = None
        self.zipcode = None

    def load(self, info):
        self.street = info["street"]
        self.street2 = info["street2"]
        self.city = info["city"]
        self.state = info["state"]
        self.zipcode = info["zipcode"]

    def get_street(self):
        return self.street

    def get_street2(self):
        return self.street2

    def get_city(self):
        return self.city

    def get_state(self):
        return self.state

    def get_zipcode(self):
        return self.zipcode


class BaseAddressService(ABC):

    def __init__(self):
        pass

    @classmethod
    @abstractmethod
    def verify_address(cls, address_dto):
        pass
