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
    <xsl:choose>
        <xsl:when test="position() mod 2 = 0"></xsl:when>
        <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>

