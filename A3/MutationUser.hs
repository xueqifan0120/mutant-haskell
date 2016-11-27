{- Assignment 3 - Memory and Mutation

This file contains code which uses the mutation library found in Mutation.hs
-}

module MutationUser(pointerTest, swap, swapCycle) where

import Mutation (
    get, set, def, Mutable, Pointer, Memory, StateOp(..), Value(..), (>>>), (>~>), returnVal, runOp
    )

-- | Takes a number <n> and memory, and stores two new values in memory:
--   - the integer (n + 3) at location 100
--   - the boolean (n > 0) at location 500
--   Return the pointer to each stored value, and the new memory.
--   You may assume these locations are not already used by the memory.
pointerTest :: Integer -> Memory -> ((Pointer Integer, Pointer Bool), Memory)
pointerTest = undefined
{-
pointerTest int memory =
	let { (firstpt, mem) = def memory 100  (int + 3)
        ;(secondpt, finalmem) = def mem 500 (int > 0)}
    in ((firstpt, secondpt), finalmem)
    -}

swap :: Mutable a => Pointer a -> Pointer a -> StateOp ()
swap pt1 pt2 = (get pt1 >~> (\x ->
                  (get pt2 >~> \y ->
                     (set pt1 y >>> set pt2 x))))

{-swap pt1 pt2 = StateOp (\mem ->
    ((), let  (v1, _) = runOp (get pt1) mem
              (v2, _) = runOp (get pt2) mem
              in case runOp (set pt1 v2 >>> set pt2 v1) mem of (_, memory) -> memory))

              --(get pt1 >~> set pt2)
-}


swapCycle :: Mutable a => [Pointer a] -> StateOp ()
swapCycle = undefined