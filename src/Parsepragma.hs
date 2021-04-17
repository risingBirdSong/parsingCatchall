module Parsepragma 
    ( convertCMDLineToFilePragmaDo
    ) where
import Data.List 
import Data.List.Split

-- motivating use case 
-- https://haskell-beam.github.io/beam/tutorials/tutorial1/

cleanPragmasData = "-XDeriveGeneric -XGADTs -XOverloadedStrings -XFlexibleContexts -XFlexibleInstances -XTypeFamilies -XTypeApplications -XDeriveAnyClass"
dirtyPragmasData = "> :set -XDeriveGeneric -XGADTs -XOverloadedStrings -XFlexibleContexts -XFlexibleInstances -XTypeFamilies -XTypeApplications -XDeriveAnyClass"
mapPragma pragmas = "{-# " <> (intercalate " , " $ map (drop 1) (words pragmas)) <> " #-}"

cleanPragma str = dropWhile (\x -> x /= '-') str

-- doesnt remove qoutes, but the do io monad below does
-- convertCMDLineToFilePragma = id . mapPragma . cleanPragma

-- https://stackoverflow.com/questions/12102874/haskell-suppress-quotes-around-strings-when-shown
convertCMDLineToFilePragmaDo str = do
    let cleaned = cleanPragma str
    let mapped = mapPragma cleaned
    putStrLn $ id mapped
