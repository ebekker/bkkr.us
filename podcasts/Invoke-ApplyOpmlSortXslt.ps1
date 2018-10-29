#!/usr/bin/env pwsh

$xsl = [System.Xml.Xsl.XslCompiledTransform]::new()
$xsl.Load("$PWD\opml-sort.xsl")
$xsl.Transform("$PWD\podcasts_opml.xml", "$PWD\podcasts_opml-sorted.xml")
