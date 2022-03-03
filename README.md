## Dependencies

* Ruby 3.1.1

## Apps info
 * Rails app runs in port 4567 (using this default config)

## Local Development
## Docker install

1. Install dependencies
```
https://www.docker.com/products/docker-desktop
```

2. Clone repository
3. cd into repository folder

4. Create env files for rails (replace variables with credentials and server variables)
```
cp .env.example .env
```

5. Run
```
docker-compose up
```

6. Rails debug
```
docker exec -it $( docker ps | grep d2d-challenge | awk "{print \$1}" | head -n 1 ) rails c
```

## Full install

1. Install dependencies
```
brew install node
\curl -sSL https://get.rvm.io | bash
rvm install "ruby-3.1.0"
rvm use 3.1.0
brew install postgresql
```

2. Clone repository
3. cd into repository folder

4. Run in command line next:

```
gem install bundler && bundle config jobs 7
```

5. Create env files for rails and react (replace variables with credentials and server variables)
```
cp .env.example .env
```

6. Replace file with credentials of local postgres db(in development section)
```
database.yml
```

7. Run in command line next:
```
bundle install
```

8. Setup db:
```
rails db:create
rails db:migrate
```


9. run backend (on aterminal window)
```
rails server --binding 0.0.0.0 --port 4567
```

```

10. Request examples

```
curl -H 'Content-Type: application/json'  --request POST  --data '{"vehicle": {"id":"xyz"}}' http://localhost:4567/vehicles
curl -H 'Content-Type: application/json'  --request POST  --data '{"location":{"lat": 10.0, "lng": 20.0, "at": "2019-09-01T12:00:00Z" }}' http://localhost:4567/vehicles/xyz/locations

```