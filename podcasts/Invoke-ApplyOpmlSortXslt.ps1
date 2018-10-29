#!/usr/bin/env pwsh

$xsl = [System.Xml.Xsl.XslCompiledTransform]::new()
$xsl.Load("$PWD\opml-sort.xsl")

$prm = [System.Xml.Xsl.XsltArgumentList]::new()

## Transform feed of podcasts
$prm.Clear()
$prm.AddParam('feedType', '', 'Podcast')
$prm.AddParam('notesFile', '', 'podcast-notes.xml')
$prm.AddParam('listSelect', '', 'outline2')
$out = [System.IO.StreamWriter]::new("$PWD\podcasts_opml-sorted.xml", $false)
$xsl.Transform("$PWD\podcasts_opml.xml", $prm, $out)
$out.Dispose()

## Transform feed of news
$prm.Clear()
$prm.AddParam('feedType', '', 'NewsFeed')
$prm.AddParam('notesFile', '', 'greader-notes.xml')
$prm.AddParam('listSelect', '', 'outline1')
$out = [System.IO.StreamWriter]::new("$PWD\greader_opml-sorted.xml", $false)
$xsl.Transform("$PWD\greader_opml.xml", $prm, $out)
$out.Dispose()
