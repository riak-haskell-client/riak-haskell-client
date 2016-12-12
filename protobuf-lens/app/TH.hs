{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE ViewPatterns    #-}

module TH where

import Data.Char (toUpper)
import Language.Haskell.TH.Lib (DecsQ)
import Language.Haskell.TH.Syntax
import Lens.Micro
import Lens.Micro.TH hiding (makeLenses)

makeLenses :: Name -> DecsQ
makeLenses =
  makeLensesWith
    (camelCaseFields & set lensField
      (\_ _ (nameBase -> field@(x:xs)) ->
        let
          className :: String
          className = "Has" ++ (toUpper x : camel xs)

          camel :: String -> String
          camel "" = ""
          camel ('_':y:ys) = toUpper y : camel ys
          camel (y:ys) = y : camel ys
        in
          [MethodName (mkName className) (mkName field)]))
