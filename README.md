RailsBootstrap
===============

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/Wolox/rails-bootstrap?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build Status]()](Link to CI badge)
[![Code Climate]()](Link to CodeClimate GPA badge)
[![Test Coverage]()](Link to CodeClimate Test coverage badge)
[![Error Tracking](https://d26gfdfi90p7cf.cloudfront.net/rollbar-badge.144534.o.png)](https://rollbar.com)



## Running local server

### Git pre push hook

You can modify the [pre-push.sh](script/pre-push.sh) script to run different scripts before you `git push` (e.g Rspec, Linters). Then you need to run the following:

  ```bash
    > chmod +x script/pre-push.sh
    > ln -s script/pre-push.sh .git/hooks/pre-push
  ```

You can skip the hook by adding `--no-verify` to your `git push`.

### Installing Ruby

- Download and install [Rbenv](https://github.com/sstephenson/rbenv).
- Download and install [Ruby-Build](https://github.com/sstephenson/ruby-build).
- Install the appropriate Ruby version by running `rbenv install [version]` where `version` is the one located in [.ruby-version](.ruby-version)

### Installing Rails gems

- Clone the repository.
- Install [Bundler](http://bundler.io/).
- Install all the gems included in the project.

  ```bash
    > git clone https://github.com/Wolox/rails-bootstrap.git
    > gem install bundler
    > rbenv rehash
    > bundle -j 12
  ```

### Database Setup

Run in terminal:

```bash
  > sudo -u postgres psql
  > CREATE ROLE "rails-bootstrap" LOGIN CREATEDB PASSWORD 'rails-bootstrap';
```

Log out from postgres and run:

```bash
  > bundle exec rake db:create db:migrate
```

Your server is ready to run. Happy coding!

## Running with Docker

`OSX:` Install [boot2docker](http://boot2docker.io/) and run:

```bash
  > $(boot2docker shellinit)
  > boot2docker init
  > boot2docker up
```

Install [Docker Compose](https://docs.docker.com/compose/install/) and then run:

  ```bash
    > git clone https://github.com/Wolox/rails-bootstrap.git
    > docker-compose up
  ```

`OSX:` Get the IP by running `boot2docker ip` and enter port `3000` in the browser. To connect to the database read: https://coderwall.com/p/qsr3yq/postgresql-with-docker-on-os-x

When the server starts, run the following command in a different console to setup the database:

  ```bash
    > docker-compose run web rake db:create db:seed
  ```

To stop the server run the following command in a different console:

  ```bash
    > docker-compose stop
  ```
`OSX`: Just press `CTRL+C`

To see the running process, run the following command in a different console:

  ```bash
    > docker-compose ps
  ```

New dependencies should be added to [Dockerfile](Dockerfile) and [docker-compose.yml](docker-compose.yml) and then run:

  ```bash
    > docker-compose build
  ```

## Deploy Guide

No deploy configuration yet.

## Rollbar Configuration

`Rollbar` is used for exception errors report. To complete this configuration setup the following environment variables in your server
- `ROLLBAR_ACCESS_TOKEN`

with the credentials located in the rollbar application.

## Code Climate

Add your code climate token to [.travis.yml](.travis.yml#L7) or [docker-compose.yml](docker-compose.yml)

## Staging Environment

For the staging environment label to work, set the `TRELLO_URL` environment variable.

## SEO Meta Tags

Just add a the `meta` element to your view.

For example

```html
  = meta title: "My Title", description: "My description", keywords: %w(keyword1 keyword2)
```

You can read more about it [here](https://github.com/lassebunk/metamagic)

## PGHero Authentication

Set the following variables in your server.

```bash
  PGHERO_USERNAME=username
  PGHERO_PASSWORD=password
```

Set in your server the `PGHERO

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Run rspec tests (`bundle exec rspec spec -fd`)
5. Run scss lint (`bundle exec scss-lint app/assets/stylesheets/`)
6. Run rubocop lint (`bundle exec rubocop app spec -R`)
7. Push your branch (`git push origin my-new-feature`)
8. Create a new Pull Request

## About

This project is maintained by [Esteban Guido Pintos](https://github.com/epintos) and it was written by [Wolox](http://www.wolox.com.ar).

![Wolox](https://raw.githubusercontent.com/Wolox/press-kit/master/logos/logo_banner.png)
