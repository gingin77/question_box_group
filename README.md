
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

  this will reply with a JSON object including token string like this:
    {
        "token": "cXMxkkDd3kboM4sYDFxEqxbM"
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

#UPDATE EXISTING USER'S INFORMATION
  Submit a PATCH request
  /users/:id
  With an "Authorization" field in the header whose value is:

    Token token=<token string>

  The <token string> must be the same as the user's login token.
  It should not have quotes around it.

  The JSON body should have any attributes that you want to modify, including:
    {
      "username" :   ____,
      "email" :   ____,
      "password" :   ____
    }

  It will reply with the JSON body of the updated user information.

  Attempts to modify someone else's information will result in a 401
  error message.

#GET A QUESTION
  Submit a GET request
  /posts/:id

  It will reply with the JSON body of the question whose id is :id.

#SEE ALL QUESTIONS
  Submit a GET request
  /posts/

  It will reply with the JSON body of all questions.

#POST A QUESTION
  Submit a POST request
  /posts/
  With an "Authorization" field in the header whose value is:

    Token token=<token string>

  The <token string> must be the same as the user's login token.
  It should not have quotes around it.

  The JSON body should look like this:
    {
      "topic" :   "The topic/title/headline of the post" ,
      "body" :   "A fuller explanation of the question"
    }

  It will reply with the JSON body of the newly posted question.

#POST AN ANSWER
  Submit a POST request
  /posts/:post_id/answers/
  With an "Authorization" field in the header whose value is:

    Token token=<token string>

  It has to be a valid token. It should not have quotes around it.
  Any user can post an answer.

  The JSON body should look like this
    {
      "body" : "an example answer"
    }

  It will reply with the JSON body of the question with only the newly
  posted answer.

#DELETE EXISTING ANSWER
  Submit a DELETE request
  /posts/:post_id/answers/:id
  With an "Authorization" field in the header whose value is:

    Token token=<token string>

  The <token string> must be the same as the answer asker's login token.
  It should not have quotes around it.

*BUGS*
#USERS CAN FRAUDULENTLY UPDATE OTHER USERS' PROFILES
The PUT method works properly and will only allow a user to update their
own profile. However, if you use the PATCH method you can change anyone's
profiles just by being logged into the website.

*NOT YET IMPLEMENTED:*
#DELETE EXISTING USER
Submit a DELETE request
/users/:id
With an "Authorization" field in the header whose value is:

  Token token=<token string>

The <token string> must be the same as the user's login token.
It should not have quotes around it.
