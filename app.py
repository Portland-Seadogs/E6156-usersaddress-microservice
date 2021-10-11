from flask import Flask, Response
from flask_cors import CORS
from application_services.art_catalog_resource import ArtCatalogResource
import json

import logging

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger()
logger.setLevel(logging.INFO)

app = Flask(__name__)
CORS(app)


@app.route("/")
def health_check():
    return "<u>Hello World</u>"


@app.route("/api/catalog")
def get_catalog():
    res = ArtCatalogResource.retrieve_all_records()
    rsp = Response(json.dumps(res), status=200, content_type="application/json")
    return rsp


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
