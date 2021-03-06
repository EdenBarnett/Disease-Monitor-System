﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FLU-HomePage.aspx.cs" Inherits="ChartSample.WebForm1" %>


<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
        <title></title>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <style type="text/css">
            .auto-style1 {
                font-size: medium;
            }
        </style>
    </head>
<body>
    <form id="form1" runat="server">             
     <h1 align ="center" style="background-color: #99CCFF"> Disease Monitor System - Flu</h1>
       <table align ="center">              
          <tr> <td><div style="height:auto; width:950px">&nbsp;<asp:Button ID="Button1" runat="server" ForeColor="Black" OnClick="Button1_Click" Text="Go to Cancer page" />
             </div> </td></tr>
            
            <tr>
                
                <td colspan="3">
                    <h3 style="width: 999px; margin-left: 0px"><em><span class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp; I. Visualization1 - Geographical Heat Map for Flu</span></em></h3>
                    <div id="chart_container" style="border:solid;border-width:1px;height:600px; width:950px">        
                    
                    </div>
                    <h3 style="width: 999px; margin-left: 0px"><em><span class="auto-style1">&nbsp;&nbsp;&nbsp; II. Visualization2 - Real-time Tweets count for Flu</span></em></h3>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>                    
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td colspan="3">
                    <div id="Div1" style="border:solid;border-width:1px;height:450px; width:950px">                                
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                    <asp:Timer runat="server" id="UpdateTimer" interval="5000" ontick="UpdateTimer_Tick" />
                    <asp:UpdatePanel runat="server" id="TimedPanel" updatemode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger controlid="UpdateTimer" eventname="Tick" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Chart ID="Chart3" runat="server" Height="423px" Width="950px">            
                    <Series> 
                        <asp:Series Name="RealTimeSerious" YValueType="Int32" ChartType="Line" ChartArea="RealtimeCount" CustomProperties="PieLabelStyle=Outside" >                                         
                    </asp:Series> 
                    </Series> 
                    <ChartAreas>
                        <asp:ChartArea Name="RealtimeCount">
                        </asp:ChartArea>
                    </ChartAreas>
                    </asp:Chart>   

                    </ContentTemplate>
                    </asp:UpdatePanel>                                                 
                    </div>
                </td>
            </tr>
           <tr><td>&nbsp;</td></tr>
            <tr>
           
                      
            <td colspan="3" style="background-color: #FFFFFF" >
                <h3 style="width: 999px; margin-left: 0px"><em><span class="auto-style1">&nbsp;</span></em></h3>
                <h3 style="width: 999px; margin-left: 0px"><em><span class="auto-style1">&nbsp;&nbsp;&nbsp; III. Visualization3 - Pie-chart Distribution of Flu symptoms</span></em></h3>
                    <div id="Div2" style="height:550px; width:950px"> 
            <asp:Chart ID="Chart2" runat="server" height="500px" Width="950">            
            <Series> 
                <asp:Series Name="FluSymptoms" YValueType="Int32" ChartType="Pie" ChartArea="ChartArea2" CustomProperties="PieLabelStyle=Outside" >                                         
                </asp:Series> 
            </Series> 
            <ChartAreas>
                <asp:ChartArea Name="ChartArea2" Area3DStyle-Enable3D="True" Area3DStyle-Inclination="40">
<Area3DStyle Enable3D="True" Inclination="40"></Area3DStyle>
                </asp:ChartArea>
            </ChartAreas>
                <BorderSkin BorderColor="White" />
            </asp:Chart> 
            </div>
            </td>            
            </tr>

       </table> 
       
        </form>
</body>
</html>
