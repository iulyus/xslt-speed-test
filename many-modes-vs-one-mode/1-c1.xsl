<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    >

<xsl:output method="html"/>

<xsl:template match="page">
    <div class="items">
        <xsl:apply-templates select="items" mode="mode-0"/>
    </div>
</xsl:template>

<xsl:template match="item" mode="mode-0"/>

</xsl:stylesheet>

