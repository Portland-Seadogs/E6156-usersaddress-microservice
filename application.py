from flask import Flask, Response, request, redirect, url_for
from flask_cors import CORS
from application_services.users_resource import UsersResource
from application_services.address_resource import AddressResource
from middleware.security.security import Security
# from flask_dance.contrib.google import make_google_blueprint
from middleware.service_factory import ServiceFactory
from address_services.base_address_service import AddressDataTransferObject
import json
import logging
from flask import g

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger()

application = app = Flask(__name__)
CORS(app)

# app.secret_key = "supersekrit"
# blueprint = make_google_blueprint(
#    client_id="945712068833-q1d78dtar0s7urc051m3v4un0k6i8mgl.apps.googleusercontent.com",
#    client_secret="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",
#    scope=["profile", "email"],
#)

# app.register_blueprint(blueprint, url_prefix="/login")


@app.route("/")
def health_check():
    # if not google.authorized:
    #    return redirect(url_for("google.login"))
    # resp = google.get("/plus/v1/people/me")
    # assert resp.ok, resp.text
    # resp = google.get("/oauth2/v1/userinfo")
    # assert resp.ok, resp.text
    # return "You are {email} on Google".format(email=resp.json()["emails"][0]["value"])
    # return "You are {email} on Google".format(email=resp.json()["email"])
    return "Hello World"


@app.route("/api/users", methods=["GET"])
def get_all_users():
    template = {}
    if request.args.get("addressID"):
        template["addressID"] = request.args.get("addressID")
    if request.args.get("googleID"):
        template["googleID"] = request.args.get("googleID")

    if template:
        res = UsersResource.retrieve_records_by_template(template)
    else:
        res = UsersResource.retrieve_all_records()
    rsp = Response(json.dumps(res), status=200, content_type="application/json")
    return rsp


@app.route("/api/users", methods=["POST"])
def create_new_user():
    # TODO: add error checking
    new_user_info = request.json
    new_user_info.update({"googleID": g.google_user_id})
    res = UsersResource.add_new_user(new_user_info)
    rsp = Response(json.dumps(res), status=200, content_type="application/json")
    return rsp


@app.route("/api/users/<id>", methods=["GET", "PUT", "DELETE"])
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
                json.dumps(fields_to_update),
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


@app.route("/api/users/<user_id>/address", methods=["GET", "POST"])
def get_user_address(user_id):
    if request.method == "GET":
        addressID = UsersResource.retrieve_addressid_for_userid(user_id)
        res = AddressResource.get_address_record(addressID)
        rsp = Response(json.dumps(res), status=200, content_type="application/json")
        return rsp
    if request.method == "POST":
        # TODO: implement...not sure what post should do here
        pass


@app.route("/api/address", methods=["GET", "POST"])
def address_collection():
    if request.method == "GET":
        res = AddressResource.get_all_addresses()
        rsp = Response(json.dumps(res), status=200, content_type="application/json")
        return rsp

    if request.method == "POST":
        new_address_info = request.json
        address_service = ServiceFactory.get_address_service()
        dto = AddressDataTransferObject()
        dto.load(request.json)
        valid_address = address_service.verify_address(dto)
        if not valid_address:
            rsp = Response(
                json.dumps({"status": "error: invalid address"}),
                status=400,
                content_type="application/json",
            )
            return rsp

        res = AddressResource.add_new_address(new_address_info)
        rsp = Response(json.dumps(res), status=200, content_type="application/json")
        return rsp


@app.route("/api/address/<id>", methods=["GET", "PUT", "DELETE"])
def specific_address(id):
    if request.method == "GET":
        res = AddressResource.get_address_record(id)
        rsp = Response(json.dumps(res), status=200, content_type="application/json")
        return rsp

    # TODO: verify addresses with PUT...
    if request.method == "PUT":
        fields_to_update = request.get_json()
        res = AddressResource.update_address(id, fields_to_update)

        if res == 1:
            fields_to_update.update({"id": id, "status": "updated"})
            rsp = Response(
                json.dumps(fields_to_update),
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

    if request.method == "DELETE":
        res = AddressResource.delete_address(id)
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


@app.route("/api/address/<address_id>/users", methods=["GET"])
def get_address_users(address_id):
    res = UsersResource.retrieve_filtered_records_by_address(address_id)
    rsp = Response(json.dumps(res), status=200, content_type="application/json")
    return rsp


@app.before_request
def verify_oauth_token():
    """
    Method to run before all requests; determines if a user has a valid
    Google OAuth2 token and uses the token to discover who the user making the request is.
    The user is then loaded in from the database and stored in a special flask object called 'g'.
    While g is not appropriate for storing data across requests, it provides a global namespace
    for holding any data you want during a single backend context.
    """
    return Security.verify_token(request)


if __name__ == "__main__":
    application.run(host="0.0.0.0", port=8888)
