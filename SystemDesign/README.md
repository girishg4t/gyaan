### Check the notes in the repo

### What is Sticky and NON-Sticky sessions
- https://www.imperva.com/learn/availability/sticky-session-persistence-and-cookies/

When your website is served by only one web server, for each client-server pair, a session object is created and remains in the memory of the web server. All the requests from the client go to this web server and update this session object. If some data needs to be stored in the session object over the period of interaction, it is stored in this session object and stays there as long as the session exists.

However, if your website is served by multiple web servers which sit behind a load balancer, the load balancer decides which actual (physical) web-server should each request go to. For example, if there are 3 web servers A, B and C behind the load balancer, it is possible that www.mywebsite.com/index.jsp is served from server A, www.mywebsite.com/login.jsp is served from server B and www.mywebsite.com/accoutdetails.php are served from server C.

Now, if the requests are being served from (physically) 3 different servers, each server has created a session object for you and because these session objects sit on three independent boxes, there's no direct way of one knowing what is there in the session object of the other. In order to synchronize between these server sessions, you may have to write/read the session data into a layer which is common to all - like a DB. Now writing and reading data to/from a db for this use-case may not be a good idea. Now, here comes the role of sticky-session.

If the load balancer is instructed to use sticky sessions, all of your interactions will happen with the same physical server, even though other servers are present. Thus, your session object will be the same throughout your entire interaction with this website.

To summarize, In case of Sticky Sessions, all your requests will be directed to the same physical web server while in case of a non-sticky loadbalancer may choose any webserver to serve your requests.

As an example, you may read about Amazon's Elastic Load Balancer and sticky sessions here : http://aws.typepad.com/aws/2010/04/new-elastic-load-balancing-feature-sticky-sessions.html
