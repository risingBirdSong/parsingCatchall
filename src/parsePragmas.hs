import Data.List 
import Data.List.Split

cleanPragmasData = "-XDeriveGeneric -XGADTs -XOverloadedStrings -XFlexibleContexts -XFlexibleInstances -XTypeFamilies -XTypeApplications -XDeriveAnyClass"
dirtyPragmasData = "> :set -XDeriveGeneric -XGADTs -XOverloadedStrings -XFlexibleContexts -XFlexibleInstances -XTypeFamilies -XTypeApplications -XDeriveAnyClass"
mapPragma pragmas = intercalate "," $ map ((\ x -> "{-# " ++ x ++ " #-}") . drop 1) (words pragmas)

cleanPragma str = dropWhile (\x -> x /= '-') str

convertCMDLineToFilePragma = id . mapPragma . cleanPragma

-- https://stackoverflow.com/questions/12102874/haskell-suppress-quotes-around-strings-when-shown
convertCMDLineToFilePragmaDo str = do
    let cleaned = cleanPragma str
    let mapped = mapPragma cleaned
    putStrLn $ id mapped
