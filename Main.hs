import System.Environment (getArgs)

main = do 
  args <- getArgs
  case args of
    [inp,out] -> interactWith fixLines inp out
    _         -> putStrLn "error: exactly 2 args required"
    
interactWith f inpf outf = do
  input <- readFile inpf
  writeFile outf (f input)
  
fixLines :: String -> String
fixLines cs = unlines (splitLines cs)

splitLines :: String -> [String]
splitLines [] = []
splitLines cs = let (pre,suf) = break isLineTerminator cs
  in pre : case suf of
    ('\r':'\n':rest) -> splitLines rest
    ('\r':rest)      -> splitLines rest
    ('\n':rest)      -> splitLines rest
    _                -> []

isLineTerminator c = c == '\r' || c == '\n'

