# Node version manager tool (N) buildkite plugin

Install and manage multiple node versions by leveraging the [N](https://github.com/tj/n) tool

## Example

Add the following to your `pipeline.yml`:

```yml
steps:
  - command: ls
    plugins:
      - sv-oss/node-n#v0.1.0:
          node-version: v15
```

## Configuration

### `node-version` (Optional, string)

The node version to install. (defaults to `lts`)
This parameter accepts any input supported by the N tool install command.
See the [relevant documentation](https://github.com/tj/n#specifying-nodejs-versions) for more information


### `tool-install-dir` (Optional, string)

Directory in which the N tool will be installed. (defaults to `$HOME/n`)


## Developing

To run the tests:

```shell
docker-compose run --rm tests
```

## Contributing

1. Fork the repo
2. Make the changes
3. Run the tests
4. Commit and push your changes
5. Send a pull request