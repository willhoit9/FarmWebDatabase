<%@ Page Title="" Language="VB" MasterPageFile="~/Farm.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



<div id="loginBody">
    <div id="loginHeader">
    <h2>
        Login
    </h2>

    </div>
    <div id="loginMain">
    
        <div id="loginBox">
            <asp:Login ID="LoginUser" runat="server" Height="218px" Width="373px" 
                CssClass="loginUser">
                <LayoutTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0" style="height:218px;width:373px;">
                                    <tr>
                                        <td align="center" colspan="2">
                                            <%--Log In--%></td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                ToolTip="User Name is required." ValidationGroup="LoginUser">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                ControlToValidate="Password" ErrorMessage="Password is required." 
                                                ToolTip="Password is required." ValidationGroup="LoginUser">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <%--<asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />--%>

                                                        <asp:LoginView id="LoginView1" runat="server">


                                                            <RoleGroups>
                                                                <asp:RoleGroup Roles="admin">
                                                                    <ContentTemplate>
                                                                       You are an Administrator and should have access to the full site.
                                                                    </ContentTemplate>
                                                                </asp:RoleGroup>
                                                                <asp:RoleGroup Roles="worker">
                                                                    <ContentTemplate>
                                                                     Hello <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>. 
                                                                        You are currently logged in. If you see this login box, you are unable to access this page due to role restrictions. 
                                                                        Click 
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/DBWorkers/WorkerHome.aspx">Here </asp:LinkButton>
                                                                        to return back to the worker home page.
                                                                    </ContentTemplate>
                                                                </asp:RoleGroup>
                                                            </RoleGroups>
                                                        </asp:LoginView>
 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                                ValidationGroup="LoginUser" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
    
       
    
            </asp:Login>
        <%--<asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Register </asp:HyperLink> if you don't have an account.--%>
        </div>
    </div>
</div>










</asp:Content>

