# Package Name : WxCloudReadinessAnalyzer
To use the analyzer:
1. Install the WxCloudReadinessAnalyzer package and refresh the browser. Pre-Upgrade Analyzer should appear under the Solutions menu.
2. Open the WmPublic/config/fileAccessControl.cnf file and add the “packages/WxCloudReadinessAnalyzer/pub/reports” directory to the allowedReadPaths, allowedWritePaths and allowedDeletePaths. Reload the WmPublic package.
3. Clicking the link will open the Cloud Readiness Analyzer in a new tab.
4. The “Create Reports” section displays a link for each available report.
5. Optional report inputs are italicized, while required inputs are not. Required inputs with no default a marked additionally with an asterisk. Filters use standard regular expression syntax. For example, to run a report against packages starting with “My”, the filter syntax would be “My.+”.
6. The Download & Manage Reports contains a Report List link, which allows you to view the list of generated reports, download reports and/or delete reports.
------
These tools are provided as-is and without warranty or support. They do not constitute part of the Software AG product suite. Users are free to use, fork and modify them, subject to the license agreement. While Software AG welcomes contributions, we cannot guarantee to include every contribution in the master project.
