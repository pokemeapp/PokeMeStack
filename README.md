# PokeMeStack

## Installation

```bash
docker-compose up -d
```

After docker containers are running, you have to clone the server to the app directory.
```bash
git clone git@github.com:pokemeapp/PokeMeServer.git app
```

You have the server inside the app container now. 

Now, install the composer dependencies and generate a key for Laravel.
I made two executable files for that job, so zou don't have to exec into the container.

* pma - equivalent to php artisan inside the container.
* pmc - equivalent to composer inside the container.

```bash
cp pma /usr/bin/pma
cp pmc /usr/bin/pmc
```

On Mac:
```bash
cp pma /usr/local/bin/pma
cp pmc /usr/local/bin/pmc
```

Now, you can execute the following commands:
```bash
pmc install
```
```bash
pma key:generate
```

If everything works fine, the server will available on `localhost:8080`.



## Addresses
* MySQL address: `3307`
* Redis address: `6379`
* FakeSMTP address: `8025`

## Managers
* Redis Commander: `http://localhost:8081`
* Mongo cLient: `http://localhost:8082`

## Server
`http://localhost:8080`
