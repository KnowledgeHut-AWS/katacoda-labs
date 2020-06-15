# Running a basic JavaScript program

## Simple Java Script Program

<pre class="file" data-filename="inhex.html" data-target="replace">
<!DOCTYPE html>
<html>
<body>

<h2>What Can JavaScript Do?</h2>

<p id="demo">JavaScript can change HTML content.</p>

<button type="button" onclick='document.getElementById("demo").innerHTML = "Hello JavaScript!"'>Click Me!</button>

</body>
</html>
</pre>

## Building Docker Container with Web Server

Create `Dockerfile`{{open}} with following contents

<pre class="file" data-filename="Dockerfile" data-target="replace">
FROM nginx:alpine

COPY . /usr/share/nginx/html
</pre>

## Run docker build

`docker build -t knowledgehut/nginx-html-img:v1 .`{{execute}}

## Run Code

`docker run --name nginx-html-container -d -p 80:80 knowledgehut/nginx-html-img:v1`

Clock on the tab `Web-Server` to run the JavaScript code.