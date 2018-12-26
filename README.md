# elm-composing-example

This example aims to highlight the way to compose elm modules.

## Example 1
In a single Main module, it refers to an outside counter module so we can interact with it.

File `Counter.elm`:
This is a basic standalone module which exposes a counter (with increment / decrement buttons)

File `Gallery.elm`:
This is a standalone module which exposes a images gallery:
- With a random generate button 
- With a selected image 

File `Main.elm`: 
This main module refers to counter module so it can render an allow interactions with it.

```
Main.elm 
    -- Main.Model 
    -- Main.Msg
    -- Main.View
    
    | Counter.elm 
        -- Counter.Model
        -- Counter.Msg
        -- Counter.View
    
    | Gallery.elm 
        -- Gallery.Model
        -- Gallery.Msg
        -- Gallery.View
```

`Counter.elm` and `Gallery.elm` can be considered here as sub-elements of `Main.elm` 


### MacOS

Prerequisites: [Homebrew](https://brew.sh/index_fr)

- Install elm: `brew install elm`
- Install or update npm: `brew install npm` or `brew upgrade npm`
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`
- Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js`

### Unix 
- Install elm: `apt-get install elm`
- Install or update npm: `apt-get install npm` or `apt-get upgrade npm`
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`
- Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js`

### Windows
- Install elm: [Windows Installer](https://guide.elm-lang.org/install.html)
- Install or update npm: [Node](https://nodejs.org/en/download/)
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`
- Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js`


## Technologies 
Written in [Elm 0.19.0](https://elm-lang.org/)

![Elm logo](assets/elm_logo.png)

### Hot-reload
Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`

Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js --debug`

### Formatter
Install [elm-format](https://github.com/avh4/elm-format) following this startup guide: [Install Elm format](https://github.com/avh4/elm-format)

This aims to format using Elm style guide when saving.