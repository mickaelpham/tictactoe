# Tic Tac Toe

This is just a toy repository where I practice my Ruby improved knowledge after
learning more about [Go](https://golang.org/). It is true that learning
different programming languages let you improve your overall programming skills.

## Architecture

The logic is separated from the display. There is a `Tictactoe::Game` class that
focuses solely on the game logic, while `Tictactoe::CLI` handles user
interactions through the command line.

This means it is possible to spin up an HTTP server and reuse the
`Tictactoe::Game` while handling a completely different I/O source. This is
where `Tictactoe::Server` comes in play with a quick
[Sinatra](http://sinatrarb.com/) application.

### CLI Usage

Start a new game using the command line and running the `bin/game` executable.

### HTTP Usage

Start a new game by running a web server:

```sh
rackup -p 4567
```

Get the current stage of the game:

```sh
curl http://localhost:4567/game -v
```

Add a token to the board:

```sh
curl -X POST http://localhost:4567/game -d '{"position": 2}' -v
```

## Contributing

Bug reports and pull requests are welcome on GitHub at
[mickaelpham/tictactoe](https://github.com/mickaelpham/tictactoe).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Credits

This repository is inspired by
[Learn Go with tests](https://quii.gitbook.io/learn-go-with-tests/build-an-application/command-line)
which is a great resource to learn Go.
