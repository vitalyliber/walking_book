# Walking Book

**ruby version:** 2.3.4

**gemset:** walking_book

## How to start application for developing

Install postgres dependencies:

_For mac_

```
brew install libpq
```

_For linux_

```
apt-get install postgresql-client
```

Start postgres container:

```
docker-compose up
```

Create migrations:

```
rake db:create db:migrate
```

Start your Rails server:

```
rails start
```

Start webpack dev server:

```
./bin/webpack-dev-server

```

## How to start system tests

```
rake assets:precompile
rails test:system
```

## How to start common tests

```
rails test
```

## How to add a new package

```
yarn add package-name
```

## On/Off caching in dev mode
```
rails dev:cache
```