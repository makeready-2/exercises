To check these exercises, clone the repo then open a terminal at this location, and use one of these commands:
* ruby 1-foobar.rb
* ruby 2-count-even.rb
* ruby 3-random-sum.rb
* ruby 4-remove-duplicates.rb

Question 5, how would I build a simple chat app:

First of all, the app's communication with the server should be socket-based. A REST-based system, with frequent polling for new messages, is either too laggy (if polled infrequently) or too network-heavy (if polled frequently.) There are several languages that support a socket-based approach. The choice of which language to use is mostly determined by circumstance - is this app a new feature of an existing stack? What languages do the available developers know?

Let's go with Ruby for the sake of argument, and let's assume our front-end needs are very minimal besides the rendering of the chat window itself. That simplicity in the view layer and routing engine means Rails is too heavy for this job, but let's use Rails's ActionCable since it's the most popular socket implementation in Rubyland. We'll use Sinatra for the server itself to keep things streamlined.

The frontend rendering should be a JS framework for ease of portability to browsers and other platforms. Because this is a single-page app, there will be a need to manage the state intelligently, so let's go with React + Redux. Eventually we can include RxJS if our event handling logic gets very complex.

The basic explanation of how the app works is as follows: User A boots the app. After authenticating with the server, open a websocket between the client and the server. Any pending messages for the user are then served over that socket. Messages that User A types to User B are sent to the server. If User B is online, that message is immediately relayed to them via the server-to-B websocket. If user B is not online, the message is queued in storage to be delivered later.

Let's assume that pending messages and message histories do not need to be queried across multiple dimensions, or analyzed for any reason besides showing the history and/or replaying waiting messages. In this case a relational database is overkill. Use DynamoDB for storage instead, or any other flavor of autoscaling cloud noSQL. This will ensure constant lookup time regardless of scale. 
