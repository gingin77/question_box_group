
#CREATE NEW USER
Submit POST request to
/users/

with a JSON body of:
  {
  "user":{
    "username": "newguy",
    "email": "newguy@gmail.com",
    "password": "secret"
    }
  }

it will respond with a JSON body like:
  {
      "user": {
          "id": 3,
          "email": "newguy@gmail.com",
          "username": "newguy"
      }
  }

#LOGIN EXISTING USER
Submit POST request to
/users/login

with a JSON body of:
  {
  	"email": "user@example.com",
  	"password": "secret"
  }

this will reply with a JSON object including token string like this:
  {
      "token": "cXMxkkDd3kboM4sYDFxEqxbM"
  }


*NOT YET IMPLEMENTED:*
#DELETE EXISTING USER
Submit a DELETE request
/users/:id
With an "Authorization" field in the header whose value is:

  Token token=<token string>

The <token string> must be the same as the user's login token.
It should not have quotes around it.
