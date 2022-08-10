https://github.com/jwasham/coding-interview-university

## Things to follow

Coding Interview
1. Solve Leetcode medium level problems (at least more than 250+ covering different topics)
2. I have created an xlsx on top/important 500 leetcode questions (https://lnkd.in/dWn73jXd) and a video on How to Crack The Coding Interview? (https://lnkd.in/dsn4cipq). 
3. Clement Mihailescu's AlgoExpert 169 handpicked questions (In case you want to prepare fast and only good questions)
4. I watched my DSA playlist to revise concepts at 2x speed. (https://lnkd.in/dJfS9FkD)

System Design / High Level Design Interview
1. Grokking the System Design Interview - It has step by step discussion and good case studies (https://lnkd.in/dbv8GhK7)
2. Alex Xu's System Design Interview course on ByteByteGo (https://bytebytego.com/) - The course covers all the content from his famous book (Vol 1 and Vol 2) System Design Interview
3. Clement Mihailescu #SystemsExpert (https://lnkd.in/d-5mSpfw) videos to know how real life System Design Interviews go 

Object Oriented Design / Low Level Design Interview
1. Grokking the Object Oriented Design Interview (https://lnkd.in/dcwE3v6V) - A very detailed and step by step approach to various object oriented design case studies. 

API Design Interview
1. Best Practices (https://lnkd.in/d_x39xkK), Implementation (https://lnkd.in/d5fhXZJ7) and Guidelines (https://lnkd.in/dr397Hy2) of API Design
2. Look for use cases like - Stripe (https://lnkd.in/dsM7PpJt) and Twitter (https://lnkd.in/dxiMu8wr) API Documentation
3. #SystemsExpert also has few case studies on API design as well

Schema / Database Design Interview
1. Grokking the Object Oriented Design Interview (https://lnkd.in/dcwE3v6V) - Take the case studies and try to apply Object to Relational Mapping strategy

Behavioral Interview
1. Watch Jeff H Sipe, Interview / Negotiation Coach Youtube channel for behavioral questions (https://lnkd.in/d6rgxbnr)
2. https://lnkd.in/dXBfNNK9

Important DSA topics?
Array, Binary Search, Sliding Window, Matrix, Two Pointer, Intervals, Hash Map, String, Recursion, DP, Trees, Graph, Linked List, Stack, Queue & Heap

If you're interested in interview preparation tips and DSA, YouTube channel:
https://lnkd.in/e-49_sP


## Must read Cracking the coding interview
- https://github.com/chaudharyachint08/Self-Learning/blob/master/BOOKS/DSA%20%26%20Competitive%20Programming/Cracking-the-Coding-Interview-6th-Edition-189-Programming-Questions-and-Solutions.pdf

### 1) What happens when you type URL in the browser
There are four layers through which this domain name query goes through. Let’s understand the steps: 
1) After hitting the URL, the browser cache is checked. As browser maintains its DNS records for some amount of time for the websites you have visited earlier. Hence, firstly, DNS query runs here to find the IP address associated with the domain name
2) The second place where DNS query runs in OS cache followed by router cache.
3) If in the above steps, a DNS query does not get resolved, then it takes the help of resolver server. Resolver server is nothing but your ISP (Internet service provider). The query is sent to ISP where DNS query runs in ISP cache.
4) If in 3rd steps as well, no results found, then request sends to top or root server of the DNS hierarchy. There it never happens that it says no results found, but actually it tells, from where this information you can get. If you are searching IP address of the top level domain (.com,.net,.Gov,. org). It tells the resolver server to search TLD server (Top level domain).
5) Now, resolver asks TLD server to give IP address of our domain name. TLD stores address information of domain name. It tells the resolver to ask it to Authoritative Name server.
6) The authoritative name server is responsible for knowing everything about the domain name. Finally, resolver (ISP) gets the IP address associated with the domain name and sends it back to the browser.

![Input Image](./dns.webp)
Hence, if the record cannot be found locally, a full DNS resolution is conducted as follows:

- The first point of contact for a full resolution is a root server. As of the writing of this post, 1017 instances of root servers exist.

- The root server returns the IP address of the relevant top level domain server.

- The top level domain returns the IP address of the second level domain server.

- The second-level domain server contains the DNS record of the server we are looking for. The second-level domain server returns the IP address to the browser.


    - NS record (name server) - Specifies the DNS servers for your domain/subdomain.
    - MX record (mail exchange) - Specifies the mail servers for accepting messages.
    - A record (address) - Points a name to an IP address.
    - CNAME (canonical) - Points a name to another name or CNAME (example.com to www.example.com) or to an A record.

Services such as CloudFlare and Route 53 provide managed DNS services.

After getting an IP address, resolver stores it in its cache so that next time, if the same query comes then it does not have to go to all these steps again. It can now provide IP address from their cache


### 2) How symmetric and assymmetric encryption works
- https://tiptopsecurity.com/how-does-https-work-rsa-encryption-explained/

### 3) How process, threads and go routens works
- https://www.notion.so/Internals-of-goroutines-and-Channels-ab82d73925054211a2fa7e3d4a7c54a2

### 4) What is L1 & L2 cache?

### 5) What is virtual memory? Explain paging

### 6) What is a distributed denial of service attack (DDoS) and what can you do about them?
https://www.cloudflare.com/en-in/learning/ddos/what-is-a-ddos-attack/

### 7) HTTP/1.1 vs HTTP/2: What's the Difference?
HTTP/2 solves several problems that the creators of HTTP/1.1 did not anticipate. In particular, HTTP/2 is much faster and more efficient than HTTP/1.1. One of the ways in which HTTP/2 is faster is in how it prioritizes content during the loading process.
