<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:ya="http://www.yandex.ru"
    exclude-result-prefixes=" ya "
    >

<xsl:include href="../common-ns.xsl"/>

<xsl:output method="xml"/>

<xsl:template match="ya:item">
    <li>
        <xsl:value-of select="ya:text"/>
    </li>
</xsl:template>

</xsl:stylesheet>

