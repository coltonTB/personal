# Pay with Bitcoin

During the bitcoin craze in early 2014, I was contracted to build an application that would allow users to pay for almost anything on the internet with bitcoin. The solution was to use variable-price giftcards as an intermediary between BTC and USD, since most online merchants accept them as a form of payment. When the user wanted to make a purchase, they would pay us in bitcoin and we would immediately cover the cost of the purchase by applying a gift card to their shopping cart. I was tasked with building both a responsive web-based client and a fast and secure API that could support this activity.

## Implementation

I wrote both the server and client in coffeescript and designed an entirely event-driven architecture that had security built-in from the beginning. 

### Client

The client is a browser extension with an event-driven UI. A central event hub listens for global events and updates the view state accordingly. It uses [Backbone.js][backbone-link] for events and views, and [Underscore][underscore-link] templates for markup. 

Here is part of the UX that I designed and built:

<p class="pwb-screens">

[![hp_1](/images/honeypay_1.png)](/images/honeypay_1.png)

[![hp_2](/images/honeypay_2.png)](/images/honeypay_2.png)

[![hp_3](/images/honeypay_3.png)](/images/honeypay_3.png)

[![hp_4](/images/honeypay_4.png)](/images/honeypay_4.png)

</p>


### API

The API is written in [Node.js][node-link] and serves as a layer between the client and the external APIs ( [Coinbase][coinbase-link] and [Incomm][incomm-link]). It uses [Redis][redis-link] to manage multiple concurrent secure sessions in an event-driven manner.

## Technical Docs

Below: This flowchart shows the UX flow and how it fits into the overall system architecture. The green circles represent distinct UX states, some of which have screenshots above. The major steps in the flow (as drawn below) are:

0. User clicks the 'pay with bitcoin' button on a merchant checkout page
1. Get the shopping cart total price from the page
3. Use [Coinbase][coinbase-link] to let the user make a bitcoin purchase to our account for that amount
4. Use [Incomm][incomm-link] to puchase a giftcard for that ammount
5. Deliver and automatically apply the gifcard to the user's shopping card page

[![honeypay_state](/images/honeypay_state_sm.png)](/images/honeypay_state_lg.png)

Below: This diagram shows the same flow with a focus on the API implementation rather than user experience. It shows how long-polling and [Redis pub/sub][redis-link] were used to implement a secure, event-driven architecture. 

To read: Horizontal lines are HTTP requests, with time running from top to bottom. 
*(Black = synchronous. Color = asynchronous)*

[![honeypay_api](/images/honeypay_api_sm.png)](/images/honeypay_api_lg.png)


[node-link]: https://nodejs.org/
[underscore-link]: http://underscorejs.org/
[backbone-link]: http://backbonejs.org/
[redis-link]: http://redis.io/topics/pubsub
[coinbase-link]: https://www.coinbase.com/
[incomm-link]: http://www.incomm.com/Pages/default.aspx