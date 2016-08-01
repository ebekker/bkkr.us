<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
      <title>My Podcasts:  <xsl:value-of select="/opml/head/title"/></title>
  </head>
  <body>
    <h2>My Podcasts:  <xsl:value-of select="/opml/head/title"/></h2>
    
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Podcast</th>
        <th>Tags</th>
      </tr>
      <xsl:for-each select="opml/body/outline/outline">
        <tr>
          <td>
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="@xmlUrl" />
              </xsl:attribute>
              <xsl:value-of select="@text"/>
            </a>
          </td>
          <td>
              [<xsl:value-of select="document('podcast-notes.xml')/podcast-notes/note[@text=current()/@text]/@tags" />]
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
