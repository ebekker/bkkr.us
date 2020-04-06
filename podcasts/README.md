# README - bkkr.us Podcasts Export

1. Export the OPML file from Pocket Casts, and save to `podcasts_opml.xml`
2. Produce a canonical, sorted version `podcasts_opml-sorted.xml` by running

    ```powershell
    .\Invoke-ApplyOpmlSortXslt.ps1
    ```

3. Make sure there is a reference to the XSL style sheet that formats for HTML presentation (this should be taken care of by the above PWSH command).
