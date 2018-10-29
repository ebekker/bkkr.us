<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Based on:  https://stackoverflow.com/a/538028/5428506 -->
    <xsl:output method="xml" indent="yes" standalone="yes" />
    <xsl:strip-space elements="*"/>

    <xsl:template match="/*">
        <!-- Add ref to XSLT to be used for rendering final HTML -->
        <xsl:processing-instruction name="xml-stylesheet"
            >type="text/css" href="opml.xsl"</xsl:processing-instruction>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <!-- Based on:  https://stackoverflow.com/a/24483885/5428506 -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="body/outline">
        <xsl:copy>
            <xsl:apply-templates select="@*" />
            <xsl:apply-templates select="outline[@type='rss']">
                <xsl:sort select="@text" data-type="text" order="ascending" />
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>