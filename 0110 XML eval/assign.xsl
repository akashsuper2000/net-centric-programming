<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/bank">
<html>
<head><title>Bank</title></head>
<body>
  <xsl:apply-templates select="*" />
</body>
</html>
</xsl:template>
<xsl:template match="accounts">
<p>
  <xsl:apply-templates select="savings_accounts" />
</p>
<p>
  <xsl:apply-templates select="checking_accounts" />
</p>
</xsl:template>

<xsl:template match="savings_accounts">
<ul>
  <xsl:apply-templates select="savings_account" />
</ul>
</xsl:template>



<xsl:template match="savings_account">
<li>ID:<span><xsl:value-of select="@id"/></span>  
  <br />
  Interest: <span><xsl:value-of select="@interest"/></span>
  <br />
  <xsl:apply-templates select="balance" /> 
</li>
</xsl:template>


<xsl:template match="checking_accounts">
<ol>
  <xsl:apply-templates select="checking_account" />
</ol>
</xsl:template>



<xsl:template match="checking_account">
<li>ID:<span><xsl:value-of select="@id"/></span>  
  <br />
  <xsl:apply-templates select="balance" /> 
</li>
</xsl:template>


<xsl:template match="balance">
  Balance: <span><xsl:value-of select="."/></span>
  <br />
</xsl:template>





<xsl:template match="customers">
<ol>
  <xsl:apply-templates select="customer" />
</ol>
</xsl:template>

<xsl:template match="customer">
<li>ID:<span><xsl:value-of select="@id"/></span> 
  <br />
  <xsl:apply-templates select="name" /> 
  <xsl:apply-templates select="address" /> 
</li>
</xsl:template>

<xsl:template match="name">
  Name:<span><xsl:value-of select="."/></span>
  <br />
</xsl:template>

<xsl:template match="address">
  Address:<span><xsl:value-of select="."/></span>
  <br />
</xsl:template>


<xsl:template match="customer_accounts">
<table border="1">
   <tr>
      <th>Customer</th>
      <th>Account</th>
    </tr>
  <xsl:for-each select="customer_account">
      <tr>
        <td><xsl:value-of select="@c_id"/></td>
      <td><xsl:value-of select="@ac_id"/></td>  
    </tr>
  </xsl:for-each>
</table>

</xsl:template>



</xsl:stylesheet>