# PowerPC-Assembly-Functions

## Code Menu

### Setup

1. Open **PowerPC Assembly Functions.sln** in Visual Studio

2. Find **OutputAsmPath** in **MainCode.cpp** (under the **Source Files** folder) and modify the path parameter to the location of CodeMenu.asm in your build (in P+ it's in \Project+\Source\Project+\CodeMenu.asm)

Note: DOLPHIN_BUILD denotes the netplay version. Modify both paths if you plan to use the offline and netplay launcher. (In P+, the location of the netplay code menu asm is in \Project+\Source\Netplay\Net-CodeMenu.asm)

3. Find **static fstream MenuFile** in **Code Menu.h** (under the **Header Files** folder) and modify the path to the location of data.cmnu in your build (in P+ it's in \Project+\pf\menu3\data.cmnu for the offline version and \Project+\pf\menu3\dnet.cmnu for the netplay version)

#### Optional

4. If you'd to create the netplay version of the code menu, find **DOLPHIN_BUILD** in **PowerPC Assembly Instructions.h** (under the Source Files folder) and set it to *true*.

5. If you'd like to assemble the GCTs automatically (as opposed to dragging the codesets to GCTRM yourself after running the program), find **BuildFolder** in **MainCode.cpp** and set the path of your build folder (e.g. Project+), then set **RunGCTRM** to *true*. This will assemble all the codes in your P+ build referenced in RSBE01.txt and BOOST.txt (offline) and NETPLAY.txt and NETBOOST.txt (netplay) using the GCTRM.exe in the build folder.

6. If you'd like to sync your sd.raw after assembling the ASM using Virtual SD Sync, find **VSDExePath** in **MainCode.cpp** and set the path to the VSDSync.exe, then set **RunVSDSync** to **true**. You must setup [VSDSync](http://forums.kc-mm.com/index.php?topic=79470) of course first


### Run

After you've edited the code menu code, run the program to construct it by clicking the **Local Windows Debugger** (located in the top middle of the Visual Studio window, you'll see the green arrow icon) to run the code).

After the code is ran, you'll be greeted with a Debug Console window. When instructed, press the keys if prompted. You are now done using Visual Studio and may close it if you like (make sure to save your open stuff before doing so to make sure you don’t have to do it again)

## Credits

Fracture for the [original repository, ASM functions and code menu]((https://github.com/Fracture17/PowerPC-Assembly-Functions))

DesiacX for the [extended code menu](https://github.com/DesiacX/PowerPC-Assembly-Functions) and [ASM](GCTRM%20Codes)

Eon, PyotrLuzhin, wiiztec for [ASM](GCTRM%20Codes)

DukeItOut for GCTRM

Syvkal for [Virtual SD Sync](http://forums.kc-mm.com/index.php?topic=79470)

KingJigglypuff for the original code menu editing guide for P+EX
