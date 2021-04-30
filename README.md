# Tic Tac Toe

This is just a toy repository where I practice my Ruby improved knowledge after
learning more about [Go](https://golang.org/). It is true that learning
different programming languages let you improve your overall programming skills.

## Architecture

The logic is separated from the display. There is a `Tictactoe::Game` class that
focuses solely on the game logic, while `Tictactoe::CLI` handles user
interactions through the command line.

This means it would be possible to spin up an HTTP server and reuse the
`Tictactoe::Game` while handling a completely different I/O source.

### CLI

Start a new game using the command line and running the `bin/game` executable.

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
