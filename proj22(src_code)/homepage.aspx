<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" AutoEventWireup="true"
    CodeFile="homepage.aspx.cs" Inherits="homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .content
        {
            position: absolute;
            top: 100px;
            background: rgba(42, 39, 44, 0.5);
            color: #f1f1f1;
            margin-left:28%;
            margin-top:15%;
            border-radius:10px;
        }
        #myVideo
        {
            object-fit: initial;
            width: 100%;
            height: 100%;
        }
        .trans
        {
            background: linear-gradient(to bottom right,#666666,#FFFFFF,#666666,#FFFFFF,#666666);
        }
        .btn
        {
            background-color: orange;
        }
        .btn:hover
        {
            background-color: #FF9933;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div>
    <div>
        <video autoplay muted loop id="myVideo">
            <source src="images\bgv2.mp4" type="video/mp4">
            Your browser does not support HTML5 video.
        </video>
    </div>
    <div class="content">
        <asp:Label ID="Label14" runat="server" Text=" Online Grocery Store &amp; Delivery"
            ForeColor="Green" Style="font-size: 40px;" class="head"></asp:Label>
        <br />
        <asp:Label ID="Label15" runat="server" Text="Better Products at the Right Price"
            ForeColor="Orange" Style="font-size: x-large" Font-Overline="True"></asp:Label>
        <br />
        <center>
        <p style="font-size: large; width: 423px; color: white;" text-align="left">
            <span>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; We are proud to be associated closely with the
                farmers from whom we source our fresh products. Most of our farm-fresh products
                are sourced directly from farmers, which not only ensures the best prices and freshest
                products for our customers but also helps the farmers get better prices. </span>
        </p>
        
        <br />
        <asp:Button ID="Button2" runat="server" Text="SHOP NOW" ForeColor="White" Style="border-radius: 5px"
            BorderStyle="None" Height="40px" Width="120px" class="btn" OnClick="Button2_Click" />
    </center>
    </div>
    </div>
</asp:Content>
