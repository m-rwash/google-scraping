# Google Search Results Scraper:
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

### App Flow
1. User Login/Signup.
2. Authenticated User can upload CSV File containing keywords to scrape.
3. Iterate every Keyword send it to background job using Sidekiq:
  1.  [Sidekiq](https://sidekiq.org/) wokrer start scraping.
  2.  Push results to keyword model.
4. Authenticated User can view/ or search/query scraped/extracted results
  *  View all details(number of adwords and it's position, ads urls, non-ads urls, search results number, HTML code of result page..etc)
  *  Search though keywords
  *  Search URLs (ads and non-ads)

### Clone and run it localy:
1. git clone `git clone https://github.com/m-rwash/google-scraping`
2. `$ cd google-scraping`
3. `$ bundle`
4. `$ rails db:create db:migrate`
5. install sidekiq
6. `$ bundle exec sidekiq`
7. run rails server `$ rails s`
8. browse http://localhost:3000


### You'll likely end up banned from Google due many requests in short time, here's solutions I've found
*  Sending requests with different user-agents; each request with new user-agent and thats already implemented.
* What you can do to for extra protection:
   *  use [Tor](https://github.com/TheTorProject/gettorbrowser); sending requests thorough Tor browser, but you have to try many exit nodes till get one working cause google keeps blocking Tor nodes. This gem was helpful for me you may try it (https://github.com/brunogh/tor_requests)
   *  using private VPN



#### Frontend: Twitter Bootstrap, Sass

### Resources:
* [Testing API Authentication using OAuth2 gem](https://github.com/doorkeeper-gem/doorkeeper/wiki/Testing-your-provider-with-OAuth2-gem)
* [Implementing Oauth2 using doorkeeper [RailsCasts]](http://railscasts.com/episodes/353-oauth-with-doorkeeper)
* [Background job using sidekiq](https://github.com/mperham/sidekiq/wiki/Getting-Started)