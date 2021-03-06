<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    >

<xsl:output method="xml"/>

<xsl:template match="test">
    <results>
        <ul>
            <xsl:apply-templates/>
        </ul>
    </results>
</xsl:template>

<xsl:template match="subitem-7">
    <li><xsl:value-of select="text"/></li>
</xsl:template>

<xsl:template match="html | labels | id | text | label"/>

</xsl:stylesheet>

