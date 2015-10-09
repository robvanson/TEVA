#!/bin/bash
#
APPLICATIONNAME=TEVA
CURRENTWORKINGDIR=$(pwd)
UNAME=$(uname -s)
MAKECMD=make
EXECPATH=./praat
TARGETNAME=${APPLICATIONNAME}
ZIPNAME=${TARGETNAME}

PRAATSOURCES=./praat_sources
if [[ ${1:-Normal} == "MinGW" ]]; then
	PRAATSOURCES=../../praat_mingw
	if [[ ! -d ${PRAATSOURCES} ]]; then
		exit
	fi
	# Temporary cludge to recompile this file without -O2
	touch ${PRAATSOURCES}/dwsys/regularExp.cpp
elif [[ -d ../praat_sources ]]; then
	PRAATSOURCES=../praat_sources
elif [[ -d ../../demo_praat_sources ]]; then
	PRAATSOURCES=../../demo_praat_sources
elif [[ -d ../../praat_sources ]]; then
	PRAATSOURCES=../../praat_sources
fi

if [[  -e ${PRAATSOURCES}/makefile.defs && -n `grep -l mingw32 ${PRAATSOURCES}/makefile.defs` ]]; then
	EXECPATH=./Praat.exe
	if [[ ${1:-Normal} == "MinGW" && ${2:-Normal} == "XP" ]]; then
		TARGETNAME=${APPLICATIONNAME}XP.exe
	else
		TARGETNAME=${APPLICATIONNAME}.exe
	fi
	ZIPNAME=${TARGETNAME}
	UNAME=MinGW
elif [[ ${UNAME} == "Darwin" ]]; then
	MAKECMD="xcodebuild -project praat64.xcodeproj"
echo ${2:-Normal}
	if [[ `ls -d /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.1*.sdk 2>/dev/null` ]]; then
		SDK=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk
		MAKECMD="xcodebuild -project praat64.xcodeproj -sdk ${SDK}"
		EXECPATH="./build/Configuration64/Praat.app"
		ZIPNAME=${ZIPNAME}_64.app
	elif [[ -d ${PRAATSOURCES}/praat32.xcodeproj && ${1:-Normal} != "OSX64" ]]; then
		if [[ -d /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs ]]; then
			SDK=`ls -1d /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/*|grep 10.6`
		else
			SDK=`ls -1d /Developer/SDKs/*|grep 10.6`
		fi
		MAKECMD="xcodebuild -project praat32.xcodeproj -sdk ${SDK}"
		EXECPATH="./build/Configuration1/Praat.app"
		ZIPNAME=${ZIPNAME}_32.app
	else
		MAKECMD="xcodebuild -project praat64.xcodeproj"
		EXECPATH="./build/Configuration64/Praat.app"
		ZIPNAME=${ZIPNAME}_64.app
	fi
	TARGETNAME=${APPLICATIONNAME}.app
fi

# Patch Praat
cd ${PRAATSOURCES}
if [[ -s ${CURRENTWORKINGDIR}/adaptPraat.patch ]]; then
	patch --strip=1 < ${CURRENTWORKINGDIR}/adaptPraat.patch
fi
if [[ -s ${CURRENTWORKINGDIR}/sys_praat_name.patch ]]; then
	patch --strip=1 < ${CURRENTWORKINGDIR}/sys_praat_name.patch
fi

# Add demopraatapplication.h
cd main/
rm -f demopraatapplication.h
if [[ ${1:-Normal} == "MinGW" && ${2:-Normal} == "XP" ]]; then
	cat ${CURRENTWORKINGDIR}/${APPLICATIONNAME}expanded.h | sed 's/\(\"build_SHA\$ \= \\\"[^\\]*\)/\1 XP/g' > ${CURRENTWORKINGDIR}/${APPLICATIONNAME}expandedXP.h
	ln -s ${CURRENTWORKINGDIR}/${APPLICATIONNAME}expandedXP.h ./demopraatapplication.h
else
	ln -s ${CURRENTWORKINGDIR}/${APPLICATIONNAME}expanded.h ./demopraatapplication.h
fi
# Create a file containing the Build number
grep 'build_SHA$ = "' ${CURRENTWORKINGDIR}/${APPLICATIONNAME}expanded.praat | grep ':' | perl -ane '/\"([A-F0-9]+)\s+([\d\-]+)(.*)\"/;print "<i>$1</i> <b>$2</b>$3\n";' > ${CURRENTWORKINGDIR}/Build_SHA.html

# Get the manual into the tutorials manual
cp ../fon/manual_tutorials.cpp ../fon/manual_tutorials.cppORIGINAL
NUMLINES=$(grep -n '}' ../fon/manual_tutorials.cpp|tail -1|sed 's/\:.*//g'|perl -ane 'print $_-1;')
TAILLINES=$(wc -l ../fon/manual_tutorials.cpp|perl -ane "print \$_ - ${NUMLINES}")
head -n ${NUMLINES} ../fon/manual_tutorials.cppORIGINAL > ../fon/manual_tutorials.cpp
cat  ${CURRENTWORKINGDIR}/manual_${APPLICATIONNAME}.cpp >> ../fon/manual_tutorials.cpp
tail -${TAILLINES} ../fon/manual_tutorials.cppORIGINAL >> ../fon/manual_tutorials.cpp

# Get the icons into the main folder
mv ../main/Praat.icns ../main/PraatBACKUP.icns
mv ../main/praat_win.ico ../main/praat_winBACKUP.ico
cp ${CURRENTWORKINGDIR}/TEVA.icns ../main/Praat.icns
cp ${CURRENTWORKINGDIR}/TEVA_win.ico ../main/praat_win.ico

touch main_Praat.cpp

# Patch main_Praat
if [[ -s ${CURRENTWORKINGDIR}/main_Praat.patch ]]; then
	patch main_Praat.cpp ${CURRENTWORKINGDIR}/main_Praat.patch
fi

cd ../
if [[ ${UNAME} == "Darwin" ]]; then
	${MAKECMD} OTHER_CFLAGS='$OTHER_CFLAGS -DDEMOAPP' 2>&1
else
	${MAKECMD} 2>&1
fi

# Undo patches
if [[ -s ${CURRENTWORKINGDIR}/adaptPraat.patch ]]; then
	patch -R --strip=1 < ${CURRENTWORKINGDIR}/adaptPraat.patch
fi
if [[ -s ${CURRENTWORKINGDIR}/sys_praat_name.patch ]]; then
	patch -R --strip=1 < ${CURRENTWORKINGDIR}/sys_praat_name.patch
fi

cd main/
rm -f demopraatapplication.h ../fon/manual_tutorials.cpp Praat.icns praat_win.ico
mv PraatBACKUP.icns Praat.icns
mv praat_winBACKUP.ico praat_win.ico
mv ../fon/manual_tutorials.cppORIGINAL ../fon/manual_tutorials.cpp
if [[ -s ${CURRENTWORKINGDIR}/main_Praat.patch ]]; then
	patch -R main_Praat.cpp ${CURRENTWORKINGDIR}/main_Praat.patch
fi
cd -

# Move result to correct directory
if [[ -d ${CURRENTWORKINGDIR}/${TARGETNAME} ]]; then
	rm -r ${CURRENTWORKINGDIR}/${TARGETNAME}
fi
mv ${EXECPATH} ${CURRENTWORKINGDIR}/${TARGETNAME}

	
cd ${CURRENTWORKINGDIR}
zip -r ${ZIPNAME}.zip ${TARGETNAME}

# Create MD5SUM
if [[ -n `which md5` ]] ; then 
	if [[ -f ${CURRENTWORKINGDIR}/${TARGETNAME} ]]; then
		cd ${CURRENTWORKINGDIR}/; md5 ${TARGETNAME} > ${TARGETNAME}.md5 ; cd -
	fi
	cd ${CURRENTWORKINGDIR}/; md5 ${ZIPNAME}.zip > ${ZIPNAME}.zip.md5 ; cd -
fi
if [[ -n `which md5sum` ]] ; then 
	if [[ -f ${CURRENTWORKINGDIR}/${TARGETNAME} ]]; then
		cd ${CURRENTWORKINGDIR}/; md5sum ${TARGETNAME} > ${TARGETNAME}.md5 ; cd -
	fi
	cd ${CURRENTWORKINGDIR}/; md5sum ${ZIPNAME}.zip > ${ZIPNAME}.zip.md5 ; cd -
fi

# Create SHA1
if [[ -n `which shasum` ]] ; then 
	if [[ -f ${CURRENTWORKINGDIR}/${TARGETNAME} ]]; then
		cd ${CURRENTWORKINGDIR}/; shasum -p ${TARGETNAME} > ${TARGETNAME}.sha1 ; cd -
	fi
	cd ${CURRENTWORKINGDIR}/; shasum -p ${ZIPNAME}.zip > ${ZIPNAME}.zip.sha1 ; cd -
fi
