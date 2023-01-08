# cargo-expand.nvim

A simple wrapper around [cargo-expand][cargo-expand] to display the result of macro expansion in a dedicated buffer.

## Dependencies

- [cargo-expand][cargo-expand], obviously
- the latest from willruggiano's fork of [firvish.nvim][firvish].

## Usage

(examples taken from [cargo-expand][cargo-expand])

```lua
-- Run with the default options
require("cargo-expand").expand()

-- Expand a particular test target
require("cargo-expand").expand {
  args = {
    -- IMPORTANT: "expand" should always be the first argument!
    "expand",
    "--test",
    "test_something",
  },
}

-- Expand without rustfmt
require("cargo-expand").expand {
  args = {
    -- IMPORTANT: "expand" should always be the first argument!
    "expand",
    "--ugly",
  },
}

-- Expand a specific module or type or function only
require("cargo-expand").expand {
  args = {
    -- IMPORTANT: "expand" should always be the first argument!
    "expand",
    "path::to::module",
  },
}
```

Perhaps the only other interesting option is `bopen.how`, which specifies how to show the output:

```lua
-- The default: show the results in a vertically split preview window
require("cargo-expand").expand { bopen = { how = "vert pedit" } }
```

Note that this option accepts any buffer opening command: `:edit`, `:vsplit`, `:split`, et al (without the `:`).

[cargo-expand]: https://github.com/dtolnay/cargo-expand
[firvish]: https://github.com/willruggiano/firvish.nvim
