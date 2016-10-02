{-# LANGUAGE OverlappingInstances  #-}
{-# LANGUAGE DeriveFunctor         #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeOperators         #-}

-- | Small bits from datatypes a-la-carte (much less heavyweight than depending
-- on the compdata package).

module Data.Alacarte
  ( (:+:)(..)
  , (:<:)(..)
  ) where

data (:+:) f g a
  = InL (f a)
  | InR (g a)
  deriving Functor
infixr 6 :+:

class (Functor f, Functor g) => (:<:) f g where
  inj :: f a -> g a

instance {-# OVERLAPPABLE #-} Functor f => f :<: f where
  inj = id

instance {-# OVERLAPPING #-} (Functor f, Functor g) => f :<: (f :+: g) where
  inj = InL

instance {-# OVERLAPPING #-}
         (Functor f, Functor g, Functor h, f :<: g) => f :<: (h :+: g) where
  inj = InR . inj
