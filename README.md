# PowerPC-Assembly-Functions

## Requirements
- Visual Studio. You can get the community version for free. https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=16

## Code Menu

### Setup 

These steps only need to be done once unless you switch the folder location of your build:

1. Clone this repository

2. Open **PowerPC Assembly Functions.sln** in Visual Studio

3. Find **OutputAsmPath** in **MainCode.cpp** (under the **Source Files** folder) and modify the path parameter to the location of CodeMenu.asm in your build (in P+ it's in *\Project+\Source\Project+\CodeMenu.asm*)

Note: DOLPHIN_BUILD denotes the netplay version. Modify both paths if you plan to use the offline and netplay launcher. (In P+, the location of the netplay code menu asm is in *\Project+\Source\Netplay\Net-CodeMenu.asm*)

4. Find **static fstream MenuFile** in **Code Menu.h** (under the **Header Files** folder) and modify the path to the location of data.cmnu in your build (in P+ it's in *\Project+\pf\menu3\data.cmnu* for the offline version and *\Project+\pf\menu3\dnet.cmnu* for the netplay version)

#### Optional

5. If you'd like to create the netplay version of the code menu, find **DOLPHIN_BUILD** in **PowerPC Assembly Instructions.h** (under the Source Files folder) and set it to *true*. The only difference between the regular and Netplay versions of the Code Menu is that the Netplay version automatically saves replays to the NAND.

6. If you'd like to assemble the GCTs automatically (as opposed to dragging the codesets to GCTRM yourself after running the program), find **BuildFolder** in **MainCode.cpp** and set the path of your build folder (e.g. Project+), then set **RunGCTRM** to *true*. This will assemble all the codes in your P+ build referenced in RSBE01.txt and BOOST.txt (offline) and NETPLAY.txt and NETBOOST.txt (netplay) using the GCTRM.exe in the build folder.

7. If you'd like to sync your sd.raw using Virtual SD Sync after assembling the GCTs, find **VSDExePath** in **MainCode.cpp** and set the path to the VSDSync.exe, then set **RunVSDSync** to *true*. You must setup [VSDSync](http://forums.kc-mm.com/index.php?topic=79470) of course first

### [Editing the Code Menu](Code%20Menu%20Editing.md)


### Run

After you've edited the code menu code, run the program to construct it by clicking the **Local Windows Debugger** (located in the top middle of the Visual Studio window, you'll see the green arrow icon) to run the code.

After the code is ran, you'll be greeted with a Debug Console window. When instructed, press the keys if prompted. You are now done using Visual Studio and may close it if you like (make sure to save your open stuff before doing so to make sure you don’t have to do it again)

If you did step 6, and no errors were generated when you ran the program, the new code menu should be successfully put in the build and you should be good to go. Otherwise, you will have to drag the RSBE01.txt in your build into GCTRM-Log.bat to assemble the gct.

## Credits

Fracture for the [original repository, ASM functions and code menu](https://github.com/Fracture17/PowerPC-Assembly-Functions)

DesiacX for the [extended code menu](https://github.com/DesiacX/PowerPC-Assembly-Functions) and [ASM](GCTRM%20Codes)

Eon, PyotrLuzhin, wiiztec for [ASM](GCTRM%20Codes)

DukeItOut for GCTRM

Syvkal for [Virtual SD Sync](http://forums.kc-mm.com/index.php?topic=79470)

KingJigglypuff for the original [code menu editing guide](https://docs.google.com/document/d/10Mkn__2bbG-yuMIh7e2zVK1TWh2HClrNWuz7diRLW9M/edit) for P+EX
