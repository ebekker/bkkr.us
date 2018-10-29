<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="feedType" />
    <xsl:param name="notesFile" />
    <xsl:param name="listSelect" />

    <!-- Based on:  https://stackoverflow.com/a/538028/5428506 -->
    <xsl:output method="xml" indent="yes" standalone="yes" />
    <xsl:strip-space elements="*"/>

    <xsl:template match="/*">
        <!-- Add ref to XSLT to be used for rendering final HTML -->
        <xsl:processing-instruction name="xml-stylesheet"
            >type="text/xsl" href="opml.xsl"</xsl:processing-instruction>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="opml/head">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
        <params>
            <feedType><xsl:value-of select="$feedType" /></feedType>
            <notesFile><xsl:value-of select="$notesFile" /></notesFile>
            <listSelect><xsl:value-of select="$listSelect" /></listSelect>
        </params>
    </xsl:template>

    <!-- Based on:  https://stackoverflow.com/a/24483885/5428506 -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="outline">
        <xsl:copy>
            <xsl:apply-templates select="@*" />
            <xsl:apply-templates select="outline">
                <xsl:sort select="@text" data-type="text" order="ascending" />
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>