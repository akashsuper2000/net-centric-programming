<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="bank">
<html>
<body>
<h1> Savings Account </h1>
<table>
    <tr>
        <th> ID </th>
        <th> Interest </th>
        <th> Balance </th>
    </tr>
    <xsl: for-each select= "saving_accounts/savings_account">
     <tr>
        <td> <xsl: value-of select="@id"/> </td>
        <td> <xsl: value-of select="@interest"/> </td>
        <td> <xsl: value-of select="balance"/> </td>
    </tr>
</xsl:for-each>
</table>
<h1> Customer Details </h1>
<table>
    <tr>
        <th> ID </th>
        <th> Name </th>
        <th> Address </th>
    </tr>
    <xsl: for-each select="customers/customer">
    <tr>
        <td> <xsl: value-of select="@id"/> </td>
        <td> <xsl: value-of select="name"/> </td>
        <td> <xsl: value-of select="address"/> </td>
    </tr>
    </xsl: for-each>
</table>

<h1> Customers and their Accounts </h1>
<table>
    <tr>
        <th> Customer ID </th>
        <th> Account ID </th>
    </tr>
    <xsl: for-each select="customer_accounts/customer_account">
    <tr>
        <td> <xsl: value-of select="@ac_id"/> </td>
        <td> <xsl: value-of select="@ac_id"/> </td>
    </tr>
    </xsl: for-each>
</table>
</body>
</html>