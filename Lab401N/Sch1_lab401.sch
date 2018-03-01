<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="CEO4" />
        <signal name="F50MHz" />
        <signal name="clk" />
        <signal name="BTN0" />
        <signal name="SW(7:0)" />
        <signal name="dat(3:0)" />
        <signal name="dat(7:4)" />
        <signal name="dat(11:8)" />
        <signal name="dat(15:12)" />
        <signal name="dat(15:0)" />
        <signal name="SW(7)" />
        <signal name="SW(5:4)" />
        <signal name="LED(7:0)" />
        <signal name="AN(3:0)" />
        <signal name="SEG(7:0)" />
        <signal name="ce1ms" />
        <port polarity="Input" name="F50MHz" />
        <port polarity="Input" name="BTN0" />
        <port polarity="Input" name="SW(7:0)" />
        <port polarity="Output" name="LED(7:0)" />
        <port polarity="Output" name="AN(3:0)" />
        <port polarity="Output" name="SEG(7:0)" />
        <blockdef name="VCGrey4Re">
            <timestamp>2018-2-22T9:14:22</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="VCBDmSE">
            <timestamp>2018-2-22T9:14:28</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="VCD4RE">
            <timestamp>2018-2-28T11:34:14</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="VCJmRE">
            <timestamp>2018-2-22T9:13:52</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="DISPLAY">
            <timestamp>2018-2-28T11:31:46</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="obuf8">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <rect width="64" x="0" y="-44" height="24" />
            <rect width="96" x="128" y="-44" height="24" />
        </blockdef>
        <blockdef name="GenNms1s">
            <timestamp>2018-3-1T7:14:50</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <block symbolname="VCGrey4Re" name="XLXI_1">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="CEO4" name="ce" />
            <blockpin signalname="BTN0" name="r" />
            <blockpin signalname="XLXN_1" name="CEO" />
            <blockpin name="TC" />
            <blockpin signalname="dat(3:0)" name="Y(3:0)" />
        </block>
        <block symbolname="VCBDmSE" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="ce" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="BTN0" name="s" />
            <blockpin name="TC" />
            <blockpin signalname="XLXN_2" name="CEO" />
            <blockpin signalname="dat(7:4)" name="Q(3:0)" />
        </block>
        <block symbolname="VCD4RE" name="XLXI_3">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_2" name="ce" />
            <blockpin signalname="BTN0" name="R" />
            <blockpin name="TC" />
            <blockpin signalname="XLXN_3" name="CEO" />
            <blockpin signalname="dat(11:8)" name="Q(3:0)" />
        </block>
        <block symbolname="VCJmRE" name="XLXI_4">
            <blockpin signalname="XLXN_3" name="ce" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="BTN0" name="R" />
            <blockpin name="TC" />
            <blockpin name="CEO" />
            <blockpin signalname="dat(15:12)" name="Q(3:0)" />
        </block>
        <block symbolname="DISPLAY" name="XLXI_5">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="dat(15:0)" name="dat(15:0)" />
            <blockpin signalname="SW(5:4)" name="PTR(1:0)" />
            <blockpin signalname="ce1ms" name="ce1ms" />
            <blockpin signalname="AN(3:0)" name="An(3:0)" />
            <blockpin signalname="SEG(7:0)" name="SEG(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_7">
            <blockpin signalname="F50MHz" name="I" />
            <blockpin signalname="clk" name="O" />
        </block>
        <block symbolname="obuf8" name="XLXI_8">
            <blockpin signalname="SW(7:0)" name="I(7:0)" />
            <blockpin signalname="LED(7:0)" name="O(7:0)" />
        </block>
        <block symbolname="GenNms1s" name="XLXI_11">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="ce1ms" name="ce" />
            <blockpin signalname="SW(7)" name="Tmod" />
            <blockpin signalname="CEO4" name="CEO" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1040" y="1936" name="XLXI_4" orien="R0">
        </instance>
        <instance x="1040" y="1552" name="XLXI_3" orien="R0">
        </instance>
        <instance x="1040" y="800" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1040" y="1168" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2032" y="1168" name="XLXI_5" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1504" y1="864" y2="864" x1="976" />
            <wire x2="976" y1="864" y2="1008" x1="976" />
            <wire x2="1040" y1="1008" y2="1008" x1="976" />
            <wire x2="1504" y1="640" y2="640" x1="1424" />
            <wire x2="1504" y1="640" y2="864" x1="1504" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1504" y1="1264" y2="1264" x1="976" />
            <wire x2="976" y1="1264" y2="1456" x1="976" />
            <wire x2="1040" y1="1456" y2="1456" x1="976" />
            <wire x2="1504" y1="1072" y2="1072" x1="1424" />
            <wire x2="1504" y1="1072" y2="1264" x1="1504" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1504" y1="1632" y2="1632" x1="976" />
            <wire x2="976" y1="1632" y2="1776" x1="976" />
            <wire x2="1040" y1="1776" y2="1776" x1="976" />
            <wire x2="1504" y1="1456" y2="1456" x1="1424" />
            <wire x2="1504" y1="1456" y2="1632" x1="1504" />
        </branch>
        <branch name="CEO4">
            <wire x2="976" y1="512" y2="704" x1="976" />
            <wire x2="1040" y1="704" y2="704" x1="976" />
            <wire x2="2240" y1="512" y2="512" x1="976" />
            <wire x2="2496" y1="512" y2="512" x1="2240" />
            <wire x2="2496" y1="512" y2="624" x1="2496" />
            <wire x2="2496" y1="624" y2="624" x1="2416" />
        </branch>
        <instance x="592" y="672" name="XLXI_7" orien="R0" />
        <branch name="F50MHz">
            <wire x2="592" y1="640" y2="640" x1="560" />
        </branch>
        <iomarker fontsize="28" x="560" y="640" name="F50MHz" orien="R180" />
        <branch name="clk">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="896" y="640" type="branch" />
            <wire x2="832" y1="640" y2="640" x1="816" />
            <wire x2="896" y1="640" y2="640" x1="832" />
            <wire x2="1040" y1="640" y2="640" x1="896" />
            <wire x2="832" y1="640" y2="1072" x1="832" />
            <wire x2="1040" y1="1072" y2="1072" x1="832" />
            <wire x2="832" y1="1072" y2="1392" x1="832" />
            <wire x2="1040" y1="1392" y2="1392" x1="832" />
            <wire x2="832" y1="1392" y2="1840" x1="832" />
            <wire x2="1040" y1="1840" y2="1840" x1="832" />
            <wire x2="832" y1="400" y2="640" x1="832" />
            <wire x2="1888" y1="400" y2="400" x1="832" />
            <wire x2="1888" y1="400" y2="624" x1="1888" />
            <wire x2="1888" y1="624" y2="1008" x1="1888" />
            <wire x2="2032" y1="1008" y2="1008" x1="1888" />
            <wire x2="2016" y1="624" y2="624" x1="1888" />
            <wire x2="2032" y1="624" y2="624" x1="2016" />
        </branch>
        <branch name="ce1ms">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2208" y="832" type="branch" />
            <wire x2="1968" y1="688" y2="832" x1="1968" />
            <wire x2="2192" y1="832" y2="832" x1="1968" />
            <wire x2="2208" y1="832" y2="832" x1="2192" />
            <wire x2="2480" y1="832" y2="832" x1="2208" />
            <wire x2="2480" y1="832" y2="1008" x1="2480" />
            <wire x2="2016" y1="688" y2="688" x1="1968" />
            <wire x2="2032" y1="688" y2="688" x1="2016" />
            <wire x2="2480" y1="1008" y2="1008" x1="2416" />
        </branch>
        <branch name="BTN0">
            <wire x2="688" y1="768" y2="768" x1="576" />
            <wire x2="1040" y1="768" y2="768" x1="688" />
            <wire x2="688" y1="768" y2="1136" x1="688" />
            <wire x2="1040" y1="1136" y2="1136" x1="688" />
            <wire x2="688" y1="1136" y2="1520" x1="688" />
            <wire x2="1040" y1="1520" y2="1520" x1="688" />
            <wire x2="688" y1="1520" y2="1904" x1="688" />
            <wire x2="1040" y1="1904" y2="1904" x1="688" />
        </branch>
        <iomarker fontsize="28" x="576" y="768" name="BTN0" orien="R180" />
        <branch name="SW(7:0)">
            <wire x2="560" y1="944" y2="944" x1="448" />
        </branch>
        <iomarker fontsize="28" x="448" y="944" name="SW(7:0)" orien="R180" />
        <branch name="dat(3:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1536" y="768" type="branch" />
            <wire x2="1536" y1="768" y2="768" x1="1424" />
        </branch>
        <branch name="dat(7:4)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1552" y="1136" type="branch" />
            <wire x2="1552" y1="1136" y2="1136" x1="1424" />
        </branch>
        <branch name="dat(11:8)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1552" y="1520" type="branch" />
            <wire x2="1552" y1="1520" y2="1520" x1="1424" />
        </branch>
        <branch name="dat(15:12)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1552" y="1904" type="branch" />
            <wire x2="1552" y1="1904" y2="1904" x1="1424" />
        </branch>
        <branch name="dat(15:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1904" y="1072" type="branch" />
            <wire x2="2032" y1="1072" y2="1072" x1="1904" />
        </branch>
        <branch name="SW(7)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="496" y="432" type="branch" />
            <wire x2="1488" y1="432" y2="432" x1="496" />
            <wire x2="1488" y1="432" y2="752" x1="1488" />
            <wire x2="2016" y1="752" y2="752" x1="1488" />
            <wire x2="2032" y1="752" y2="752" x1="2016" />
        </branch>
        <branch name="SW(5:4)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="416" y="2080" type="branch" />
            <wire x2="1712" y1="2080" y2="2080" x1="416" />
            <wire x2="2032" y1="1136" y2="1136" x1="1712" />
            <wire x2="1712" y1="1136" y2="2080" x1="1712" />
        </branch>
        <instance x="2064" y="1440" name="XLXI_8" orien="R0" />
        <branch name="SW(7:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1968" y="1408" type="branch" />
            <wire x2="2064" y1="1408" y2="1408" x1="1968" />
        </branch>
        <branch name="LED(7:0)">
            <wire x2="2384" y1="1408" y2="1408" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2384" y="1408" name="LED(7:0)" orien="R0" />
        <branch name="AN(3:0)">
            <wire x2="2512" y1="1072" y2="1072" x1="2416" />
        </branch>
        <branch name="SEG(7:0)">
            <wire x2="2512" y1="1136" y2="1136" x1="2416" />
        </branch>
        <iomarker fontsize="28" x="2512" y="1072" name="AN(3:0)" orien="R0" />
        <iomarker fontsize="28" x="2512" y="1136" name="SEG(7:0)" orien="R0" />
        <instance x="2032" y="784" name="XLXI_11" orien="R0">
        </instance>
    </sheet>
</drawing>