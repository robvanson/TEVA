#!/bin/bash
#
APPLICATIONNAME=TEanalysis
CURRENTWORKINGDIR=$(pwd)
UNAME=$(uname -s)
MAKECMD=make
EXECPATH=./praat
TARGETNAME=${APPLICATIONNAME}

PRAATSOURCES=./praat_sources
if [[ ${1:-Normal} == "MinGW" ]]; then
	PRAATSOURCES=../../praat_mingw
	if [[ ! -d ${PRAATSOURCES} ]]; then
		exit
	fi
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
	UNAME=MinGW
elif [[ ${UNAME} == "Darwin" ]]; then
	MAKECMD='xcodebuild -project praat.xcodeproj'
	EXECPATH="./build/Configuration1/Praat.app"
	TARGETNAME=${APPLICATIONNAME}.app
fi

# Patch Praat
cd ${PRAATSOURCES}
if [[ -s ${CURRENTWORKINGDIR}/adaptPraat.patch ]]; then
	patch --strip=1 < ${CURRENTWORKINGDIR}/adaptPraat.patch
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

# Get the manual into the tutorials manual
cp ../fon/manual_tutorials.cpp ../fon/manual_tutorials.cppORIGINAL
NUMLINES=$(grep -n '}' ../fon/manual_tutorials.cpp|tail -1|sed 's/\:.*//g'|perl -ane 'print $_-1;')
TAILLINES=$(wc -l ../fon/manual_tutorials.cpp|perl -ane "print \$_ - ${NUMLINES}")
head -n ${NUMLINES} ../fon/manual_tutorials.cppORIGINAL > ../fon/manual_tutorials.cpp
cat  ${CURRENTWORKINGDIR}/manual_${APPLICATIONNAME}.cpp >> ../fon/manual_tutorials.cpp
tail -${TAILLINES} ../fon/manual_tutorials.cppORIGINAL >> ../fon/manual_tutorials.cpp

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

cd main/
rm -f demopraatapplication.h ../fon/manual_tutorials.cpp
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
zip -r ${TARGETNAME}.zip ${TARGETNAME}

# Create MD5SUM
if [[ -n `which md5` ]] ; then 
	if [[ -f ${CURRENTWORKINGDIR}/${TARGETNAME} ]]; then
		md5 ${CURRENTWORKINGDIR}/${TARGETNAME} > ${CURRENTWORKINGDIR}/${TARGETNAME}.md5
	fi
	md5 ${CURRENTWORKINGDIR}/${TARGETNAME}.zip > ${CURRENTWORKINGDIR}/${TARGETNAME}.zip.md5
fi
if [[ -n `which md5sum` ]] ; then 
	if [[ -f ${CURRENTWORKINGDIR}/${TARGETNAME} ]]; then
		md5sum ${CURRENTWORKINGDIR}/${TARGETNAME} > ${CURRENTWORKINGDIR}/${TARGETNAME}.md5
	fi
	md5sum ${CURRENTWORKINGDIR}/${TARGETNAME}.zip > ${CURRENTWORKINGDIR}/${TARGETNAME}.zip.md5
fi

