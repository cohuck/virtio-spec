#!/bin/sh

SPECDOC=virtio-v1.0-csd01-html

#uncomment if you have a broken t4ht
#PATH=./t4ht-workaround:${PATH} htlatex $SPECDOC.tex "virtiohtml,info,charset=utf-8" " -cunihtf -utf8"
htlatex $SPECDOC.tex "virtiohtml,info,charset=utf-8" " -cunihtf -utf8"

rm $SPECDOC.aux
mv $SPECDOC.html $SPECDOC.tmp1

sed 's/~~/"/g' $SPECDOC.tmp1 >$SPECDOC.tmp2
sed 's/>~/>"/g' $SPECDOC.tmp2 >$SPECDOC.tmp3
sed 's/>=~/>="/g' $SPECDOC.tmp3 >$SPECDOC.tmp4
sed 's/~</"</g' $SPECDOC.tmp4 >$SPECDOC.tmp5

mv $SPECDOC.tmp5 $SPECDOC.html
rm $SPECDOC.tmp*

#uncomment if you have a broken t4ht
#cp ./t4ht-workaround/virtio-v1.0-csd01.css $SPECDOC.css

zip $SPECDOC.zip $SPECDOC.html $SPECDOC.css images/*.png
