{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE CPP #-}
-- | GHC stage restriction: have to write Lift in a separate module from where
-- TH is used (Utils.hs)

module Internal where

#if __GLASGOW_HASKELL__ < 710
import Control.Applicative
#endif
import Data.Aeson (FromJSON(parseJSON), genericParseJSON)
import Data.Aeson.Types (defaultOptions, fieldLabelModifier)
import Data.Char (toLower)
import GHC.Generics (Generic)
import Language.Haskell.TH.Syntax (Lift(lift))

data Config = Config
  { configHost      :: String
  , configHttpPort  :: Int
  , configProtoPort :: Int
  , configAdmin     :: String
  } deriving Generic

instance Lift Config where
  lift (Config a b c d) = [| Config a b c d |]

instance FromJSON Config where
  parseJSON = genericParseJSON (defaultOptions { fieldLabelModifier = f })
   where
    f ('c':'o':'n':'f':'i':'g':x:xs) = toLower x : xs
    f _ = fail "invalid config"
