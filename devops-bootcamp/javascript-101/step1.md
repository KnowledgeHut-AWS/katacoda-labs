# Running a basic JavaScript program

## Simple Java Script Program

Open file `index.html`{{open}} in the editor and add following code

```html
<!DOCTYPE html>
<html>
<body>

<h2>What Can JavaScript Do?</h2>

<p id="demo">JavaScript can change HTML content.</p>

<button type="button" onclick='document.getElementById("demo").innerHTML = "Hello JavaScript!"'>Click Me!</button>

</body>
</html>
```

## Building Docker Container with Web Server

We need a web server that can run JS embeded in HTML to see how it works. For this purpose create a `Dockerfile`{{open}} with following code

<pre class="file" data-filename="Dockerfile" data-target="replace">
FROM nginx:alpine

COPY . /usr/share/nginx/html
</pre>

## Run docker build

`docker build -t knowledgehut/nginx-html-img:v1 .`{{execute}}

## Run Code

`docker run --name nginx-html-container -d -p 80:80 knowledgehut/nginx-html-img:v1`{{execute}}

Click on the tab `Web-Server` to open the web page.

Click on `Click Me!` button and you'll notice that `JavaScript can change HTML content.` changes to `Hello JavaScript!`