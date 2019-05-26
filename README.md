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

### Postman
- use `Postman` app to interact with the api.
  - You can use this collection: `https://www.getpostman.com/collections/e615e6910ae51e6dc92c`

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

### Rake Tasks

- `rake create_demo_data`
  - this rake task will generate and puts in the console: 
    - User with email and password
    - '3' newly created port records
    - Base64 encoded string of a small test csv file.

- `rake convert_csv_to_base64'[/path/to/file]'`
  - this rake task is for converting any csv file into base64 string.
  - it will put out a base64 string of the file in console.

### Used Gems:
* [RSpec](https://relishapp.com/rspec)
* [Faker](https://github.com/stympy/faker)
* [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [FactoryBot](https://github.com/thoughtbot/factory_bot)
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)
* [Awesone Print](https://github.com/awesome-print/awesome_print)
* [Mutations](https://github.com/cypriss/mutations)
* [SimpleCov](https://github.com/colszowka/simplecov/)
* [Kaminari](https://github.com/kaminari/kaminari)
* [FastJSON:API](https://github.com/Netflix/fast_jsonapi)
* [Ransack](https://github.com/activerecord-hackery/ransack)