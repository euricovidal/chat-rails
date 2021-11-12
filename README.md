# Chat test with ActionCable

![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) ![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)


This projects is mainly focused on chat message to show the simple example using actioncable

<hr>

[![Generic badge](https://img.shields.io/badge/Specs--blue.svg)](https://shields.io/)

- DockerCompose: 3
- Ruby: 3.0.2
- Rails: 6.1.4.1
- Postgresql: 13.4

<hr>


[![Generic badge](https://img.shields.io/badge/Install--blue.svg)](https://shields.io/)
<details>
  <summary>
   more...
  </summary>

Clone

```
git clone https://github.com/euricovidal/chat-rails
```

Run:
```
bin/setup
```
</details>
<hr>


[![Generic badge](https://img.shields.io/badge/Usage--green.svg)](https://shields.io/)
<details>
  <summary>
   more...
  </summary>

We have the three listeners to analyze the events


Ruby _(using websocket-eventmachine-client)_:
```
docker-compose exec web ruby teste.rb
```

NodeJS:
```
docker-compose exec web nodejs teste.js
```

HTML _(browser)_:
```
open teste.html
```
</details>
<hr>


