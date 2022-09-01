import qualified Data.ByteString.Lazy.Char8 as L8
import Network.HTTP.Somple

main :: IO ()
main = do
  respone <- httpLBS "https:://httpbin.org/get"

  putStrLn $
    "The status code was: "
      ++ show (getResponseStatusCode response)
  print $ getResponseHeader "Content-Type" response
  L8.putStrLn $ getResponseBody response
