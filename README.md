application 
curl -d '{"name":"application1"}' -H "Content-Type: application/json" -X POST http://localhost:3000/applications




# README

# Chat System API

This is Chat system API to create multiple applications with multiple chats.


Endpoints : 

| route | Description | HTTP Verb
| --- | --- | ---
| `/applications/` | List all *applications*  | GET 
| `/applications/` | CREATE new application  | POST
| `/applications/:id` | update an application  | UPDATE
| `/chats/` | CREATE a new chat with application token in header| POST
| `/messages/` | CREATE a new message in specific chat number with application token in header| POST
| `/messages/search/:chat_number?word=??` | search in messages of specific chat | GET

- you can test the api endpoist with Postman : 

#  create application

* request : 
```
POST http://localhost:3000/applications
`````

* playload : 

```
{"name":"application1"}
```

* headers  : 

```
"Content-Type: application/json"

`````
* response : 
````
{ auth_token : [the token of created application] }
``````

# create chat in specific application 

* request : 
```
POST http://localhost:3000/chats
```

* playload : 

```
{"name":"first chat"}
````

* headers  : 

```
Content-Type: application/json
Authorization: [application token]
`````
* response : 
````
{ chat_number : 1 }
``````

# create message in specific chat 
* request : 
```
POST http://localhost:3000/messages
```

* playload : 

```
{"body":"this is a new message for you!",
 "chat_number":1
}

````

* headers  : 

```
Content-Type: application/json
Authorization: [application token]
`````

* response : 
```
{ message_number : 1 }
```


# </a> search in messages of specific chat 
* request : 
```
GET http://localhost:3000/messages/search/1?word=new
```

* headers  : 

```
Authorization: [application token]
`````
* response : messages thier body containts that work
