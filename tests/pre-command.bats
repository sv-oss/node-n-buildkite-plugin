#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

@test "Install n tool if not present" {

  stub curl '-s -L https://git.io/n-install : echo'
  stub n '--version : false' 'install : echo "mock-version-install"'

  run "$PWD/hooks/pre-command"

  assert_success
  assert_output --partial "installing N tool"

  unstub curl n
}


@test "Install n tool under a specific path" {
  export BUILDKITE_PLUGIN_NODE_N_TOOL_INSTALL_DIR="/some/other/dir"

  stub curl '-s -L https://git.io/n-install : echo'
  stub n '--version : false' 'install : echo "mock-version-install"'

  run "$PWD/hooks/pre-command"

  assert_success
  assert_output --partial "installing N tool in /some/other/dir"

  unstub curl n
}

@test "Install a specific version of node" {
  export BUILDKITE_PLUGIN_NODE_N_NODE_VERSION="15"

  stub n '--version : true' 'install 15 : true'

  run "$PWD/hooks/pre-command"

  assert_success
  assert_output --partial "installing node version 15"

  unstub n
}

@test "Install lts by default" {
  stub n '--version : true' 'install lts : true'

  run "$PWD/hooks/pre-command"

  assert_success
  assert_output --partial "installing node version lts"

  unstub n
}