from abc import ABC, abstractmethod


class BaseApplicationException(Exception):
    def __init__(self):
        pass


class BaseApplicationResource(ABC):
    def __init__(self):
        pass

    @classmethod
    @abstractmethod
    def get_links(cls, resource_data):
        pass
