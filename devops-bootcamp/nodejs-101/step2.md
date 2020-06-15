# Debugging NodeJS

While `node` cli command does have a `--inspect` flag to enable a debugger, which is known as `inspector` in the node world.

It binds to `127.0.0.0.1` and port `9229` by default however, you can provide `host:port` options to to bind to extenral or all IPs too.

Example command would be

`node --inspect=0.0.0.0 app.js`

## Enabling remote debugging scenarios

We recommend that you never have the debugger listen on a public IP address. If you need to allow remote debugging connections we recommend the use of ssh tunnels instead. We provide the following example for illustrative purposes only. Please understand the security risk of allowing remote access to a privileged service before proceeding.

Let's say you are running Node.js on a remote machine, remote.example.com, that you want to be able to debug. On that machine, you should start the node process with the inspector listening only to localhost (the default).

`node --inspect server.js`

Now, on your local machine from where you want to initiate a debug client connection, you can setup an ssh tunnel:

`ssh -L 9221:localhost:9229 user@remote.example.com`

This starts a ssh tunnel session where a connection to port `9221` on your local machine will be forwarded to port `9229` on remote.example.com. You can now attach a debugger such as Chrome DevTools or Visual Studio Code to `localhost:9221`, which should be able to debug as if the Node.js application was running locally.
