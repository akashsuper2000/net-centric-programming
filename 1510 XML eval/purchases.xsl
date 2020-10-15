<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>

    <body>
      <center>
        <h2>Purchase Details</h2>
      </center>
      <center>
        <table border="1">
          <tr>
            <th>Customer ID</th>

            <th>Date</th>
            <th>Billing</th>
            <th>Shipping Info</th>
            <th>Item Details</th>
          </tr>
          <xsl:for-each select="purchases/customer">
            <tr>
              <td>
                <xsl:value-of select="customer_id" />
              </td>
              <td>
                <xsl:value-of select="date" />
              </td>
              <td>
                <xsl:value-of select="billing" />
              </td>
              <td>
                <xsl:value-of select="shipping_info" />
              </td>
              <td>
                <table>
                  <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                  </tr>
                  <xsl:for-each select="items/item">
                    <tr>
                      <td>
                        <xsl:value-of select="product_id" />
                      </td>
                      <td>
                        <xsl:value-of select="product_name" />
                      </td>
                      <td>
                        <xsl:value-of select="quantity" />
                      </td>
                      <td>
                        <xsl:value-of select="price" />
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
              </td>

            </tr>
          </xsl:for-each>
        </table>
      </center>
    </body>

    </html>
  </xsl:template>
</xsl:stylesheet>