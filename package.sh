#!/bin/bash
TARGET=$1
ROOTDIR=$(dirname $0)
NAME=$(lua $ROOTDIR/get_title.lua)
LOVEFILE="$ROOTDIR/pkg/$NAME.love"

"$(dirname $0)/download.sh" $TARGET

if ! [ -f $LOVEFILE ]; then
    echo "Game not found in $LOVEFILE - please run \"make build\" first."
    exit 1
fi

echo -n "Packaging for $TARGET..."
echo ""

PKGDIR=$ROOTDIR/pkg/$TARGET
LIBDIR=$ROOTDIR/lib/$TARGET

rm -rf $PKGDIR
mkdir -p $PKGDIR

if [ $TARGET != "linux" ]; then
    cp -r $LIBDIR/* $PKGDIR
fi

if [ $TARGET = "linux" ]; then
	cp $LOVEFILE $PKGDIR
elif [ $TARGET = "windows" ]; then
	cd $PKGDIR
	cat $LIBDIR/love.exe $LOVEFILE > $NAME.exe
	zip -r "../${NAME}_${TARGET}.zip" "./"
elif [ $TARGET = "osx" ]; then
	mv $PKGDIR/love.app $PKGDIR/$NAME.app
	cp $LOVEFILE $PKGDIR/$NAME.app/Contents/Resources/$NAME.love
	cd $PKGDIR
	zip -r "../${NAME}_${TARGET}.zip" "./"
else
	echo "ERROR: Unknown target: $TARGET"
	exit 1
fi

echo "$TARGET packaging finished "
echo ""
