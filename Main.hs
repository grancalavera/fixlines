import System.Environment (getArgs)

main = do 
  args <- getArgs
  case args of
    [inp,out] -> interctWith fixlines inp out
    _         -> putStrLn "error: exactly 2 args required"
    
interctWith f inpf outf = do
  input <- readFile inpf
  writeFile outf (f input)
  
fixlines :: String -> String
fixlines s = s