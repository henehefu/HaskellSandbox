import Network.CGI (runCGI, handleErrors, setHeader, output, CGI, CGIResult)

main :: IO ()
main = runCGI $ handleErrors cgiMain

cgiMain :: CGI CGIResult
cgiMain = do
  setHeader "Content-type" "text/html; charset = UTF-8"
  output "Hello World!"

