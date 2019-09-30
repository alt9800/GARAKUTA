#!/bin/sh

READPATH=/Users/admin/mount?/Moviesh264/??????/hoge
SAVEPATH=/Users/admin/mount?/Moviesmp4/??????/hoge
read0=${READPATH##*/}
read1=${READPATH#*/mount?/}
read2=${read1#*/Moviesh264/}
read3=${read2%/${read0}} #動画の入っている一つ上のディレクトリ名だけを抽出
save0=${1SAVEPATH#*/mount?/}
save1=${save0%%/Movies*/*} #>この部分でstrageの名前が出力できる
save2=${save0#$save1/*}

cd $READPATH
echo "$read3 の $read0 を変換中です。" | mail -s "$read3 $read0 変換開始" hoge@xxx.com fuga@yyy.co.jp foo@zzz.ac.jp
for f in *.h264; do mp4box -add $f -new $SAVEPATH/${f%.*}.mp4; done
echo "変換が終わりました。動画は $save1 の $save2 に保存されています。" | mail -s "$read3 $read0 変換終了" hoge@xxx.com fuga@yyy.co.jp foo@zzz.ac.jp

