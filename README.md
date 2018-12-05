# FW - Airport Lounge Manager

## Description

Ruby code test for Future Workshops
 
## User Stories
General:
- As a **guest** i want to be able to signup
- As a **guest** i want to be able to login

Admin:
- As an **admin** I want to be able to create lounges
- As an **admin** I want to be able to edit lounges
- As an **admin** I want to be able to delete lounges
- As an **admin** I want to be able to create “extra” services for a lounge
- As an **admin** I want to be able to edit “extra” services for a lounge
- As an **admin** I want to be able to delete “extra” services for a lounge

Customer:
- As a **customer** I would like to see available lounges for today.
- As a **customer** I want to book a daily pass for when I will be flying from that airport
- As a **customer** I want to purchase extra services.

API:
- As an **mobile customer** I would like to view lounge availability for a given date.
- As an **mobile customer** I would like to book a lounge for a particular day.

## Backlog
Admin: 
- As a **admin** I want to see a dashboard with the live capacity of the Lounges
- As a **admin** I want to upload pictures for extra services

Customer: 
- As a **customer** I want to download a PDF with the confirmation of my booking
- As an **mobile customer** I would like to download a PDF with the confirmation of my booking in order to enter the lounge.

API:
- Create API documentation using Swagger
- Create an authentication system for the API 


## ROUTES:
```
GET /
POST /lounge/:id/booking
  Params: lounge_id
  Body: user, date, services

GET /auth/signup
POST auth/signup
  Body: username, password, role
GET /auth/login
POST /auth/login
  Body: username, password
POST auth/logout
  POST Body: nothing

GET /admin
GET /admin/lounges/create
POST /admin/lounges/create
GET /admin/lounges/:id/edit
POST /admin/lounges/:id/edit
POST /admin/lounges/:id/delete
GET /admin/lounges/:id/services/create
POST /admin/lounges/:id/services/create
GET /admin/lounges/:id/services/edit
POST /admin/lounges/:id/services/edit
POST /admin/lounges/:id/services/delete

GET /api/v1/lounges/availability?date=<date>
POST /api/v1/lounges/book
  POST Body: date

```

## MODELS

```
User
  - name: String
  - password: String
  - is_admin: Boolean (default: false)
```    
 
```
Lounge
  - name: String
  - price: String
  - description: String
  - is_legacy: Boolean (default: false)
  - capacity: Number
  - feed_id: number
```

```
Booking (join table)
  - owner: Id
  - lounge: Id
  - date: Date
  - is_with_metting_room: Boolean (default: false)
  - is_with_gim: Boolean (default: false)
  - is_with_spa: Boolean (default: false)
  - total_people: Number (default: 1)
```

## Links
[Trello](https://trello.com)
[Github](http://github.com)
[Deploy](http://heroku.com)