{-# LANGUAGE BangPatterns #-}

module Lib
    ( forceElems
    ) where

import Data.Functor.Identity
import Data.Traversable

forceElems :: Traversable t => t a -> t a
forceElems = runIdentity . mapM (\a -> Identity $! a)

forceElemsList' :: [a] -> [a]
forceElemsList' = foldr ((:) $!) []
