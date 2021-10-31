"""
Google Authentication Class to help with authentication of
the submitted Oauth token.
"""
import requests
from flask import g


class Security:
    def __init__(self) -> None:
        pass

    def verify_token(incoming_request):
        """
        The implementation of verification of token; separated from the method
        above for ease in testing.
        """
        if 'Authorization' not in incoming_request.headers:
            return {'message': 'Request denied access',
                    'reason': 'Authorization header missing. Please provide an '
                              'OAuth2 Token with your request'}, 400

        auth_header = incoming_request.headers.get('Authorization')
        if 'Bearer ' not in auth_header:
            return {'message': 'Request denied access',
                    'reason': "Malformed authorization header provided. Please make sure to "
                              "specify the header prefix correctly as 'Bearer ' and try again."}, 400

        # validate the token with Google
        access_token = auth_header.split("Bearer ")[1]

        is_valid, validation = is_valid_token(access_token)
        if not is_valid:
            return {'message': 'Request denied access',
                    'reason': f'Google rejected oauth2 token: {validation["error_description"]}'}, 401

        g.access_token = access_token

        # unless this is a registration attempt, find the user associated with access token
        if incoming_request.endpoint != 'registration':
            user = User.find_by_g_id(validation['user_id'])
            if not user:
                return {'message': 'Request denied access',
                        'reason': 'User is not yet registered with this application; please '
                                  'register before proceeding'}, 401

            # save this user for the rest of the request processing
            g.user = user
        return None  # hurray no issues!

    def is_valid_token(token):
        """
        Takes a token, determines if it is valid and returns the validation resulting
        from the Google Auth API. Determines if the token is valid so that calling function
        does not need to do any additional checks to know the result, but can use the
        error description from the validation provided.
        """
        google_auth = GoogleAuth()
        validation = google_auth.validate_token(token)
        if 'error' in validation.keys():
            return False, validation
        return True, validation
