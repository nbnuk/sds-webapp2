

<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="layout" content="main"/>
    <title>Sensitive Data Service</title>
    <style type="text/css" media="screen">
    #breadcrumb {
        display: none;
    }
    </style>
</head>

<body>
<h2>Sensitive Data Service</h2>
The Sensitive Data Service (SDS) is the mechanism for providing security over data sensitivities. At the moment it supports:
<ul>
    <li>Conservation Sensitivity, whereby occurrence records for sensitive species are generalised according to country rules, e.g. by reducing their spatial precision. </li>
</ul>

<h2>Resources</h2>
<p>The Sensitive Data Service is controlled through a set of XML files.</p>

    <table class="table">
        <thead>
         <tr>
             <td>File</td>
             <td>Purpose</td>
             <td></td>
             <td></td>
         </tr>
        </thead>
        <tbody>
            <tr>
                <td><a href="${request.contextPath}/sensitive-species-data.xml">Sensitive Species Data</a></td>
                <td>The xml file that supplies all the sensitive species and the categories and zones to which they belong.</td>
                <td>This file was last generated on ${updateDate}.</td>
                <td><g:if test="${request.isUserInRole('ROLE_ADMIN')}" >
                    <a  class="btn" href="${request.contextPath}/refresh">Refresh</a>
                    </g:if>
                </td>
            </tr>
            <tr>
                <td><a href="${request.contextPath}/sensitivity-categories.xml">Sensitive Categories</a></td>
                <td>The xml file that supplies the vocabulary for the sensitive categories.</td>
                <td>This is a static file.</td>
                <td></td>
            </tr>
            <tr>
                <td><a href="${request.contextPath}/sensitivity-zones.xml">Sensitive Zones</a></td>
                <td>The xml file that supplies the vocabulary for the sensitive zones.</td>
                <td>This is a static file.</td>
                <td></td>
            </tr>
            <tr>
                <td><a href="${request.contextPath}/ws/layers">List of sensitive layer IDs</a></td>
                <td>JSON list of layers that are required by the SDS</td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>
%{--<ul>--}%
    %{--<li> <a href="${request.contextPath}/sensitive-species-data.xml">sensitive-species-data.xml</a>--}%
        %{--<p>Last generated from the <a href="http://lists.ala.org.au/public/speciesLists?isSDS=eq:true">SDS lists</a> on ${updateDate}</p>--}%
        %{--<g:if test="${request.isUserInRole('ROLE_ADMIN')}" >--}%
            %{--<p>Force a manual <a href="${request.contextPath}/refresh">refresh</a></p>--}%
        %{--</g:if>--}%
    %{--</li>--}%
    %{--<li> <a href="${request.contextPath}/sensitivity-categories.xml">sensitivity-categories.xml</a></li>--}%
    %{--<li> <a href="${request.contextPath}/sensitivity-zones.xml">sensitivity-zones.xml</a></li>--}%
%{--</ul>--}%

The species that make up the individual components of the SDS can be view via the <a href="${grailsApplication.config?.list?.tool?.url?: 'http://lists.ala.org.au/public/speciesLists?isSDS=eq:true'}">list tool</a>.

</body>
</html>