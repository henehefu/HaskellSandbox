{-# LANGUAGE OverloadedStrings #-}

import Network.CGI
    ( CGI, CGIResult
    , runCGI, handleErrors
    , setHeader, outputFPS
    )

import Data.Text.Lazy          (Text)
import Data.Text.Lazy.Encoding (encodeUtf8)

main :: IO ()
main = runCGI $ handleErrors cgiMain

cgiMain :: CGI CGIResult
cgiMain = do
  setHeader "Content-Type" "text/html; charset=utf-8"
  outputUtf8 "こんにちは、配達に来ました！"

outputUtf8 :: Text -> CGI CGIResult
outputUtf8 = outputFPS . encodeUtf8
