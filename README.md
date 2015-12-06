[ Languages: English|[Русский](./README.ru.md) ]

TODO: Finish it...

aVtonomKa
=========

Command line utility to manage data at VK social network.

Installation
---------

Simple install with:

    $ gem install aVtonomKa

Usage
-------------

### Authorize application

Before you continue with using this application, you must authorize it.

    $ avtonomka authorize

That command opens in your browser authorization URL. VK redirects you to a blank page.
Copy an access_token from the address bar of your browser and give it to the application.
(gif-animation)

aVtonomKa will save that token, and while it alive you won't need to repeat that step.
