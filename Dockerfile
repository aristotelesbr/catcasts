FROM elixir:1.6.1
MAINTAINER Aristoteles <aristotelesbr@gmail.com>
# Postgres
RUN apt-get update && apt-get install --yes postgresql-client
# Install hex package manager
RUN mix local.hex --force
# Install rebar
RUN mix local.rebar --force
# Install Phoenix
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez
# Install inotify-tools
RUN apt-get update && apt-get install -y -q inotify-tools

# Install node
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs

# Create app directory and copy the Elixir projects into it
WORKDIR /catcasts
EXPOSE 4000

# Run deps and server
# CMD ["./run.sh"]
