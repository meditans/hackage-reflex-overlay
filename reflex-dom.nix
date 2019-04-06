self: super: {
  haskellPackages = super.haskellPackages.extend (selfHS: superHS:
    with self.haskell.lib;
    with self.lib;
    ({
       reflex =
         dontCheck
           (flip appendConfigureFlag "-f-use-template-haskell"
             (flip self.haskellPackages.callHackageDirect {}
               { pkg = "reflex";
                 ver = "0.6.1";
                 sha256 = "07y6gqa3vk1b0ns1q6lzmd5q8xvxb5sxrnfnsa7khqgbm30bj8a3";
               }));
       reflex-dom-core =
         doJailbreak
           (dontCheck
             (flip self.haskellPackages.callPackage {}
               "/home/carlo/code/haskell/forks/reflex-dom-core-0.5"));
       reflex-dom = flip addExtraLibrary selfHS.jsaddle-warp
         (doJailbreak
           (dontCheck
             (flip appendConfigureFlags ["-fuse-warp" "-f-webkit2gtk"]
               (flip self.haskellPackages.callHackageDirect {}
                 { pkg = "reflex-dom";
                   ver = "0.5";
                   sha256 = "0sfmsyz8h5gm0m3rkyzflnb2cya9myv6zifkwx7i170l54q8j9z4";
                 }))));
       jsaddle-warp           = dontCheck (superHS.jsaddle-warp);
       haskell-gi-overloading = self.haskellPackages.haskell-gi-overloading_0_0;
       chrome-test-utils  = null;
       jsaddle-webkit2gtk = null;
     }));
}
