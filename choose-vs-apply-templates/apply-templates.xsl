<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    >

<xsl:output method="xml"/>

<xsl:template match="/">
    <out>
        <xsl:apply-templates select="items"/>
    </out>
</xsl:template>

<xsl:template match="items">
    <xsl:apply-templates select="item"/>
</xsl:template>

<xsl:template match="item">
    <div class="odd"><xsl:value-of select="."/></div>
</xsl:template>

<xsl:template match="item[position() mod 2 = 0]">
    <div class="even"><xsl:value-of select="."/></div>
</xsl:template>

</xsl:stylesheet>
