# Playwright Remote Protocol Loopback Issue

This repository is a minimal reproduction of either a misunderstanding, bug, or missing feature in the Playwright Remote protocol.

## Issue

When running a Playwright server (using `launchBrowser`) and client remotely (e.g. over the websocket transport), the server does not resolve requests to `localhost`. It is my understanding that such requests should be sent back from the server component to the client.

## Documentation

### Client browser types

[`exposeNetwork`](https://playwright.dev/docs/api/class-browsertype#browser-type-connect-option-expose-network)

> exposeNetwork string (optional) Added in: v1.37#
> This option exposes network available on the connecting client to the browser being connected to. Consists of a list of rules separated by comma.

### `launchServer` options

[`launchServer`](https://playwright.dev/docs/api/class-browsertype#browser-type-launch-server)

> launchServer
> Added in: v1.8
> Returns the browser app instance. You can connect to it via browserType.connect(), which requires the major/minor client/server version to match (1.2.3 → is compatible with 1.2.x).
See `launchBrowser` fo full details. There doesn't seem to be any mention of if or how `exposeNetwork` is used in the server.

## Using this repository

- Clone repo
- Ensure Docker is installed and running
- Install dependencies: `pnpm install`
- Execute the example: `./run-example.sh`

A `server.sh` script is also provided to run, surprisingly, the server. Both the example and the server script will start a Playwright server at `ws://localhost:5900/pw`.
