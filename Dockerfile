
FROM bitwalker/alpine-elixir-phoenix:latest

EXPOSE 4000

RUN mkdir /app
COPY . /app
WORKDIR /app

ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

ADD assets/package.json assets/
RUN cd assets \
    && npm install

ADD . .

RUN cd assets/ \
    && npm run deploy && \
    cd - && \
    mix do compile, phx.digest

RUN mix local.hex --force

RUN ["chmod", "+x", "/app/docker-entrypoint.sh"]

ENTRYPOINT ["/app/docker-entrypoint.sh"]
