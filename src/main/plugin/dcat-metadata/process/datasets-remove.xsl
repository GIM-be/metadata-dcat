<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:dct="http://purl.org/dc/terms/"
                xmlns:dcat="http://www.w3.org/ns/dcat#"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:owl="http://www.w3.org/2002/07/owl#"
                xmlns:mvs="http://data.vlaanderen.be/ns/metadata-dcat#"
                exclude-result-prefixes="#all"
                version="2.0">

  <xsl:param name="uuidref"/>
  <xsl:param name="idRef"/>

  <xsl:template match="dcat:DataService ">
    <xsl:copy>
      <xsl:copy-of select="@*"/>

      <!-- Copy elements before dcat:servesDataset -->
      <xsl:copy-of select="dct:identifier|
                           dct:title|
                           dct:description|
                           dcat:endpointUrl|
                           dcat:endpointDescription"/>

      <xsl:copy-of select="dcat:servesDataset[not(ends-with(normalize-space(@rdf:resource), $uuidref) or ends-with(normalize-space(@rdf:resource), $idRef))]"/>

      <!-- Copy elements after dcat:servesDataset -->
      <xsl:copy-of select="dcat:landingPage|
                           dcat:contactPoint|
                           dcat:keyword|
                           dct:language|
                           owl:versionInfo|
                           mvs:authenticatie|
                           mvs:dienstverleningsKwaliteit|
                           mvs:doelpopulatie|
                           mvs:gebruiksbepaling|
                           mvs:statusVanGebruik|
                           mvs:statusVanOntwikkeling|
                           mvs:wettelijkeBeperkingen"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@*|*">
    <xsl:copy>
      <xsl:apply-templates select="@*|*"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
