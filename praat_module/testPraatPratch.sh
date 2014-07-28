#!/bin/bash
#
APPLICATIONNAME=TEVA
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
	SDK=`ls -1d /Developer/SDKs/*|tail -1`
	MAKECMD="xcodebuild -project praat32.xcodeproj"
	if [[ -n ${SDK} ]]; then
		MAKECMD="xcodebuild -project praat32.xcodeproj -sdk ${SDK}"
	fi
	EXECPATH="./build/Configuration1/Praat.app"
	TARGETNAME=${APPLICATIONNAME}.app
fi

# This is a dry run!
MAKECMD=echo

# Patch Praat
cd ${PRAATSOURCES}
if [[ -s ${CURRENTWORKINGDIR}/adaptPraat.patch ]]; then
	patch --strip=1 < ${CURRENTWORKINGDIR}/adaptPraat.patch
	patch --strip=1 < ${CURRENTWORKINGDIR}/sys_praat_name.patch
fi

# Add demopraatapplication.h
cd main/

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
	patch -R --strip=1 < ${CURRENTWORKINGDIR}/sys_praat_name.patch
fi

cd main/
if [[ -s ${CURRENTWORKINGDIR}/main_Praat.patch ]]; then
	patch -R main_Praat.cpp ${CURRENTWORKINGDIR}/main_Praat.patch
fi
cd -

