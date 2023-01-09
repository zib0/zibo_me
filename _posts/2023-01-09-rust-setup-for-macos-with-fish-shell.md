---
title: "Rust Setup for macOS with Fish Shell"
layout: post
category: programming
usemathjax: false
---

I have been using [fish shell](https://fishshell.com) for long. Even though zsh, bash are powerful as well, but they are not as friendly as fish shell. So far, fish shell provide me the best autocompletion and fuzzy matching, and many other functions. However, Rust doesn't have autoconfig for fish shell, so this article is to help you setup Rust with fish shell on macOS, and this is the first article for the series of Rust learning articles.

# Install Rustup

[Rustup](https://rustup.rs) is the official toolchain installer for Rust. Even though I have Homebrew on the system, I still prefer to use rustup, it offers a better way to manage Rust toolchain. Somehow like `nvm` for Node.js, or `conda` for Python.

You can install rustup by running the following command:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Then you will get prompt to select installation options, along with some other information:

```bash
You can uninstall at any time with rustup self uninstall and
these changes will be reverted.

Current installation options:


   default host triple: x86_64-apple-darwin
     default toolchain: stable (default)
               profile: default
  modify PATH variable: yes

1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
```

I suggest to select `1` anyways, since this way enables the ability to use rust with bash or zsh in the future.

Then wait for the installation to finish. You will get a message like this:

```bash

Rust is installed now. Great!

To get started you may need to restart your current shell.
This would reload your PATH environment variable to include
Cargo's bin directory ($HOME/.cargo/bin).

To configure your current shell, run:
source "$HOME/.cargo/env"

```

But you shouldn't do that for fish shell. Instead, follow the next section.

# Configure Fish Shell

What we really need to do is to add the following line to `~/.config/fish/config.fish`:

```bash

set -gx PATH $HOME/.cargo/bin $PATH

```

You don't need to source the env file, since it is not designed for fish shell, and our PATH is already set. Just restart the terminal, and you are good to go.
