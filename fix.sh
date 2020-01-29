set -e

font="DDCUchen-Regular.ttf"
gftools fix-fstype $font
python -c 'from fontTools.ttLib import TTFont;f=TTFont("DDCUchen-Regular.ttf");f["hmtx"].metrics["uni00A0"]=f["hmtx"].metrics["space"];f.save("DDCUchen-Regular.ttf")'
gftools fix-dsig -a $font
gftools fix-nonhinting $font $font.fix
mv $font.fix $font
rm *gasp*.ttf
gftools fix-fsselection $font --usetypometrics --autofix
gftools fix-vertical-metrics -dw 909 -aw 1361 $font
mv DDCUchen-Regular.fix.ttf $font
