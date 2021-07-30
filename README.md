# Volunteer Tracker

#### By Kristen Hopper

## Technologies Used

* _Ruby_
* _Docker_
* _RSpec_
* _pry_
* _Sinatra_
* _Capybara_
* _SQL_

## Description

This website was designed to track a non-profit's charity project and the volunteers working on each project.. It demonstrates the use of routing and databases using Sinatra and SQL with Ruby. 

## Setup/Installation Requirements

To use this project, you will first need to install [Docker](https://docs.docker.com/get-docker/). Once it is installed, run `docker pull ruby:2.6.5` in the terminal to pull and install the correct image of Ruby on your machine.

You can now clone the project by running `git clone https://github.com/krishops/volunteer_tracker_3` in the terminal.

Within the root directory of the project, run `docker-compose up` in the terminal to build the project. The build will return an error since the database is not yet attached. 

In a new terminal run `$docker ps` to get the container ID and then run :
```
docker exec -i [CONTAINER_ID] psql --username postgres volunteer_database < database_backup.sql
```
replacing `[CONTAINER ID]` with the ID associated with your project. This will link the volunteer_tracker database with the project.

## Project Testing

Within the root directory, run the command `docker-compose run --rm web bundle exec rspec` to run the rspec tests of the project.
Testing should output:
**26 examples, 0 failures**  

## Known Bugs

Restoring the database fails.

## License

[MIT](https://opensource.org/licenses/MIT)

Copyright (c) Kristen Hopper

## Contact Information

hopperdavis@gmail.com