<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    >

<xsl:import href="common-1-noout.xsl"/>
<xsl:import href="common-2-noout.xsl"/>
<xsl:import href="common-3-noout.xsl"/>
<xsl:import href="common-4-noout.xsl"/>
<xsl:import href="common-5-noout.xsl"/>

<xsl:output method="xml"/>

<xsl:template match="test">
    <results>
        <xsl:apply-templates select="items"/>
    </results>
</xsl:template>

<xsl:template match="items">
    <xsl:apply-templates select="item"/>
</xsl:template>

</xsl:stylesheet>

