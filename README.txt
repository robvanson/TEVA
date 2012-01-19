Praat Demo Framework

Introduction

The Praat Demo Framework suplies a set of Praat scripts and other files that
produce a fully functional interactive Demo Window for stand alone applications.

It implements button drawing and event loop, application and configuration 
screens, help functions, and automatically saving current settings between sessions. 
Already included are recording sounds, opening files, drawing waveforms and 
selecting intervals with zooming.

GUI design is stored independend of the script code in tab separated tables 
(Praat Table objects). Changing the GUI for existing functionality can be done
without touching the scripts. Adding functionality only requires the addition of
a single function associated to each button added.

The Framework is geared towards multiple language support. All user visible texts
are stored in language specific tables which will be loaded automatically when the
language is selected. On platforms where Praat supports the display of full 
Unicode character sets, these can be used. For example, a fully Chinese GUI is as
simple as a fully English GUI. New translations can be added locally without 
touching the scripts or recompiling the (binary) application.

Files

It has not been possible to completely separate application specific and general
script code into separate files. However, the intention has been to concentrate
all general code into the main script file (praatdemoframe.praat), and to delegate
most application specific code to the Initialise.praat script. The MainPage.praat and
Config.praat files contain both general and application specific code. Eg, all the
code handling button functionalities.

MainPage.praat
	Controls the main application window
	
Config.praat
	Controls the configuration page
	
CreateTables.praat
	All the GUI and text tables from Data translated into a single Praat script.
	Necessary for stand alone scripts
	
Data
	Directory with all the (language specific) text and GUI tables
	
gpl-2.0.html
gpl-2.0.txt
	GPL v2 license text. All code is licensed under the GPL version 2.0 or later.
	Please refer to the license text for details
	
Initialise.praat
	The application specific general initialization script. Contains mostly 
	application specific code and definitions
	
makefile
	Construct the final header file for stand alone applications containing the script
	in C text form suitable to include in main_Praat.c
	
praatdemoframe.praat
	The main script to call. The command ">praat praatdemoframe.praat" will run the 
	script as an application. Should be renamed after your application. Mainly
	contains general, application independend scripts.
	
praat_module
	Directory with files for creating stand-alone applications
	
README.txt
	This text
	
tables2scripts.praat
	Praat script to create CreateTables.praat from the Tabels in the Data directory
