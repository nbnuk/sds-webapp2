

<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="layout" content="main"/>
    <title>Sensitive Data Service</title>
</head>

<body>
<h2>Sensitive Data Service</h2>
The Sensitive Data Service (SDS) is the ALA mechanism for providing security over data sensitivities. At the moment it supports:
<ul>
    <li>Conservation Sensitivity, whereby sensitive species are denatured according to state rules. </li>
    <li>Pest Sensitivity. Species are passed through a set of rules based on categories as defined in the <b>Plant Biosecurity Sensitive Data Service</b></li>
</ul>
For more information see <a href="http://www.ala.org.au/faq/data-sensitivity/">Data Sensitivity</a>.
<h2>Testing</h2>
<p>
The Sensitive Data Service can be tested through the <a href="http://sandbox.ala.org.au">sandbox</a>. Simply upload your list of species and coordinates and the
individual record pages of the sandbox will indicate whether or not sensitivity was detected.
</p>
<h2>Resources</h2>
The Sensitive Data Service is controlled through a set of XML files.
<ul>
    <li> <a href="${request.contextPath}/sensitive-species-data.xml">sensitive-species-data.xml</a>
        <p>Last generated from the <a href="http://lists.ala.org.au/public/speciesLists?isSDS=eq:true">SDS lists</a> on ${updateDate}</p>
        <g:if test="${request.isUserInRole('ROLE_ADMIN')}" >
            <p>Force a manual <a href="${request.contextPath}/refresh">refresh</a></p>
        </g:if>
    </li>
    <li> <a href="${request.contextPath}/sensitivity-categories.xml">sensitivity-categories.xml</a></li>
    <li> <a href="${request.contextPath}/sensitivity-zones.xml">sensitivity-zones.xml</a></li>
</ul>

The species that make up the individual components of the SDS can be view via the <a href="http://lists.ala.org.au/public/speciesLists?isSDS=eq:true">list tool</a>.

</body>
</html>