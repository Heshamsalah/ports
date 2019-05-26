# Ports
[![CircleCI](https://circleci.com/gh/Heshamsalah/ports/tree/master.svg?style=svg)](https://circleci.com/gh/Heshamsalah/ports/tree/master)

An API which allows you to manage ports with CRUD operations and also you can
create batch ports at once from a CSV file

* There is an issue with circle ci config right now [To be fixed]

### Setting up the project
- clone the repo: `git clone git@github.com:Heshamsalah/ports.git`
- `$ cd ports`
- `$ bundle install`
- `$ rails db:create`
- `$ rails db:migrate`
- `$ rails s`
- use `Postman` app to interact with the api. You can use this collection: `https://www.getpostman.com/collections/e615e6910ae51e6dc92c`

### Steps and App Usage Explaination
- To perform actions in this application you need to be an authorized user
- First you need to login through `/login`:
  - Request:
    ```
    curl -d '{"email": "user@example.com", "password": "123456789"}' \
         -H 'Content-Type: application/json' http://localhost:3000/login
    ```
  - Response
    ```
    {
      "token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiZXhwIjoxNTU4OTMyOTExfQ.OWVJmUYFgU0uen_Apjhpp5eA6qXC0qo7dXWWZS3lHLE",
      "exp":"05-27-2019 06:55"
    }
    ```
- If you don't have an account you may register `/signup`:
  - Request:
    ```
    curl -d '{"email": "user@example.com", "password": "123456789", "password_confirmation": "123456789"}' \
         -H 'Content-Type: application/json' http://localhost:3000/signup
    ```
  - Response:
    ```
    {
      "token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiZXhwIjoxNTU4OTMyODEwfQ.IrlCt_ytyXM9ZBPbKK_1AOt2Uer2s3dTM2g5BODw3sA",
      "exp":"05-27-2019 06:53"
    }
    ```
- Then you need to copy the token that came back with the response and add it to any coming request.

- You can get list of all ports through: `/ports`
  - Request:
    ```
    curl -X GET -d '{"page": 1, "per": 20}' \
        -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiZXhwIjoxNTU4OTMyODEwfQ.IrlCt_ytyXM9ZBPbKK_1AOt2Uer2s3dTM2g5BODw3sA" \
        http://localhost:3000/ports
    ```

- To create multiple ports from CSV file you should provide `csv_string` in the `json body` with a `base64 encoded csv string`:
  - Request:
    ```
    curl -d '{ "csv_string": <base64 encoded csv file string>}' \ 
        -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTg5MjgxMTF9.YjhAAVEnnwWg2Wgldhgq0xabH1H5zOQZfNa_HkT3CxI" \ 
      http://localhost:3000/ports/batch_create_csv
    ```

- You can perform the rest of the CRUD Operations in the same way.
- You can provide search params to the `index` action to search by any of the `port`'s fields.

### Running Tests
- Run tests using: `$ rspec`