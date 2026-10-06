# examples/

Illustrative usage examples for the root module in this repo (`source = "../"`)
go here. **Nothing in this directory is applied** - the real, live admin
config for the `tf_cloud_workspace` TFC workspace lives in
[`../live/`](../live/).

This directory used to double as the live config itself (the workspace's
`working_directory` pointed here), which meant every file here - including
obvious scratch/demo fixtures - created real TFC objects. See the
`refactor/examples-to-live` PR and `../live/` for the fix.
