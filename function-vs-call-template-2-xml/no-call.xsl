<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:ya="http://www.yandex.ru"
    xmlns:func="http://exslt.org/functions"
    exclude-result-prefixes=" ya func "
    extension-element-prefixes=" func "
    >

<xsl:include href="../common.xsl"/>

<xsl:output method="xml"/>

<xsl:template match="item">
    <li>
        <xsl:value-of select="text"/>
    </li>
</xsl:template>

</xsl:stylesheet>

