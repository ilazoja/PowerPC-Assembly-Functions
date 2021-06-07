######################################################################################
Stagelist Looter [Desi]
######################################################################################

    .alias CodeMenuStart = 0x804E 
    .alias CodeMenuHeader = 0x02DC      #Offset of word containing location of the speed modifier. Source is compiled with headers for this.

#Memory Usage
#935CE460 - Stagelist GCT and Selmap.pac File Map Location
#80495D34 - Location of SD Root inside file loaded GCT 
#80495D38 - GCT Link Return Location
#80495D3C - No longer used
#80495D40 - Location of Loaded GCT
    .BA<-StagelistCodesetStorage
    .BA->$935CE45C
PULSE
{
    mr r16, r6  #Copy Base Address to Pointer Address
    blr
}
    .BA<-Stagelist1
* 54010000 00000000     #Store location of Stagelist to Pointer Address Offset 0x10
    .BA<-Stagelist2
* 54010000 00000004
    .BA<-Stagelist3
* 54010000 00000008
    .BA<-Stagelist4
* 54010000 0000000C
    .BA<-Stagelist5
* 54010000 00000010
    .BA<-Stagelist6
* 54010000 00000014
    .BA<-Stagelist7
* 54010000 00000018
    .BA<-Stagelist8
* 54010000 0000001C
    .GOTO->SelmapStorage
StagelistCodesetStorage:
    word[8] |
    0, 0, 0, 0, 0, 0, 0, 0
Stagelist1:
    string "/stage/stagelist/Project+Stagelist.gct"
Stagelist2:
    string "/stage/stagelist/LegacyMPStagelist.GCT"
Stagelist3:
    string "/stage/stagelist/Project+Stagelist.gct"
Stagelist4:
    string "/stage/stagelist/Project+Stagelist.gct"
Stagelist5:
    string "/stage/stagelist/Project+Stagelist.gct"
Stagelist6:
    string "/stage/stagelist/Project+Stagelist.gct"
Stagelist7:
    string "/stage/stagelist/Project+Stagelist.gct"
Stagelist8:
    string "/stage/stagelist/Project+Stagelist.gct"

SelmapStorage:
    .BA<-SelmapStringStorage
PULSE
{
    mr r16, r6  #Copy Base Address to Pointer Address
    blr
}
    .BA<-Selmap1
* 54010000 00000000     #Store location of Selmap to Pointer Address Offset 0x10
    .BA<-Selmap2
* 54010000 00000004
    .BA<-Selmap3
* 54010000 00000008
    .BA<-Selmap4
* 54010000 0000000C
    .BA<-Selmap5
* 54010000 00000010
    .BA<-Selmap6
* 54010000 00000014
    .BA<-Selmap7
* 54010000 00000018
    .BA<-Selmap8
* 54010000 0000001C
    .GOTO->SelmapCopyCode
SelmapStringStorage:
    word[8] |
    0, 0, 0, 0, 0, 0, 0, 0
Selmap1:
    string "sc_selmap.pac"  #Limited to 9 letters + .pac
Selmap2:
    string "selmapMP+.pac"
Selmap3:
    string "sc_selmap.pac"
Selmap4:
    string "sc_selmap.pac"
Selmap5:
    string "sc_selmap.pac"
Selmap6:
    string "sc_selmap.pac"
Selmap7:
    string "sc_selmap.pac"
Selmap8:
    string "sc_selmap.pac"


SelmapCopyCode:
PULSE
{
    b poststorage
    nop 
    nop 
poststorage:
    stw r7, 0x4 (r15)
    stw r8, 0x8 (r15)
    lis r6, CodeMenuStart
    lwz r6, CodeMenuHeader (r6)
    lbz r6, 0xb (r6)     #Obtain Code Menu Offset
    mulli r6, r6, 0x4
    lwzx r6, r6, r16    #Obtain Selmap String Location
    lis r7, 0x806F
    ori r7, r7, 0xF3F7 
    lwz r8, 0 (r6)
    stw r8, 0 (r7)
    lwz r8, 4 (r6)
    stw r8, 4 (r7)
    lwz r8, 8 (r6)
    stw r8, 8 (r7)
    lis r7, 0x817F
    ori r7, r7, 0x637C
    lwz r8, 0 (r6)
    stw r8, 0 (r7)
    lwz r8, 4 (r6)
    stw r8, 4 (r7)
    lbz r8, 8 (r6)
    stb r8, 8 (r7)
    lwz r7, 0x4 (r15)
    lwz r8, 0x8 (r15)
    blr
}


#On the SSS, this will load based off of the code menu.
#On boot, CSS Load, and Results Screen load, it will load the default SSS. This prevents this from going anywhere beyond the SSS.
SSS:
HOOK @ $806C8D88       #Fileload on SSS Load
{
    stw r0, -4(r1)         #\Stack Frame 
    mflr r0                #|
    stw r0, 4(r1)          #|
    mfctr r0               #|
    stw r0, -8(r1)         #|
    stwu r1, -132(r1)      #|
    stmw r3, 8(r1)         #/

    li r18, 0
    li r19, 0

    lis r31, 0x935C			#\Setup File Loader at 935CE480
    ori r31, r31, 0xE460
    lwz r3, -4 (r31)
    lis r30, CodeMenuStart
    lwz r30, CodeMenuHeader (r30)
    lbz r30, 0xB (r30)        #OBtain Codemenu Offset
    mulli r30, r30, 0x4
    lwzx r30, r3, r30       #Obtain Stagelist File based on
    stw r30, 0 (r31)

    lis r30, 0x8049			#|Load storage allocation within GCT
    ori r30, r30, 0x5D40    #|
    lwz r30, 0 (r30)		#|
    stw r30, 12(r31)		#/

    li r30, 0x0				#\Initialize Data
    stw r30, 4(r31)			#|
    stw r30, 8(r31)			#|
    stw r30, 16(r31)		#/

    mr r3, r31				#\Load File
    lis r0, 0x8001			#|
    ori r0, r0, 0xBF0C		#|
    mtctr r0				#|
    bctrl 					#/

    lmw r3, 8(r1)			#\Return Stack Frame
    addi r1, r1, 0x84		#|
    lwz r0, -8(r1)			#|
    mtctr r0				#|
    lwz r0, 4(r1)			#|
    mtlr r0					#|
    lwz r0, -4(r1)			#/

    mr r31, r3 				#Original function
}

ResultsScreen:
HOOK @ $806D4858
{
    stw r0, -4(r1)         #\Stack Frame 
    mflr r0                #|
    stw r0, 4(r1)          #|
    mfctr r0               #|
    stw r0, -8(r1)         #|
    stwu r1, -132(r1)      #|
    stmw r3, 8(r1)         #/

    li r18, 0
    li r19, 0

    lis r3, 0x805B          #Check Next Scene, looted from Code Menu
    lwz r3, 0x50AC (r3)
    lwz r3, 0x10 (r3)
    lwz r3, 0x8 (r3)
    cmpwi r3, 0xA  
    beq- loadfile             #If its not scene 0xA (Results), don't bother.
    cmpwi r3, 0xd
    beq loadfile            #If its not CSS (Due to Skip to CSS), don't bother.
    b return

loadfile:
    lis r31, 0x935C			#\Setup File Loader at 935CE480
    ori r31, r31, 0xE460
    lwz r30, -4 (r31)
    lwz r30, 0 (r30)        #|Obtain Default STagelist name.
    stw r30, 0 (r31)

    lis r30, 0x8049			#\Load storage allocation within GCT
    ori r30, r30, 0x5D40    #|
    lwz r30, 0 (r30)		#|
    stw r30, 12(r31)		#/

    li r30, 0x0				#\Initialize Data
    stw r30, 4(r31)			#|
    stw r30, 8(r31)			#|
    stw r30, 16(r31)		#/

    mr r3, r31				#\Load File
    lis r0, 0x8001			#|
    ori r0, r0, 0xBF0C		#|
    mtctr r0				#|
    bctrl 					#/

return:
    lmw r3, 8(r1)			#\Return Stack Frame
    addi r1, r1, 0x84		#|
    lwz r0, -8(r1)			#|
    mtctr r0				#|
    lwz r0, 4(r1)			#|
    mtlr r0					#|
    lwz r0, -4(r1)			#/
    mr r3, r31        #Original Operation
}



CSS:    #This is needed for modes like Training. Otherwise, it'd just be the Results one after boot loads.
HOOK @ $806C87C4       #Fileload on CSS Load
{
    stw r0, -4(r1)         #\Stack Frame 
    mflr r0                #|
    stw r0, 4(r1)          #|
    mfctr r0               #|
    stw r0, -8(r1)         #|
    stwu r1, -132(r1)      #|
    stmw r3, 8(r1)         #/
    
    li r18, 0
    li r19, 0

    lis r31, 0x935C			#\Setup File Loader at 935CE480
    ori r31, r31, 0xE460
    lwz r30, -4 (r31)
    lwz r30, 0 (r30)        #|Obtain Default STagelist name.
    stw r30, 0 (r31)

    lis r30, 0x8049			#\Load storage allocation within GCT
    ori r30, r30, 0x5D40    #|
    lwz r30, 0 (r30)		#|
    stw r30, 12(r31)		#/

    li r30, 0x0				#\Initialize Data
    stw r30, 4(r31)			#|
    stw r30, 8(r31)			#|
    stw r30, 16(r31)		#/

    mr r3, r31				#\Load File
    lis r0, 0x8001			#|
    ori r0, r0, 0xBF0C		#|
    mtctr r0				#|
    bctrl 					#/

    lmw r3, 8(r1)			#\Return Stack Frame
    addi r1, r1, 0x84		#|
    lwz r0, -8(r1)			#|
    mtctr r0				#|
    lwz r0, 4(r1)			#|
    mtlr r0					#|
    lwz r0, -4(r1)			#/

    li r3, 0x0 			#Original function
}

Boot:
HOOK @ $8002d528       #Fileload on Boot
{
    stw r0, -4(r1)         #\Stack Frame 
    mflr r0                #|
    stw r0, 4(r1)          #|
    mfctr r0               #|
    stw r0, -8(r1)         #|
    stwu r1, -132(r1)      #|
    stmw r3, 8(r1)         #/

    lis r31, 0x935C			#\Setup File Loader at 935CE480
    ori r31, r31, 0xE460
    lwz r30, -4 (r31)
    lwz r30, 0 (r30)        #|Obtain Default STagelist name.
    stw r30, 0 (r31)
    lis r30, 0x8049			#\Load storage allocation within GCT
    ori r30, r30, 0x5D40    #|
    lwz r30, 0 (r30)		#|
    stw r30, 12(r31)		#/

    li r30, 0x0				#\Initialize Data
    stw r30, 4(r31)			#|
    stw r30, 8(r31)			#|
    stw r30, 16(r31)		#/

    mr r3, r31				#\Load File
    lis r0, 0x8001			#|
    ori r0, r0, 0xBF0C		#|
    mtctr r0				#|
    bctrl 					#/

    lmw r3, 8(r1)			#\Return Stack Frame
    addi r1, r1, 0x84		#|
    lwz r0, -8(r1)			#|
    mtctr r0				#|
    lwz r0, 4(r1)			#|
    mtlr r0					#|
    lwz r0, -4(r1)			#/

    li r31, 0 			#Original function
}

PULSE
{
    lis r16, 0x8049         #\
	ori r16, r16, 0x5D38    #|Store GCT Link Return Location
	stw r15, 0 (r16)        #/

    lis r16, 0x8049			#|Check if the file loaded
    ori r16, r16, 0x5D40    #|
    lwz r16, 0 (r16)		#|
    lwz r6, 0 (r16)
    cmpwi r6, 0
    beq- Return             #|The allocation is set to be all zero. If its not, a GCT exists in there.

    mr r15, r16
    li r4, 0x8 
Return:
	blr                     #MultiGCT goes brrrrrrrrrr
}
.RESET

