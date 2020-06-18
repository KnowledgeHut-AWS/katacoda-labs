## Adding security

**Content Security Policy (CSP)** is an added layer of security that helps to detect and mitigate certain types of attacks, including **Cross Site Scripting (XSS)** and data injection attacks. These attacks are used for everything from data theft to site defacement to distribution of malware.

CSP is designed to be fully backward compatible (except CSP version 2 where there are some explicitly-mentioned inconsistencies in backward compatibility). Browsers that don't support it still work with servers that implement it, and vice-versa: browsers that don't support CSP simply ignore it, functioning as usual, defaulting to the standard `same-origin` policy for web content. If the site doesn't offer the CSP header, browsers likewise use the standard `same-origin` policy.

### Setting up Content Security Policy 

webpack is capable of adding `nonce` to all scripts that it loads. To activate the feature set a `__webpack_nonce__` variable needs to be included in your entry script. A unique hash based nonce should be generated and provided for each unique page view this is why `__webpack_nonce__` is specified in the entry file and not in the configuration. Please note that nonce should always be a base64-encoded string.

For example

`__webpack_nonce__ = 'c29tZSBjb29sIHN0cmluZyB3aWxsIHBvcCB1cCAxMjM=';`

**Note** CSPs are not enabled by default on a webpage. A corresponding header `Content-Security-Policy` or meta tag `<meta http-equiv="Content-Security-Policy" ...>` needs to be sent with the document to instruct the browser to enable the CSP. Here's an example of what a CSP header including a CDN white-listed URL might look like:

`Content-Security-Policy: default-src 'self'; script-src 'self' https://trusted.cdn.com;`