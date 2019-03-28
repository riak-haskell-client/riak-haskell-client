{-# LANGUAGE RankNTypes #-}

module Network.Riak.Lens
  ( (&)
  , (^.)
  , (.~)
  , (%~)
  , mapped
  ) where

import Data.Function ((&))
import Data.Functor.Const
import Data.Functor.Identity

type Lens s a
  = forall f. Functor f => (a -> f a) -> (s -> f s)

type Setter s a
  = (a -> Identity a) -> (s -> Identity s)

infixl 8 ^.
(^.) :: s -> Lens s a -> a
s ^. l =
  getConst (l Const s)

infixr 4 .~
(.~) :: Setter s a -> a -> s -> s
(l .~ a) s =
  runIdentity (l (\_ -> Identity a) s)

infixr 4 %~
(%~) :: Setter s a -> (a -> a) -> (s -> s)
(l %~ f) s =
  runIdentity (l (\a -> Identity (f a)) s)


mapped :: Functor f => Setter (f a) a
mapped f s =
  Identity (fmap (runIdentity . f) s)
