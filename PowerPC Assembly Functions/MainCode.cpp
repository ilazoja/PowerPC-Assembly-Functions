#include "stdafx.h"
#include "ReplayFix.h"
#include "Controls.h"
#include "StopStartAlts.h"
#include "Save States.h"
#include "Miscellaneous Code.h"
#include "StopDPadOnSSS (except Wiimote).h"
#include "DrawDI.h"
#include "Code Menu.h"
#include "IASA Overlay.h"
#include "Control Codes.h"
#include "Last Character Auto Select.h"
#include "Tag Based Costumes.h"
#include "Light Shield.h"
#include "IkeClimbers.h"
#include "AIDisplay.h"
#include "C++Injection.h"
//#include "FPS Display.h"
using namespace std;

// Set asm output path here:
#if DOLPHIN_BUILD
static string OutputAsmPath = "C:\\Users\\Ilir\\Documents\\Games\\Brawl\\Project+Modding\\Experimental\\SD\\Project+\\Source\\Netplay\\Net-CodeMenu.asm";
//static string OutputAsmPath = "G:\\Games\\Brawl\\Custom Build\\P+ Build Repo\\SD\\Project+\\Source\\Netplay\\Net-CodeMenu.asm";

#else
static string OutputAsmPath = "C:\\Users\\Ilir\\Documents\\Games\\Brawl\\Project+Modding\\Experimental\\SD\\Project+\\Source\\Project+\\CodeMenu.asm";
//static string OutputAsmPath = "G:\\Games\\Brawl\\Custom Build\\P+ Build Repo\\SD\\Project+\\Source\\Project+\\CodeMenu.asm";
#endif

// --- Optional Settings ---
// GCTRM settings (assumes GCTRM, RSBE01.txt, and boost.txt is in folder)
static bool RunGCTRM = true;
static string BuildFolder =  "C:\\Users\\Ilir\\Documents\\Games\\Brawl\\Project+Modding\\Experimental\\SD\\Project+\\";
//static string BuildFolder = "G:\\Games\\Brawl\\Custom Build\\P+ Build Repo\\SD\\Project+\\";

// Build folder git settings
static bool CommitPull = false;
static string RepoFolder = R"("G:\\Games\\Brawl\\Custom Build\\P+ Build Repo\\")";
static string BranchName = "experimental";
static string PullFolder = R"("G:\\Games\\Brawl\\Custom Build\\P+ Build Pull\\")";

// Virtual SD Sync settings
static bool RunVSDSync = true;
static string VSDExePath = "C:\\Users\\Ilir\\Documents\\Games\\Brawl\\Project+Modding\\Experimental\\VSDSync\\VSDSync.exe";
//static string VSDExePath = "C:\\Users\\Ilir\\Documents\\Games\\Brawl\\Project+Modding\\VSDSync-0.1.3.2\\VSDSync.exe";

int main()
{	

	string TextPath = "../ASM.txt";
	CodeStart(TextPath);
	//place all ASM code here

	//ReplayFix();

	//NameIsFound();

	//MenuControlCodes();

	//StopStartAltFunctions();

	//StopPokemonTrainerSwitch();

	//StopDPadOnSSS();

	//ConvertButtons();

	//ItemSpawnControl();

	//ClearASLData();

	//SetTeamAttackTraining();

	//LXPGreenOverlayFix();

	CodeMenu(); tagBasedCostumes();

	//musicPercentCode();

	//DoubleFighterTest();

	//UCF();

	//CStickSlowFix();

	//FixStickyRAlts();

	//SelectLastCharacter();

	//FixTr4shTeamToggle();

	//cstickTiltTest();

	//FPSDisplay();

	//CStickTiltFix();

	//DBZModeTest();

	//slipperyTechs();

	//lightShield();

	//IkeClimbers();

	//fixStanimaTextBug();

	//AIDisplay();

	//loadCppCodes(); writeInjectionsRepeat();

	CodeEnd();

	MakeASM(TextPath, OutputAsmPath);

	// TODO: Automate setting code menu headers in GCTRM asm files. Can see addresses if you set breakpoint, then view variables in hex in Code Menu.h
	// TODO: Commit main repo, then pull from pull repo, then do VSDSync

	// Assemble using GCTRM
	if (RunGCTRM) {
		string GCTRMExePath = BuildFolder + "\\GCTRealMate.exe";
#if DOLPHIN_BUILD
		string mainGCTTextfile = BuildFolder + "\\NETPLAY.txt";
		string boostGCTTextfile = BuildFolder + "\\NETBOOST.txt";
#else	
		string mainGCTTextfile = BuildFolder + "\\RSBE01.txt";
		string boostGCTTextfile = BuildFolder + "\\BOOST.txt";
#endif
		system(("\"\"" + GCTRMExePath + "\"" + " -g -l \"" + mainGCTTextfile + "\"\"").c_str());
		system(("\"\"" + GCTRMExePath + "\"" + " -g -l \"" + boostGCTTextfile + "\"\"").c_str());
	}

	if (CommitPull) {
		//system(("git -C \"" + RepoFolder + "\" config user.email \"codemenu@gmail.com\"").c_str());
		//system(("git -C \"\""  + RepoFolder + "\"\" config user.email \"Code Menu\"").c_str());
		system(("git -C "  + RepoFolder + " commit -a -m \"Modified Code Menu\"").c_str());
		system(("git -C " + PullFolder + " pull origin " + BranchName).c_str());
	}


	if (RunVSDSync) {
	
		system(("\"\"" + VSDExePath + "\"\"").c_str());
	}

}