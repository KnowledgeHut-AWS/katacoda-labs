# Running a simple Web App in NodeJS

We'll create a simple Hello World program in NodeJS. Create the `app.js`{{open}} file and add following code

<pre class="file" data-filename="app.js" data-target="replace">
const http = require('http');

const hostname = '0.0.0.0';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
</pre>

## Running our Hello World Program

To run the code execute `node app.js`{{execute}}

Click on the tab `Web-Server` next to Terminal and you shall see a web page with the Hello World message.

Close the browser tab and stop the server by sending `CTRL-C` to the terminal
