VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_50(9:0)
        SIGNAL XLXN_131(9:0)
        SIGNAL XLXN_159
        SIGNAL XLXN_157
        SIGNAL XLXN_156
        SIGNAL XLXN_132(7:0)
        SIGNAL XLXN_77(9:0)
        SIGNAL PS2D
        SIGNAL PS2C
        SIGNAL XLXN_64(7:0)
        SIGNAL XLXN_62
        SIGNAL XLXN_61
        SIGNAL XLXN_60
        SIGNAL XLXN_457
        SIGNAL XLXN_469(13:0)
        SIGNAL XLXN_470(3:0)
        SIGNAL XLXN_471(3:0)
        SIGNAL XLXN_472(3:0)
        SIGNAL XLXN_473(3:0)
        SIGNAL XLXN_474(3:0)
        SIGNAL XLXN_475(3:0)
        SIGNAL vgaRed(3:0)
        SIGNAL vgaGreen(3:0)
        SIGNAL vgaBlue(3:0)
        SIGNAL HSYNC
        SIGNAL VSYNC
        SIGNAL XLXN_490(10:0)
        SIGNAL XLXN_491(10:0)
        SIGNAL GCLK
        SIGNAL demoEnable
        SIGNAL ck100MHz
        SIGNAL ck25MHz
        SIGNAL XLXN_508(10:0)
        SIGNAL XLXN_509(10:0)
        SIGNAL XLXN_510
        PORT BiDirectional PS2D
        PORT BiDirectional PS2C
        PORT BiDirectional vgaRed(3:0)
        PORT BiDirectional vgaGreen(3:0)
        PORT BiDirectional vgaBlue(3:0)
        PORT Output HSYNC
        PORT Output VSYNC
        PORT Input GCLK
        PORT Input demoEnable
        BEGIN BLOCKDEF DispCtrl
            TIMESTAMP 2008 1 10 15 24 25
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            LINE N 64 128 0 128 
            RECTANGLE N 0 148 64 172 
            LINE N 0 160 64 160 
            RECTANGLE N 0 180 64 204 
            LINE N 0 192 64 192 
            RECTANGLE N 0 -140 64 -116 
            LINE N 64 -128 0 -128 
            RECTANGLE N 64 -256 352 224 
            RECTANGLE N 0 -28 64 -4 
            LINE N 0 -16 64 -16 
            RECTANGLE N 0 4 64 28 
            LINE N 64 16 0 16 
            RECTANGLE N 0 36 64 60 
            LINE N 64 48 0 48 
            RECTANGLE N 0 68 64 92 
            LINE N 64 80 0 80 
            RECTANGLE N 352 4 416 28 
            LINE N 352 16 416 16 
            RECTANGLE N 352 36 416 60 
            LINE N 352 48 416 48 
            RECTANGLE N 352 68 416 92 
            LINE N 352 80 416 80 
        END BLOCKDEF
        BEGIN BLOCKDEF Synchro
            TIMESTAMP 2008 1 10 15 26 7
            LINE N 64 -224 0 -224 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -76 384 -52 
            LINE N 320 -64 384 -64 
            RECTANGLE N 64 -256 320 0 
        END BLOCKDEF
        BEGIN BLOCKDEF mouse_controller
            TIMESTAMP 2008 1 10 15 24 51
            LINE N 64 -576 0 -576 
            LINE N 320 -448 384 -448 
            LINE N 64 -320 0 -320 
            RECTANGLE N 0 -396 64 -372 
            LINE N 64 -384 0 -384 
            LINE N 64 -416 0 -416 
            LINE N 64 -448 0 -448 
            LINE N 64 -480 0 -480 
            LINE N 64 -512 0 -512 
            LINE N 64 -608 0 -608 
            LINE N 320 -480 384 -480 
            LINE N 320 -512 384 -512 
            LINE N 320 -544 384 -544 
            LINE N 64 -288 0 -288 
            LINE N 4 -256 68 -256 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -204 64 -180 
            LINE N 0 -192 64 -192 
            RECTANGLE N 64 -640 320 -160 
            RECTANGLE N 320 -364 384 -340 
            LINE N 320 -352 384 -352 
            RECTANGLE N 320 -396 384 -372 
            LINE N 320 -384 384 -384 
            RECTANGLE N 320 -332 384 -308 
            LINE N 320 -320 384 -320 
        END BLOCKDEF
        BEGIN BLOCKDEF mouse_displayer
            TIMESTAMP 2006 11 22 16 24 35
            RECTANGLE N 64 -640 320 256 
            LINE N 64 -608 0 -608 
            RECTANGLE N 320 -620 384 -596 
            LINE N 320 -608 384 -608 
            RECTANGLE N 320 -588 384 -564 
            LINE N 320 -576 384 -576 
            RECTANGLE N 320 -556 384 -532 
            LINE N 320 -544 384 -544 
            LINE N 64 -576 0 -576 
            LINE N 64 -544 0 -544 
            RECTANGLE N 0 -460 64 -436 
            LINE N 64 -448 0 -448 
            RECTANGLE N 0 -492 64 -468 
            LINE N 64 -480 0 -480 
            RECTANGLE N 0 212 64 236 
            LINE N 64 224 0 224 
            RECTANGLE N 0 180 64 204 
            LINE N 64 192 0 192 
            RECTANGLE N 0 -60 64 -36 
            LINE N 64 -48 0 -48 
            RECTANGLE N 0 -92 64 -68 
            LINE N 64 -80 0 -80 
            RECTANGLE N 0 -28 64 -4 
            LINE N 64 -16 0 -16 
        END BLOCKDEF
        BEGIN BLOCKDEF ps2interface
            TIMESTAMP 2008 1 10 15 25 13
            LINE N 64 -128 0 -128 
            LINE N 64 -352 0 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -352 384 -352 
            LINE N 320 -256 384 -256 
            LINE N 384 -224 320 -224 
            RECTANGLE N 320 -204 384 -180 
            LINE N 320 -192 384 -192 
            RECTANGLE N 320 -172 384 -148 
            LINE N 384 -160 320 -160 
            LINE N 64 -320 0 -320 
            LINE N 0 -160 64 -160 
            LINE N 0 -192 64 -192 
            RECTANGLE N 64 -384 320 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd10
            TIMESTAMP 2006 10 29 15 29 4
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 2 2 12 37 29
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF VideoRom
            TIMESTAMP 2007 8 16 10 7 26
            RECTANGLE N 64 -512 240 -352 
            RECTANGLE N 240 -492 304 -468 
            LINE N 304 -480 240 -480 
            RECTANGLE N 240 -460 304 -436 
            LINE N 240 -448 304 -448 
            RECTANGLE N 240 -428 304 -404 
            LINE N 240 -416 304 -416 
            RECTANGLE N 240 -396 304 -372 
            LINE N 240 -384 304 -384 
        END BLOCKDEF
        BEGIN BLOCKDEF clkdllctrl
            TIMESTAMP 2006 11 11 20 6 22
            RECTANGLE N 64 -128 320 0 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
            LINE N 64 -96 0 -96 
        END BLOCKDEF
        BEGIN BLOCK instDispCtrl DispCtrl
            PIN clk25MHz ck25MHz
            PIN bitMouseLeftBtn XLXN_457
            PIN xPos(9:0) XLXN_131(9:0)
            PIN yPos(9:0) XLXN_50(9:0)
            PIN Hcnt(10:0) XLXN_490(10:0)
            PIN Vcnt(10:0) XLXN_491(10:0)
            PIN inRed(3:0) XLXN_470(3:0)
            PIN inGreen(3:0) XLXN_471(3:0)
            PIN inBlue(3:0) XLXN_472(3:0)
            PIN outRed(3:0) XLXN_475(3:0)
            PIN outGreen(3:0) XLXN_474(3:0)
            PIN outBlue(3:0) XLXN_473(3:0)
            PIN adrVideoMem(13:0) XLXN_469(13:0)
        END BLOCK
        BEGIN BLOCK XLXI_64 gnd
            PIN G XLXN_159
        END BLOCK
        BEGIN BLOCK XLXI_65 gnd
            PIN G XLXN_157
        END BLOCK
        BEGIN BLOCK XLXI_62 gnd
            PIN G XLXN_156
        END BLOCK
        BEGIN BLOCK instMouseController mouse_controller
            PIN clk ck100MHz
            PIN rst XLXN_157
            PIN read XLXN_61
            PIN err XLXN_60
            PIN setx XLXN_157
            PIN sety XLXN_157
            PIN setmax_x XLXN_157
            PIN setmax_y XLXN_157
            PIN rx_data(7:0) XLXN_132(7:0)
            PIN value(9:0) XLXN_77(9:0)
            PIN left XLXN_457
            PIN middle
            PIN right
            PIN new_event
            PIN write XLXN_62
            PIN tx_data(7:0) XLXN_64(7:0)
            PIN xpos(9:0) XLXN_131(9:0)
            PIN ypos(9:0) XLXN_50(9:0)
            PIN zpos(3:0)
        END BLOCK
        BEGIN BLOCK instGnd10 gnd10
            PIN busGnd(9:0) XLXN_77(9:0)
        END BLOCK
        BEGIN BLOCK instPs2Interface ps2interface
            PIN clk ck100MHz
            PIN rst XLXN_156
            PIN write XLXN_62
            PIN demoEnable demoEnable
            PIN tx_data(7:0) XLXN_64(7:0)
            PIN ps2_clk PS2C
            PIN ps2_data PS2D
            PIN read XLXN_61
            PIN busy
            PIN err XLXN_60
            PIN rx_data(7:0) XLXN_132(7:0)
        END BLOCK
        BEGIN BLOCK instVideoRom VideoRom
            PIN AdrB(13:0) XLXN_469(13:0)
            PIN outRed(3:0) XLXN_470(3:0)
            PIN outGreen(3:0) XLXN_471(3:0)
            PIN outBlue(3:0) XLXN_472(3:0)
        END BLOCK
        BEGIN BLOCK instSynchro Synchro
            PIN ck25MHz ck25MHz
            PIN HS HSYNC
            PIN VS VSYNC
            PIN Hcnt(10:0) XLXN_490(10:0)
            PIN Vcnt(10:0) XLXN_491(10:0)
        END BLOCK
        BEGIN BLOCK instClkDllCtrl clkdllctrl
            PIN ckDivOut ck25MHz
            PIN ckOut ck100MHz
            PIN ckIn GCLK
        END BLOCK
        BEGIN BLOCK instMouseDisplayer mouse_displayer
            PIN clk ck100MHz
            PIN pixel_clk ck25MHz
            PIN blank XLXN_159
            PIN xpos(9:0) XLXN_131(9:0)
            PIN ypos(9:0) XLXN_50(9:0)
            PIN hcount(10:0) XLXN_490(10:0)
            PIN vcount(10:0) XLXN_491(10:0)
            PIN red_in(3:0) XLXN_475(3:0)
            PIN green_in(3:0) XLXN_474(3:0)
            PIN blue_in(3:0) XLXN_473(3:0)
            PIN red_out(3:0) vgaRed(3:0)
            PIN green_out(3:0) vgaGreen(3:0)
            PIN blue_out(3:0) vgaBlue(3:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH XLXN_50(9:0)
            WIRE 1824 1248 2048 1248
            WIRE 2048 1248 2624 1248
            WIRE 2048 1120 2144 1120
            WIRE 2048 1120 2048 1248
        END BRANCH
        BEGIN BRANCH XLXN_131(9:0)
            WIRE 1824 1216 2016 1216
            WIRE 2016 1216 2624 1216
            WIRE 2016 1088 2144 1088
            WIRE 2016 1088 2016 1216
        END BRANCH
        BEGIN BRANCH XLXN_159
            WIRE 2528 480 2624 480
        END BRANCH
        BEGIN INSTANCE instDispCtrl 2144 928 R0
        END INSTANCE
        BEGIN BRANCH XLXN_132(7:0)
            WIRE 1344 1376 1440 1376
        END BRANCH
        BEGIN BRANCH XLXN_77(9:0)
            WIRE 1344 1072 1392 1072
            WIRE 1392 1072 1392 1216
            WIRE 1392 1216 1440 1216
        END BRANCH
        BEGIN BRANCH PS2D
            WIRE 512 1408 960 1408
        END BRANCH
        BEGIN BRANCH PS2C
            WIRE 512 1376 960 1376
        END BRANCH
        BEGIN BRANCH XLXN_64(7:0)
            WIRE 1344 1408 1440 1408
        END BRANCH
        BEGIN BRANCH XLXN_62
            WIRE 1344 1344 1440 1344
        END BRANCH
        BEGIN BRANCH XLXN_61
            WIRE 1344 1312 1440 1312
        END BRANCH
        BEGIN BRANCH XLXN_60
            WIRE 1344 1280 1440 1280
        END BRANCH
        BEGIN BRANCH XLXN_457
            WIRE 1824 1056 2144 1056
        END BRANCH
        BEGIN INSTANCE instVideoRom 1808 1392 R0
        END INSTANCE
        BEGIN INSTANCE instSynchro 1440 864 R0
        END INSTANCE
        BEGIN BRANCH XLXN_469(13:0)
            WIRE 2112 912 2144 912
        END BRANCH
        BEGIN BRANCH XLXN_470(3:0)
            WIRE 2112 944 2144 944
        END BRANCH
        BEGIN BRANCH XLXN_471(3:0)
            WIRE 2112 976 2144 976
        END BRANCH
        BEGIN BRANCH XLXN_472(3:0)
            WIRE 2112 1008 2144 1008
        END BRANCH
        BEGIN BRANCH XLXN_473(3:0)
            WIRE 2560 1008 2624 1008
        END BRANCH
        BEGIN BRANCH XLXN_474(3:0)
            WIRE 2560 976 2624 976
        END BRANCH
        BEGIN BRANCH XLXN_475(3:0)
            WIRE 2560 944 2624 944
        END BRANCH
        BEGIN BRANCH vgaRed(3:0)
            WIRE 3008 416 3088 416
        END BRANCH
        BEGIN BRANCH vgaGreen(3:0)
            WIRE 3008 448 3072 448
        END BRANCH
        BEGIN BRANCH vgaBlue(3:0)
            WIRE 3008 480 3088 480
        END BRANCH
        BEGIN INSTANCE instClkDllCtrl 544 880 R0
        END INSTANCE
        BEGIN BRANCH HSYNC
            WIRE 1824 640 1840 640
            WIRE 1840 208 3152 208
            WIRE 1840 208 1840 640
        END BRANCH
        BEGIN BRANCH VSYNC
            WIRE 1824 704 1888 704
            WIRE 1888 240 1888 704
            WIRE 1888 240 3152 240
        END BRANCH
        BEGIN BRANCH XLXN_490(10:0)
            WIRE 1824 768 1968 768
            WIRE 1968 768 2144 768
            WIRE 1968 544 2624 544
            WIRE 1968 544 1968 768
        END BRANCH
        BEGIN BRANCH XLXN_491(10:0)
            WIRE 1824 800 2016 800
            WIRE 2016 800 2144 800
            WIRE 2016 576 2624 576
            WIRE 2016 576 2016 800
        END BRANCH
        IOMARKER 512 1408 PS2D R180 28
        IOMARKER 512 1376 PS2C R180 28
        BEGIN BRANCH GCLK
            WIRE 512 784 544 784
        END BRANCH
        BEGIN BRANCH demoEnable
            WIRE 592 1440 960 1440
        END BRANCH
        BEGIN BRANCH ck100MHz
            WIRE 928 848 944 848
            WIRE 944 848 944 992
            WIRE 944 992 944 1216
            WIRE 944 1216 960 1216
            WIRE 944 992 1440 992
            WIRE 944 416 1152 416
            WIRE 1152 416 2624 416
            WIRE 944 416 944 848
            BEGIN DISPLAY 1152 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 512 784 GCLK R180 28
        BEGIN BRANCH XLXN_156
            WIRE 880 1248 960 1248
        END BRANCH
        INSTANCE XLXI_62 752 1184 R90
        BEGIN INSTANCE instPs2Interface 960 1568 R0
        END INSTANCE
        BEGIN INSTANCE instGnd10 960 1104 R0
        END INSTANCE
        BEGIN BRANCH ck25MHz
            WIRE 928 784 1104 784
            WIRE 1104 784 1392 784
            WIRE 1392 448 1392 640
            WIRE 1392 640 1440 640
            WIRE 1392 640 1392 784
            WIRE 1392 448 2112 448
            WIRE 2112 448 2624 448
            WIRE 2112 448 2112 704
            WIRE 2112 704 2144 704
            BEGIN DISPLAY 1104 784 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_157
            WIRE 1360 896 1424 896
            WIRE 1424 896 1424 1024
            WIRE 1424 1024 1424 1088
            WIRE 1424 1088 1424 1120
            WIRE 1424 1120 1424 1152
            WIRE 1424 1152 1440 1152
            WIRE 1424 1152 1424 1184
            WIRE 1424 1184 1440 1184
            WIRE 1424 1120 1440 1120
            WIRE 1424 1088 1440 1088
            WIRE 1424 1024 1440 1024
        END BRANCH
        BEGIN INSTANCE instMouseController 1440 1600 R0
        END INSTANCE
        INSTANCE XLXI_65 1232 832 R90
        IOMARKER 592 1440 demoEnable R180 28
        INSTANCE XLXI_64 2400 416 R90
        BEGIN INSTANCE instMouseDisplayer 2624 1024 R0
        END INSTANCE
        IOMARKER 3088 416 vgaRed(3:0) R0 28
        IOMARKER 3088 480 vgaBlue(3:0) R0 28
        IOMARKER 3072 448 vgaGreen(3:0) R0 28
        IOMARKER 3152 208 HSYNC R0 28
        IOMARKER 3152 240 VSYNC R0 28
    END SHEET
END SCHEMATIC
