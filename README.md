[![Code Climate](https://codeclimate.com/github/gavinlaking/vedeu.png)](https://codeclimate.com/github/gavinlaking/vedeu)

# Vedeu

Vedeu is my attempt at creating a terminal based application framework without the need for Ncurses.

## Installation

Add this line to your application's Gemfile:

    gem 'vedeu'

And then execute:

    $ bundle

## Usage

TODO: Write detailed documentation

## Notes

    Launcher
      |-- Application
            |-- EventLoop
            |     |-- Input
            |     |     |-- Queue
            |     |     |-- Terminal
            |     |
            |     |-- Process
            |     |     |-- CommandRepository
            |     |     |-- Queue
            |     |
            |     |-- Output
            |           |-- Compositor
            |           |-- Queue
            |
            |-- InterfaceRepository
            |-- Terminal

    Base
      |-- Translator
      |-- Esc

    Interface
      |-- Commands
      |     |-- Command
      |     |     |-- CommandRepository
      |     |
      |     |-- Exit
      |
      |-- Compositor
      |     |-- Directive
      |     |     |-- Colour
      |     |     |     |-- Foreground < Base
      |     |     |     |-- Background < Base
      |     |     |
      |     |     |-- Position
      |     |     |     |-- Esc
      |     |     |
      |     |     |-- Style
      |     |           |-- Esc
      |     |
      |     |-- InterfaceRepository
      |     |-- Position
      |     |     |-- Esc
      |     |
      |     |-- Renderer
      |           |-- Terminal
      |
      |-- Geometry
      |     |-- Terminal
      |
      |-- Input
      |-- InterfaceRepository
      |-- Position
      |-- Terminal

    Terminal
      |-- Esc
      |-- Position
            |-- Esc

    Wordwrap

### On Interfaces

When we create the interface we define it's width, height, and origin (y, x).
These numbers are based on the area available to the terminal. If the terminal is 80x25, then our interface can use all or some of this area.

### On Composition

To compose data suitable for output in Vedeu, you can use this EBNF. Diagrams are available in the `documentation` directory.

    Output ::= (('{' (Interface '=>' Stream) '}' (',' | ))* | ('[' (Stream (',' | ))* ']' (',' | ))* | ('[' (String (',' | ))* ']') (',' | ))*
    Stream ::= ('[' (Directive (',' | ) | String (',' | ))* ']' (',' | ))*
    Interface ::= String
    Directive ::= PositionDirective | ColourDirective | StyleDirective
    PositionDirective ::= '[' Fixnum ',' Fixnum ']'
    StyleDirective ::= Symbol
    ColourDirective ::= '[' Symbol ',' Symbol ']'

Diagrams were produced using the Railroad Diagram Generator at `http://bottlecaps.de/rr/ui`.

## Usage

    class MyApp
      include Vedeu

      interface 'status', { y: 1, x: 1, width: :auto, height: 1     }
      interface 'main',   { y: 2, x: 1, width: :auto, height: :auto }

      command 'exit', Vedeu::Exit.dispatch, { keyword: "exit", keypress: "q" }
      command 'help', MyApp.help,           { keyword: "help", keypress: "h" }
    end

## Contributing

1. Fork it ( http://github.com/<my-github-username>/vedeu/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
