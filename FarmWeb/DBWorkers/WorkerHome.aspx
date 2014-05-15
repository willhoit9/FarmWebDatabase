<%@ Page Title="" Language="VB" MasterPageFile="~/DBWorkers/WorkerMaster.master" AutoEventWireup="false" CodeFile="WorkerHome.aspx.vb" Inherits="DBWorkers_WorkerHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="workerMainContentHolder" Runat="Server">

 <div id="workerMain">
        <h2>
            Willhoit Farms Worker Page
        </h2>

        <p>
          <%--  <asp:LoginName ID="LoginName1" runat="server" FormatString="You are logged in as: {0}" />--%>
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
            To complete any worker tasks, please choose a link to the left.

        </p>
        <p>
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </p>
    </div>





</asp:Content>

