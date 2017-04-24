# README

### CwtChat
This is a small chat interface with the main goal of having some fun with your friends, the interface is really minimalistic because it was developed under the principle to avoid using external libraries or gems as much as possible.

* Ruby version

Ruby v-2.3.3 - Rails v-5.0.2

* System dependencies

Postgresql v-9.5

* Database creation

The app needs that you previously create a role called cwchat using the following sentence on your postgresql client:

```sql
  create role cwtchat with password='cwtchat' login createdb;
```

* Database initialization

```sh
$ rails db:create && rails db:migrate && rails db:seed
```
The app only works with registered users, you can see the full-list of allowed users in seed.rb file (ecratum[1..4]) and there is only one room for chating. After users completes login input with their username and select a dialect, they are redirected to the main room.

* How to run the test suite

```sh
$ rspec
```

* Services

The entire application uses [FunTranslations API](http://funtranslations.com/api) in order to translate to vernacular languages the messages (supporting: Yoda, Klingon and Minion), but there is a limit of translations per hour for public users (5), so for the sake of keep the application functional if the user reach this limit then it starts to send raw messages (without translations) to the connected users.

* Deployment instructions

All you have to do is:
* Check app requirements (ruby version, postgresql, etc), install those who are missing.
* Clone the repo
* Create a database role cwtchat with password cwtchat.
* Run from command line the Database initialization commands.
* Run in console:

```sh
$ rails server -b 0.0.0.0
```

* Open your browser and go to http://localhost:3000


* Known Issues

- You need to Logout using the provided link "Leave" in order to be able to open a new session using the same username, closing the browser keep the user active.
