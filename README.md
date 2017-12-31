# Google Search Results Scraper
Scrap google search results and return back with how many/what Ads the page has, URLs of those Ads, how many results came out(i.e 12350000 in 1.5 seconds), links, html code and more. Saving scraped data to database and ability for extracting it to PDF file. Provided with an OAuth2 RESTful API also. 
### Development Environment/Tools:
*  OS: Ubuntu 17.10
*  Shell: [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
*  DB Manager: Postgresql
*  Text Editing: Sublime 3.0
*  Ruby Environment Manager: [Rbenv](https://github.com/sstephenson/rbenv)
*  Rails 5.1
*  Ruby 2.4
*  Redis 4.0.6

### Gems I've used:
*  [nokogiri](http://www.nokogiri.org/) => Parsing HTML
*  [user-agent-randomizer](https://github.com/asconix/user-agent-randomize) => Random HTTP User-Agent string generator
*  [responders](https://github.com/plataformatec/responders) => Set of responders modules 
*  [pry](https://github.com/pry/pry) => Debugging 
*  [doorkeeper](https://github.com/doorkeeper-gem/doorkeeper) => OAuth2 provider for securing API
*  [devise](https://github.com/plataformatec/devise) => Authentication
*  [rails_autolink](https://github.com/tenderlove/rails_autolink) => Returns sanitized html_safe strings
*  [sidekiq](https://sidekiq.org/) => Background processing
*  bootstrap-sas => Twitter's Bootstrap for the frontend 
*  [prawn](https://github.com/prawnpdf/prawn) => Build PDF report

### App Flow
1. User Login/Signup.
2. Authenticated User can upload CSV File containing keywords to scrape.
3. Iterate every Keyword send it to background job using Sidekiq:
  1.  *[Sidekiq](https://sidekiq.org/)* wokrer start scraping in the background.
  2.  Parse HTML *using nokogiri*
  3.  Push results to keyword model.
4. Authenticated User can view/ or search/query scraped/extracted results
  -  View all details(number of adwords and it's position, ads urls, non-ads urls,search results number, HTML code of result page..etc)
  -  Search though keywords
  -  Search URLs (ads and non-ads)
5. User can download generated PDF report *using Prawn and PrawnTable gems*

### Clone and run it localy:
1. git clone `git clone https://github.com/m-rwash/google-scraping`
2. `$ cd google-scraping`
3. `$ bundle`
4. `$ rails db:create db:migrate`
5. run redis server 
6. install sidekiq
7. `$ bundle exec sidekiq`
8. run rails server `$ rails s`
9. browse http://localhost:3000

#### Notice:
*  API authenticated through OAuth2 to test it. Check that out [Testing API Authentication using OAuth2 gem](https://github.com/doorkeeper-gem/doorkeeper/wiki/Testing-your-provider-with-OAuth2-gem)

#### Notice: 
You'll likely end up banned from Google due many requests in short time, here's solutions I've found
*  Sending requests with different user-agents; each request with new user-agent and thats already implemented.
* What you can do to for extra protection:
   *  use [Tor](https://github.com/TheTorProject/gettorbrowser); sending requests thorough Tor browser, but you have to try many exit nodes till get one working cause google keeps blocking Tor nodes. This gem was helpful for me you may try it (https://github.com/brunogh/tor_requests)
   *  using private VPN

#### TODO:
* Testing
* Deploying to heroku

#### Resources helped me:
* [Implementing Oauth2 using doorkeeper [RailsCasts]](http://railscasts.com/episodes/353-oauth-with-doorkeeper)
* [Background job using sidekiq](https://github.com/mperham/sidekiq/wiki/Getting-Started)