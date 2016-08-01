<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
    <title>My Podcasts:  <xsl:value-of select="/opml/head/title"/></title>

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
    <h2>My Podcasts:  <xsl:value-of select="/opml/head/title"/></h2>
    
    <h3><span class="label label-primary">techie      <span class="badge"><xsl:value-of select="count(document('podcast-notes.xml')/podcast-notes/note[@tags='techie'])"/>     </span></span></h3>
    <h3><span class="label label-primary">semi-techie <span class="badge"><xsl:value-of select="count(document('podcast-notes.xml')/podcast-notes/note[@tags='semi-techie'])"/></span></span></h3>
    <h3><span class="label label-primary">stories     <span class="badge"><xsl:value-of select="count(document('podcast-notes.xml')/podcast-notes/note[@tags='stories'])"/>    </span></span></h3>
    <h3><span class="label label-primary">business    <span class="badge"><xsl:value-of select="count(document('podcast-notes.xml')/podcast-notes/note[@tags='business'])"/>   </span></span></h3>
    
    <table data-toggle="table" data-striped="true">
        <thead>
          <tr>
            <th data-field="podcast"
                data-sortable="true">Podcast</th>
            <th data-field="tags"
                data-sortable="true">Tags</th>
          </tr>
        </thead>
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
          <span class="label label-primary"><xsl:value-of
                select="document('podcast-notes.xml')/podcast-notes/note[@text=current()/@text]/@tags" /></span>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
