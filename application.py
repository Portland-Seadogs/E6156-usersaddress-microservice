from flask import Flask, Response, request
from flask_cors import CORS
from application_services.users_resource import UsersResource
import json
import logging

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger()

application = app = Flask(__name__)
CORS(app)


@app.route("/")
def health_check():
    return "<u>Hello World</u>"


@app.route("/users", methods=["GET", "POST"])
def get_all_users():
    if request.method == "GET":
        address_id = request.args.get("addressID")
        # TODO : make query parameter filtering more general
        if address_id:
            res = UsersResource.retrieve_filtered_records_by_address(address_id)
        else:
            res = UsersResource.retrieve_all_records()
        rsp = Response(json.dumps(res), status=200, content_type="application/json")
        return rsp
    if request.method == "POST":
        # TODO: add error checking
        new_user_info = request.json
        res = UsersResource.add_new_user(new_user_info)
        rsp = Response(
            json.dumps(res), status=200, content_type="application/json"
        )
        return rsp


@app.route("/users/<id>", methods=["GET", "PUT", "DELETE"])
def get_user(id):
    if request.method == "GET":
        res = UsersResource.retrieve_single_record(id)
        rsp = Response(json.dumps(res), status=200, content_type="application/json")
        return rsp

    if request.method == "PUT":
        fields_to_update = request.get_json()
        res = UsersResource.update_user_by_id(id, fields_to_update)
        if res == 1:
            fields_to_update.update({"id": id, "status": "updated"})
            rsp = Response(
                json.dumps(fields_to_update), status=200, content_type="application/json"
            )
        else:
            rsp = Response(
                json.dumps({"id": id, "status": "error"}),
                status=500,
                content_type="application/json",
            )
        return rsp

    if request.method == "DELETE":
        res = UsersResource.delete_user_by_id(id)

        if res == 1:
            rsp = Response(
                json.dumps({"id": id, "status": "deleted"}),
                status=200,
                content_type="application/json",
            )
        else:
            rsp = Response(
                json.dumps({"id": id, "status": "error"}),
                status=500,
                content_type="application/json",
            )
        return rsp




@app.route("/users/<id>/address", methods=["GET", "POST"])
def address_by_user():
    res = ArtCatalogResource.add_new_product(request.get_json())
    rsp = Response(json.dumps(res), status=200, content_type="application/json")
    return rsp


@app.route("/api/catalog/<int:item_id>", methods=["POST"])
def update_catalog_item(item_id):
    fields_to_update = request.get_json()
    res = ArtCatalogResource.update_item_by_id(item_id, fields_to_update)

    if res == 1:
        fields_to_update.update({"item_id": item_id, "status": "updated"})
        rsp = Response(
            json.dumps(fields_to_update), status=200, content_type="application/json"
        )
    else:
        rsp = Response(
            json.dumps({"item_id": item_id, "status": "error"}),
            status=500,
            content_type="application/json",
        )
    return rsp


@app.route("/api/catalog/<int:item_id>", methods=["DELETE"])
def delete_catalog_item(item_id):
    res = ArtCatalogResource.delete_item_by_id(item_id)

    if res == 1:
        rsp = Response(
            json.dumps({"item_id": item_id, "status": "deleted"}),
            status=200,
            content_type="application/json",
        )
    else:
        rsp = Response(
            json.dumps({"item_id": item_id, "status": "error"}),
            status=500,
            content_type="application/json",
        )
    return rsp


if __name__ == "__main__":
    application.run(host="0.0.0.0", port=5000)
