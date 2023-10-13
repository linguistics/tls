# Texas Linguistics Society (TLS)

This repository contains the source code to generate the TLS website.

The site itself lives here: **[tls.ling.utexas.edu](https://tls.ling.utexas.edu/)**

## Fall Checklist: changing from one year (say, 2021) to the next (2022)

* Create a new folder with the name of the year  to archive (`2021`).
* Copy all the files that are specific to the homepage and the 2021 conference (e.g. [`/index.html`](/index.html), [`/style/`](/style/), and [`/files/`](/files/), but **not** [`/1997/`](/1997/) or [`CNAME`](CNAME)) into [`/2021/`](/2021/). (The site is now archived at [tls.ling.utexas.edu/2021/](https://tls.ling.utexas.edu/2021/).)
* Add an entry for 2021 in [`_data/archive.yml`](_data/archive.yml), using previous years as a model. (Now the [site archive page](https://tls.ling.utexas.edu/archive/) will contain an appropriate link.)
* Now you can edit [`/index.html`](/index.html) to reflect the 2022 conference.
    * Update the year information in the preamble.
    * Temporarily disable any navigational links (` disabled`) that should not yet be active.
    * Update the main body paragraph and keynote speakers.
    * Update the names of the current TLS committee members.
* Remove the schedule from `files` in prior year.

## Spring Checklist: adding schedule and registration
TBD


## Basics: HTML, Jekyll, and GitHub

The site is built using `.html` files, which contain the text you see on each page. The formatting of the text is controled by `.css` files (look in the [`/style/`](/style/) folder). You can learn about HTML and CSS from [Khan Academy](https://www.khanacademy.org/computing/computer-programming/html-css). The HTML/CSS for recent TLS sites uses the Bootstrap framework. If you want to play around with it you could [check out the documentation](https://getbootstrap.com/docs/4.0/getting-started/introduction/).

The site also uses a tool called Jekyll to make a few things easier. For example, Jekyll looks at the preamble of [`/index.html`](/index.html) to find the year that the page is talking about. Jekyll also builds the [site archive page](https://tls.ling.utexas.edu/archive/) automatically using information from [`/_data/archive.yml`](/_data/archive.yml). If you want to edit the files on your own computer, you'll need to install Jekyll to test them locally. But GitHub Pages knows how to do it too. [Check out the Jekyll documentation](https://jekyllrb.com/docs/) to learn more about it.

GitHub Pages takes the HTML and, using Jekyll, turns it into a live site at [tls.ling.utexas.edu](https://tls.ling.utexas.edu/). GitHub also keeps a memory of what changes are made to the site. Once again, you can check out the documentation for both [GitHub](https://docs.github.com/en/github) and [GitHub Pages](https://docs.github.com/en/pages).


## Guide to files and folders

* [`/404/`](/404/): Creates the 404 error page if someone goes a page on the website that doesn't exist, e.g. [tls.ling.utexas.edu/asdfs/](https://tls.ling.utexas.edu/asdfs/). (Jekyll is responsible for this.)
* [`/1997/`](/1997/), ['/1998/'](/1998/), etc.: Each of these folders contains an archived site from a previous year. Each folder is completely self-contained.
* [`/archive/`](/archive/): Contains a page that lists each of the previous conferences, with a link to the appropriate archived folder. You can adjust the formating within this folder, but the information is automatically pulled from [`/_data/archive.yml`](/_data/archive.yml)
* [`/_data/`](/_data/): Jekyll can read data files from this folder to automatically generate repetitive information, for example see the for and if statements in [`/archive/index.html`](/archive/index.html).
* [`/files/`](/files/): Stores any PDFs or other files relevant to the current year's conference. (Most likely the schedule; make sure it goes into the archive folder!)
* [`/style/`](/style/): Contains the CSS and JavaScript and image files to style this year's homepage at [`/index.html`](/index.html). (Make sure it goes into the archive folder!)
* [`CNAME`](CNAME): A GitHub Pages configuration file that links this repository to `tls.ling.utexas.edu`. UT ITS controls allocation of all `*.utexas.edu` domains, so if any issues arise with that DNS entry, your best bet is to search for "UTnic" on the [www.utexas.edu](https://www.utexas.edu/) website or file a ticket with the IT folks.
* [`/_config.yml`](/_config.yml): Configures Jekyll.
* [`/Gemfile`](/Gemfile): Gives GitHub Pages some information about how to use Jekyll.
* [`/index.html`](/index.html): Contains the text and markup for this year's homepage. This will configure what people see when they look at [tls.ling.utexas.edu](https://tls.ling.utexas.edu/). Make sure it goes into the archive folder!)
* [`/README.md`](/README.md): Contains this text that you're reading now!



## Deeper Details: Websites, Servers, and GitHub Pages

#### How websites work

To host a webpage on the internet, a server (computer) must be online and available to respond to incoming requests, at any time, as long as you want the webpage to exist.

For example, when you go to the URL [tls.ling.utexas.edu/2016/](https://tls.ling.utexas.edu/2016/), your browser first looks up the address of the server that is responsible for the domain `tls.ling.utexas.edu`, then it connects to that server, and requests the server to send it the page content corresponding to `/2016/`.
The server, which has been configured to listen for just such a request, finds the data that it has been programmed to associate with that particular request, and sends that data back to your browser.
Depending on the content of that data, your browser may send out additional requests, potentially to other servers,
to retrieve other components of your webpage, such as images.

#### How servers work

Servers and internet connections are not free.
If you want to host an arbitrary webpage on the internet, you will pay for it in some fashion.
If you search the web for "free webpage" you will find lots of services for which you pay by being obligated to show ads to your visitors (or in some cases, by being obligated to pay in money after a short introductory/trial period).

If you happen to own a desktop computer at home, and are already paying for an internet connection, you could technically use that computer to serve your webpage.
However, nobody does this, not even for small/niche websites, due to a number of factors that make this method impractical:

* If your power goes out or your internet goes down, your website will cease to exist until the power/service returns.
* If your internet provider arbitrarily changes your connection's IP address (or you move), you will need to ensure that your visitors are aware of the change (by updating your website address's DNS configuration)
* Your computer will be slower proportionally to how much work it's doing to respond to requests for your webpage, potentially making it unusable for your personal use.
  Similarly, if a lot of visitors visit your webpage simultaneously, some of them will get slow responses, or no response at all, if your computer is working beyond its capacity.
* Your computer will be vulnerable to attacks from the outside world.
  Even if you use secure software to protect against someone gaining access to your computer and using it to do more nefarious things besides viewing your webpage, you cannot protect against a "denial-of-service" attack, which is when someone maliciously pushes your computer beyond capacity, as in the preceding point.
* Your internet provider may decide to limit your bandwidth, or require you to pay them more for additional bandwidth.

Dealing with these issues and liabilities requires considerable labor and attention,
which quickly exceeds the relative inexpensiveness of other options.
It is far more common and cost-efficient to pay someone else to worry about all those problems,
in exchange for access to one of their servers, which generally comes with some guarantee of uptime and bandwidth.

How much you pay for the server depends on the complexity needs of your webpage.
If you are responding with dynamic content that requires the server to do considerable work for each request,
you'll be hard-pressed to find a service cheaper than $5/month,
such as [Digital Ocean](https://www.digitalocean.com/pricing/#droplet) or [Linode](https://www.linode.com/pricing).
With such services, when you stop paying, the server you were paying for will stop responding to requests.

It is much cheaper to serve static content.
"Static" means that for every URL the server is programmed to respond to, it always gives the same response.
This requires very little work from the server; it needs only look for a file matching the specified URL, and send that file to your webpage's visitor.
A static webpage is non-interactive, i.e., your visitors cannot login and receive personalized content, or upload anything, or otherwise manipulate the state of the server.
But for many purposes, and for TLS's purpose in particular, a static webpage is entirely sufficient.

#### Why the TLS website is here on GitHub

GitHub offers to serve static content, ostensibly for free,
as a product they call ["GitHub Pages"](https://pages.github.com/).
This costs GitHub money to do, but not very much, relatively, and their business model in this regard consists of advertising paid plans with more functionality to you, the website developer, rather than your visitors.

This service comes with the intangible cost of having no guarantee,
in that they may cancel or insist on charging for this service at any time.
However, due to the traction and wide adoption / expectation of this service, canceling it would alienate and/or infuriate a large portion of their paying clientele, which makes a strong case for its persistence.

There are also some [usage limits and restrictions](https://help.github.com/articles/what-is-github-pages/#usage-limits) imposed by GitHub, but these are generous and beyond sufficient for the needs of TLS (and even much bigger sites).

In short, despite the advertisement aspect and indeterminate continuation of the GitHub Pages service,
I've concluded that it's the best option for hosting the TLS website for as long as possible with minimal ongoing costs.


