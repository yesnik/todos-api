# Rails API for todo list

## Installation

* Clone this repository

```
git clone ...
```

* Install dependencies

```
cd todos-api
bundle install
```

* Setup application

```
rails db:setup
```

## Usage

### Preparation

To call our api we can use different tools:

- browser
- curl
- httpie

For manual api testing we recommend to use `httpie` library:

```
sudo apt install httpie
```

### Examples of calling api

* Firstly we need to get auth token for our default user:

```
http :3000/auth/login email=kenny@mail.ru password=123
```

* Get many todo items:

```
http :3000/todos page==2 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbG... cTp8Hocsdc'
```

* Get info for todo with ID = 2:

```
http :3000/todos/2 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbG... cTp8Hocsdc'
```

* Create item for todo:

```
http POST :3000/todos/1/items name='Listen to music' Accept:'application/vnd.todos.v2+json' Authorization:'eyJhbG... cTp8Hocsdc'
```
