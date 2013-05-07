-- 下のパッケージをインストールしておく。
-- (shellかghciを再起動しないと認識しないかも)
-- cabal install iconv
-- cabal install utf8-string

import qualified Codec.Text.IConv           as IConv
import qualified Data.ByteString.Lazy       as B (readFile, ByteString)
import qualified Data.ByteString.Lazy.Char8 as B (putStrLn)
import qualified Data.ByteString.Lazy.UTF8  as B (toString)

-- shift jisファイルを読み込む
readSjisFile :: FilePath -> IO String
readSjisFile = fmap sjis2utf8 . B.readFile

-- shift jisからutr-8に変換する
sjis2utf8 :: B.ByteString -> String
sjis2utf8 = B.toString . IConv.convert "sjis" "UTF-8"

