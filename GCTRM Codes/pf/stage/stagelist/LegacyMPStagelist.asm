########################################################################
Stagelist Looter Data  [Desi]
########################################################################
    .alias StagelistDataLocationHigh = 0x8049
    .alias StagelistDataLocationLow = 0x5D3C
PULSE
{
    lis r16, StagelistDataLocationHigh
    lwz r16, StagelistDataLocationLow (r16)
    blr
}
    .BA<-StagelistRoot
* 54010000 0000000C     #Store to Pointer Address
	.BA<-StagePacPath
* 54010000 00000010
	.BA<-StageModulePath
* 54010000 00000014
	.BA<-CSERoot
* 54010000 00000018
    .BA<-FileNameFolder
	.BA->$8053EFE4
	.BA<-FileNameLocation
	.BA->$8053EFE8
	.BA<-FileNameLocation2
	.BA->$8053EFEC	
	.BA<-FileNameLocation3
	.BA->$8053CFF8	
	.BA<-FileNameLocation4
	.BA->$8053EFB4
    .BA<-TABLE_STAGES
    .BA->$80495D00
    .BA<-TABLE_1
    .BA->$80495D04
    .BA<-TABLE_2
    .BA->$80495D08
    .BA<-TABLE_3
    .BA->$80495D0C
    .BA<-TABLE_4
    .BA->$80495D10
    .BA<-TABLE_5
    .BA->$80495D14
    .RESET
    .GOTO->SkipData

#Any SD Root must be 8 letters.
StagelistRoot:
	string "/LegacyMP/"	#This SD Root applies to all Stagelist Related Files except BRSTMs.
CSERoot:
	string "/LegacyMP/"	#This SD Root applies to BRSTMs. 
FileNameFolder:		
	string "/LegacyMP/pf/stage/"	#This is the prefix for FileNameLocation 1 and 2. SD Root and pf (Lowercase) are required for locations outside of the builds SD Root.
FileNameLocation:
	string "stageslot/"
FileNameLocation2:
	string "stageinfo/"	
FileNameLocation3: 		#This is where the Tracklist Configs are loaded from. SD Root and pf (Lowercase) are required for locations outside of the builds SD Root.
	string "/LegacyMP/pf/sound/tracklist/"
FileNameLocation4:		
	string "pf/sound/"
StagePacPath:			#Do not change /STAGE/MELEE/. It needs to be all caps. If you edit STG, beware that there is a file legnth limit on the Stage Title.
	string "/STAGE/MELEE/STG"
StageModulePath:		#This is the path used by Stage Modules. SD Root and pf (Lowercase) are required for locations outside of the builds SD Root.
	string "DVD:/LegacyMP/pf/module/"

TABLE_1:
	byte[10] |
0x15, | # Wario Land
0x18, | # Fountain of Dreams
0x01, | # Final Destination
0x04, | # Metal Cavern
0x23, | # Dream Land
0x1C, | # Green Hill Zone
0x1A, | # Smashville
0x00, | # Battlefield
0x28, | # Pokemon Stadium 2
0x02  | # Delfino's Secret

TABLE_2:
	byte[33] |
0x09, | # Hyrule Castle
0x52, | # Pokemon Stadium 1
0x1B, | # Shadow Moses Island
0x06, | # Kongo Jungle
0x19, | # Fourside
0x22, | # Onett
0x26, | # Big Blue
0x11, | # Port Town Aero Dive
0x13, | # Flat Zone 2
0x0E, | # Lylat Cruise
0x12, | # Infinite Glacier
0x24, | # Peach's Castle
0x0F, | # Saffron City
0x03, | # Luigi's Mansion
0x33, | # Jungle Japes
0x25, | # Corneria
0x27, | # Brinstar
0x1F, | # Temple
0x08, | # Pirate Ship
0x10, | # Spear Pillar
0x14, | # Castle Siege
0x0C, | # Yoshi's Island
0x20, | # Yoshi's Story
0x05, | # Bowser's Castle
0x2B, | # Training Room
0x07, | # Rumble Falls
0x0D, | # Halberd
0x0B, | # Frigate Orpheon
0x17, | # Skyworld
0x2F, | # Hanenbow
0x1D, | # PictoChat
0x0A, | # Metroid Lab
0x16  | # Distant Planet

TABLE_3:
	byte[37] |
0x31,  | # Dinosaur Land
0x2D,  | # Mario Circuit
0x38,  | # Mushroom Kingdom
0x3B,  | # Rainbow Cruise
0x45,  | # Dr. Mario
0x4B,  | # Boggly Woods
0x49,  | # Delfino Plaza
0x47,  | # Mario Galaxy
0x32,  | # Oil Drum Alley
0x21,  | # Golden Temple
0x36,  | # Cookie Country
0x51,  | # Gerudo Valley
0x44,  | # Ganon's Castle
0x2E,  | # Clock Town
0x4E,  | # Bridge of Eldin
0x4D,  | # Lanayru Desert
0x3C,  | # Poke Floats
0x34,  | # Bell Tower
0x35,  | # Norfair
0x39,  | # WarioWare, Inc.
0x37,  | # Venus Lighthouse
0x2C,  | # Dracula's Castle
0x1E,  | # Sky Sanctuary Zone
0x30,  | # Dead Line
0x46,  | # Windy Hill Zone
0x48,  | # Studiopolis
0x4A,  | # Snag Trophies
0x3A,  | # Subspace
0x50,  | # Gaur Plain
0x4C,  | # Boxing Ring
0x3F,  | # Suzaku Castle
0x40,  | # Wily Castle
0x41,  | # Midgar
0x3D,  | # Tower of Heaven
0x3E,  | # Outer Wall
0x4F,  | # Dive into the Heart
0x42   | # Mementos

TABLE_4:	# Unused
TABLE_5:	# Unused

TABLE_STAGES:
# Table of icon<->stage slot associations
half[83] |	# Stage Count + 2
| # OLD SLOTS
0x0101, 0x0202, 0x0303, 0x0404, | # Battlefield, Final Destination, Delfino's Secret, Luigi's Mansion
0x0505, 0x0606, 0x0707, 0x0808, | # Metal Cavern, Bowser's Castle, Kongo Jungle, Rumble Falls
0x0909, 0x330A, 0x492C, 0x0C0C, | # Pirate Ship, Hyrule Castle, Metroid Lab, Frigate Orpheon
0x0D0D, 0x0E0E, 0x130F, 0x1410, | # Yoshi's Island, Halberd, Lylat Cruise, Saffron City
0x1511, 0x1612, 0x1713, 0x1814, | # Spear Pillar, Port Town Aero Dive, Infinite Glacier, Flat Zone 2
0x1915, 0x1C16, 0x1D17, 0x1E18, | # Castle Siege, Wario Land, Distant Planet, Skyworld
0x1F19, 0x201A, 0x211B, 0x221C, | # Fountain of Dreams, Fourside, Smashville, Shadow Moses Island
0x231D, 0x241E, 0x4326, 0x2932, | # Green Hill Zone, PictoChat, Sky Sanctuary, Temple
0x2A33, 0x472A, 0x2C35, 0x2D36, | # Yoshi's Story, Golden Temple, Onett, Dream Land
0x2F37, 0x3038, 0x3139, 0x323A, | # Rainbow Cruise, Corneria, Big Blue, Brinstar
0x2E3B, 0xFF64, 0xFF64, 0x373C, | # Pokemon Stadium 2, NOTHING, NOTHING, Training Room
| # NEW SLOTS
0x4023, 0x4124, 0x4225, 0x251F, | # Dracula's Castle, Mario Circuit, Clock Town, Hanenbow
0x4427, 0x4528, 0x4629, 0x2B34, | # Dead Line, Dinosaur Land, Oil Drum Alley, Jungle Japes
0x482B, 0x0B0B, 0x4A2D, 0x4B2E, | # Bell Tower, Norfair, Cookie Country, Venus Lighthouse
0x4C2F, 0x4D30, 0x4E31, 0x4F3D, | # Mushroom Kingdom, WarioWare, Subspace, Rainbow Cruise
0x503E, 0x513F,	0x5240, 0x5341,	| # Poke Floats, Tower of Heaven, Outer Wall, Suzaku Castle
0x5442, 0x5543, 0x5644, 0xFF64,	| # Wily Castle, Midgar, Mementos, NOTHING
0x5846, 0x5947, 0x5A48, 0x5B49,	| # Ganon's Castle, Dr. Mario, Windy Hill Zone, Mario Galaxy
0x5C4A, 0x5D4B,	0x5E4C, 0x5F4D,	| # Studiopolis, Delfino Plaza, Snag Trophies, Boggly Woods
0x604E, 0x614F,	0x6255, 0x6356,	| # Boxing Ring, Lanayru Desert, Bridge of Eldin, Dive into the Heart
0x6457, 0x6558, 0x6659		| # Gaur Plain, Gerudo Valley, Pokemon Stadium 1

SkipData:
byte 10 @ $806B929C # Page 1
byte 33 @ $806B92A4 # Page 2
byte 37 @ $80496002 # Page 3
byte 00 @ $80496003 # Page 4 (Unused)
byte 00 @ $80496004 # Page 5 (Unused)
byte 80 @ $800AF673 # Stage Count


PULSE       #Setup GCT Link Return
{
    lis r16, StagelistDataLocationHigh
	lwz r16, StagelistDataLocationLow (r16)
	lwz r16, 8 (r16)
    addi r16, r16, 0x30
    lis r6, 0x8000
    stw r16, 0x1848 (r6)
	blr
}

* 64000000 00000000     #GCT Link Return