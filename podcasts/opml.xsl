<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="feedType" select="/opml/params/feedType" />
<xsl:param name="notesFile" select="/opml/params/notesFile" />
<xsl:param name="listSelect" select="/opml/params/listSelect" />

<xsl:template match="/">
  <html>
  <head>
    <title>My <xsl:value-of select="$feedType" />s:  <xsl:value-of select="/opml/head/title"/></title>

    <!-- jQuery: -->
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-2.2.3.min.js"></script>

    <!-- Bootstrap: -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"></link>
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"></link>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <!-- Bootstrap Table: -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.css"></link>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.js"></script>
    <!-- Latest compiled and minified Locales -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/locale/bootstrap-table-en-US.min.js"></script>
  </head>
  <body>
    <h2>My <xsl:value-of select="$feedType" />s:  <xsl:value-of select="/opml/head/title"/></h2>
    
    <ul>
        <li><span class="label label-primary">techie      <span class="badge"><xsl:value-of select="count(document($notesFile)/podcast-notes/note[@tags='techie'])"/>     </span></span></li>
        <li><span class="label label-primary">semi-techie <span class="badge"><xsl:value-of select="count(document($notesFile)/podcast-notes/note[@tags='semi-techie'])"/></span></span></li>
        <li><span class="label label-primary">stories     <span class="badge"><xsl:value-of select="count(document($notesFile)/podcast-notes/note[@tags='stories'])"/>    </span></span></li>
        <li><span class="label label-primary">business    <span class="badge"><xsl:value-of select="count(document($notesFile)/podcast-notes/note[@tags='business'])"/>   </span></span></li>
    </ul>
    
    <table data-toggle="table"
            data-striped="true"
            data-search="true"
            data-show-columns="true">
        <thead>
          <tr>
            <th data-field="podcast"
                data-sortable="true"><xsl:value-of select="$feedType" /></th>
            <th data-field="tags"
                data-sortable="true">Tags</th>
          </tr>
        </thead>
        <tbody>
        <xsl:if test="$listSelect='outline1'">
          <xsl:for-each select="opml/body/outline">
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </xsl:if>
        <xsl:if test="$listSelect='outline2'">
          <xsl:for-each select="opml/body/outline/outline">
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </xsl:if>
        </tbody>
    </table>
  </body>
  </html>
</xsl:template>

<xsl:template match="outline">
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
              <span class="label label-primary"><xsl:value-of
                    select="document($notesFile)/podcast-notes/note[@text=current()/@text]/@tags" /></span>
              <xsl:if test="count(document($notesFile)/podcast-notes/note[@text=current()/@text]/@tags)=0"><i style="color: lightgray">(not tagged yet)</i></xsl:if>
              </td>
            </tr>
</xsl:template>

</xsl:stylesheet>
