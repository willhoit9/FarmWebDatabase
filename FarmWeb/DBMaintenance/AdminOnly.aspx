<%@ Page Title="" Language="VB" MasterPageFile="AdminMaster.master" AutoEventWireup="false" CodeFile="AdminOnly.aspx.vb" Inherits="DBMaintenance_AdminOnly" %>



<asp:Content ID="AdminOnlyContent" ContentPlaceHolderID="adminMainContentHolder" runat="Server">
    
    <div class="tableHolder">
    <div id="adminOnlyMain">
        <h2>
            Willhoit Farms Admin Page
        </h2>

        <p>
             You are logged in as: <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>.
            <br />
            If this isn't your correct user name, please&nbsp;
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Account/Login.aspx">click here.</asp:HyperLink>
            <br />
            <asp:LoginView id="LoginView1" runat="server">
                <RoleGroups>
                    <asp:RoleGroup Roles="admin">
                        <ContentTemplate>
                           Your role is: Admin
                        </ContentTemplate>
                    </asp:RoleGroup>
                    <asp:RoleGroup Roles="member">
                        <ContentTemplate>
                            Your role is: Member
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
            <br />
            <br />
            To complete any administration tasks, please choose a link to the left.

        </p>
        <p>
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </p>
    </div>
    </div>
</asp:Content>
