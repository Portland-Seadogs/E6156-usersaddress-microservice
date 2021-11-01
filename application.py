from flask import Flask, Response, request, redirect, url_for
from flask_cors import CORS
from application_services.users_resource import UsersResource
from application_services.address_resource import AddressResource
from middleware.Security.security import Security
from flask_dance.contrib.google import make_google_blueprint, google
import json
import logging

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger()

application = app = Flask(__name__)
CORS(app)

app.secret_key = "supersekrit"
blueprint = make_google_blueprint(
    client_id="945712068833-q1d78dtar0s7urc051m3v4un0k6i8mgl.apps.googleusercontent.com",
    client_secret="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",
    scope=["profile", "email"]
)

app.register_blueprint(blueprint, url_prefix="/login")


@app.route("/")
def index():
    if not google.authorized:
        return redirect(url_for("google.login"))
    # resp = google.get("/plus/v1/people/me")
    # assert resp.ok, resp.text
    resp = google.get("/oauth2/v1/userinfo")
    assert resp.ok, resp.text
    # return "You are {email} on Google".format(email=resp.json()["emails"][0]["value"])
    return "You are {email} on Google".format(email=resp.json()["email"])


@app.route("/users", methods=["GET", "POST"])
def get_all_users():
    if request.method == "GET":
        address_id = request.args.get("addressID")
        # TODO : make query parameter filtering more general?
        if address_id:
            res = UsersResource.retrieve_filtered_records_by_address(
                address_id)
        else:
            res = UsersResource.retrieve_all_records()
        rsp = Response(json.dumps(res), status=200,
                       content_type="application/json")
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
        rsp = Response(json.dumps(res), status=200,
                       content_type="application/json")
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


@app.route('/users/<user_id>/address', methods=['GET', 'POST'])
def get_user_address(user_id):
    if request.method == 'GET':
        addressID = UsersResource.retrieve_addressid_for_userid(user_id)
        res = AddressResource.get_address_record(addressID)
        rsp = Response(json.dumps(res), status=200,
                       content_type="application/json")
        return rsp
    if request.method == "POST":
        # TODO: implement...not sure what post should do here
        pass


@app.route('/address', methods=['GET', 'POST'])
def address_collection():
    if request.method == "GET":
        res = AddressResource.get_all_addresses()
        rsp = Response(json.dumps(res), status=200,
                       content_type="application/json")
        return rsp

    if request.method == "POST":
        # TODO: add error checking
        # TODO: ID should automatically update and return correct value
        new_address_info = request.json
        res = AddressResource.add_new_address(new_address_info)
        rsp = Response(
            json.dumps(res), status=200, content_type="application/json"
        )
        return rsp


@app.route('/address/<id>', methods=['GET', 'PUT', 'DELETE'])
def specific_address(id):
    if request.method == "GET":
        res = AddressResource.get_address_record(id)
        rsp = Response(json.dumps(res), status=200,
                       content_type="application/json")
        return rsp

    if request.method == "PUT":
        fields_to_update = request.get_json()
        res = AddressResource.update_address(id, fields_to_update)

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


@app.route('/address/<address_id>/users', methods=['GET', 'POST'])
def get_address_users(address_id):
    if request.method == "GET":
        # gets all the users at address address_id
        res = UsersResource.retrieve_filtered_records_by_address(
            address_id)
        print(res)
        rsp = Response(json.dumps(res), status=200,
                       content_type="application/json")
        return rsp
    if request.method == "POST":
        # TODO: Implement this! not exactly sure what this would do
        pass


@app.before_request
def verify_oauth_token():
    """
    Method to run before all requests; determines if a user has a valid
    Google OAuth2 token and uses the token to discover who the user making the request is.
    The user is then loaded in from the database and stored in a special flask object called 'g'.
    While g is not appropriate for storing data across requests, it provides a global namespace
    for holding any data you want during a single backend context.
    """
    # print(request.endpoint)
    # routes = list(app.url_map.iter_rules())
    # print(list(routes))
    return Security.verify_token(request)


if __name__ == "__main__":
    application.run(host="0.0.0.0", port=5000)
