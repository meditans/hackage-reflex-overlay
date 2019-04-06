# A nix overlay for reflex and reflex-dom on ghc 8.6.4

I use this in case I just want a quick UI for a project of mine, and don't want
to create the entire Obelisk structure, not having the need for js or android
code generation. Having this in my `~/.config/nixpkgs/overlays`, I can just add
`reflex` and `reflex-dom` to my `.cabal` file, and `cabal new-build` it.

Currently, `reflex` and `reflex-dom` use the latest hackage release, while I
have slightly patched `reflex-dom-core` to make it compatible with ghc 8.6.4.
