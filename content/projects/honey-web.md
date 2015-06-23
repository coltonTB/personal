# Honey Web

Over the course of working for [Honey][honey-site], I designed and implemented a few different versions of the company's website. The idea was to drive our growing [extension][honey-ext] userbase to a web experience that complimented the somewhat limited browser extension experience.

## Version 1

Here's a screenshot of the landing page from 2014. It's implemented in [Backbone.js][backbone-js], offering client-side rendering and a fully [push-state][pushstate-link] experience with the help of [Ezel.js][ezel-js]. In other words, you could explore the different sections of the page without reloading, but if you clicked the refresh button the site would serve you back the exact same page, rendered server-side.

<p class="browser-mock">
  [![img](/images/honey_v1_landing.png)](/images/honey_v1_landing.png)
</p>

<p class="browser-mock">
  [![img](/images/honey_v1_store.png)](/images/honey_v1_store.png)
</p>

## Version 2

A redesign of version 1 with sorting, searching, and filtering features

<p class="browser-mock">
  [![img](/images/honey_v2_store.png)](/images/honey_v2_store.png)
</p>


## Version 3

Using the [Ice.js][ice-js] framework, which I authored, utilizing [React][react-js] components for views with a much-simplified architecture

<p class="browser-mock">
  [![img](/images/honey_product.png)](/images/honey_product.png)
</p>

<p class="browser-mock">
  [![img](/images/honey_store.png)](/images/honey_store.png)
</p>


[react-js]: http://facebook.github.io/react/
[ice-js]: http://coltontb.github.io/ice-js
[pushstate-link]: http://spoiledmilk.com/blog/html5-changing-the-browser-url-without-refreshing-page/
[artsy-site]: https://www.artsy.net/
[ezel-js]: http://ezeljs.com/
[backbone-js]: http://backbonejs.org/
[phantom-js]: http://phantomjs.org/
[honey-site]: http://www.joinhoney.com
[honey-ext]: https://chrome.google.com/webstore/detail/honey/bmnlcjabgnpnenekpadlanbbkooimhnj?hl=en-US