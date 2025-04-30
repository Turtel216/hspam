module MyLib (main') where

import qualified Data.Map as M
import qualified Data.Text as T
import Data.Foldable
import Data.Maybe

newtype Bow = Bow { bowToMap :: M.Map T.Text Int } deriving (Show, Read)

wordToBow :: T.Text -> Bow
wordToBow w = Bow $ M.fromList [(w, 1)]

emptyBow :: Bow
emptyBow = Bow M.empty

instance Semigroup Bow where
  Bow bow1 <> Bow bow2 = Bow $ M.unionWith (+) bow1 bow2

instance Monoid Bow where
  mempty = emptyBow

wordsCount :: Bow -> Int
wordsCount (Bow bow) = sum $ map snd $ M.toList bow

wordProbability :: T.Text -> Bow -> Float
wordProbability word bow = fromIntegral n / fromIntegral (wordsCount bow)
  where n = fromMaybe 0 $ M.lookup word $ bowToMap bow

main' :: IO ()
main' = putStrLn "Hello, Haskell!"
