# API Instructions

## Create New User

Submit POST request to
/users/

with a JSON body of:
```
{
	"user":{
	"username": "newguy",
	"email": "newguy@gmail.com",
	"password": "secret"
	}
}
```

  this will reply with a JSON object including token string like this:
`{ "token": "cXMxkkDd3kboM4sYDFxEqxbM"}`

## Login Existing User
Submit POST request to
/users/login

with a JSON body of:
```
{
	"email": "user@example.com",
	"password": "secret"
}
```

this will reply with a JSON object including token string like this:
`{ "token": "cXMxkkDd3kboM4sYDFxEqxbM"}`

## Update Existing User's Information
  Submit a PATCH request
  /users/:id
  With an "Authorization" field in the header whose value is:

`    Token token=<token string>`

  The <token string> must be the same as the user's login token.
  It should not have quotes around it.

  The JSON body should have any attributes that you want to modify, including:
```
{
	"username" :   ____,
	"email" :   ____,
	"password" :   ____
 }
```

  It will reply with the JSON body of the updated user information.

  Attempts to modify someone else's information will result in a 401
  error message.

## Get a Question
  Submit a GET request
  /posts/:id

  It will reply with the JSON body of the question whose id is :id.

## See All Questions
  Submit a GET request
  /posts/

  It will reply with the JSON body of all questions.

## Post a Question
  Submit a POST request
  /posts/
  With an "Authorization" field in the header whose value is:


`Token token=<token string>`


  The <token string> must be the same as the user's login token.
  It should not have quotes around it.

  The JSON body should look like this:
```
{
	"topic" :   "The topic/title/headline of the post" ,
	"body" :   "A fuller explanation of the question"
}
```

  It will reply with the JSON body of the newly posted question.

## Post an Answer
  Submit a POST request
  /posts/:post_id/answers/
  With an "Authorization" field in the header whose value is:

`Token token=<token string>`

  It has to be a valid token. It should not have quotes around it.
  Any user can post an answer.

  The JSON body should look like this
`{ "body" : "an example answer" }`

  It will reply with the JSON body of the question with only the newly
  posted answer.

## Delete Existing Answer
Submit a DELETE request
/posts/:post_id/answers/:id
With an "Authorization" field in the header whose value is:

`  Token token=<token string>`

The <token string> must be the same as the answer asker's login token.
It should not have quotes around it.

# *Bugs*
## Users Can Fraudulently Update Other User's Profiles
The PUT method works properly and will only allow a user to update their
own profile. However, if one uses the PATCH method they can change anyone's
profiles just by being logged into the website.

# *Note Yet Implemented:*
## Delete Existing User
Submit a DELETE request
/users/:id
With an "Authorization" field in the header whose value is:

`Token token=<token string>`

The <token string> must be the same as the user's login token.
It should not have quotes around it.
