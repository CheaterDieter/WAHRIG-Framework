<!-- XSLT-Konversationsroutine zur Überführung der Ausgangsdatei in eine vereinfachte Form
* Entwickelt von David Heger -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="n">
        <wortart typ="n">
            <xsl:apply-templates/>
        </wortart>
    </xsl:template>
    
    <xsl:template match="rest">
        <wortart typ="rest">
            <xsl:apply-templates/>
        </wortart>
    </xsl:template>    
    
    <xsl:template match="spz">
        <bedeutung typ="spz">
            <polysem>
                <xsl:apply-templates/>
            </polysem>
        </bedeutung>
    </xsl:template>        
    
    <xsl:template match="pollist">
        <bedeutung typ="pollist">
            <xsl:apply-templates/>
        </bedeutung>
    </xsl:template>      
    
    <xsl:template match="s-a">
        <idm idref="{@idref}" typ="angehängt">
            <xsl:apply-templates/>
        </idm>
    </xsl:template>
    
    <xsl:template match="idm">
        <idm idref="{@idref}" typ="eigenständig">
            <xsl:apply-templates/>
        </idm>
    </xsl:template>        
        
    
    <xsl:template match="subpollist"> 
            <xsl:apply-templates/>
    </xsl:template>    
    
    <xsl:template match="eintrag">
        <eintrag>
            <xsl:apply-templates/>
            <xsl:choose>
                <xsl:when test="count(info) = 0">
                    <info typ="false" />
                </xsl:when>  
            </xsl:choose>            
        </eintrag>

    </xsl:template>
    
    <xsl:template match="info">
        <info typ="true">
            <xsl:apply-templates/>
        </info>
    </xsl:template>    
    
    <xsl:template match="syno">
        <syno konvertiert="true">
            <xsl:apply-templates/>
        </syno>
    </xsl:template>     
</xsl:stylesheet>