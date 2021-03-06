let mkPackage =
      https://raw.githubusercontent.com/purescript/package-sets/psc-0.13.2-20190725/src/mkPackage.dhall sha256:0b197efa1d397ace6eb46b243ff2d73a3da5638d8d0ac8473e8e4a8fc528cf57

let upstream =
      https://raw.githubusercontent.com/purescript/package-sets/psc-0.13.2-20190725/src/packages.dhall sha256:60cc03d2c3a99a0e5eeebb16a22aac219fa76fe6a1686e8c2bd7a11872527ea3

let overrides = {=}

let additions = 
  { cssom =
          mkPackage
          [ "effect", "console" ]
          "https://github.com/danieljharvey/purescript-cssom.git"
          "v0.0.2"
      , stylesheet =
          mkPackage
          [ "console"
          , "debug"
          , "effect"
          , "foreign"
          , "generics-rep"
          , "ordered-collections"
          , "prelude"
          , "psci-support"
          , "refs"
          , "test-unit"
          , "unordered-collections"
          , "cssom"
          ]
          "https://github.com/danieljharvey/purescript-stylesheet.git"
          "v0.0.2"
      , react-stylesheet =
          mkPackage
           [ "effect", "console", "psci-support", "react", "cssom", "stylesheet" ]
           "https://github.com/danieljharvey/purescript-react-stylesheet.git"
           "v0.0.2"
  }
  
in  upstream // overrides // additions
