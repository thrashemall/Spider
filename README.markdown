# SPIDER

A small Ruby script based on [Anemone](http://anemone.rubyforge.org). Used for spidering sites and saving output to a file. 

Running spider will output a timestamped, tab-delimited file in the current directory. This can be manipulated in Numbers, Excel, or something similar.

### Usage

1. Install [Redis](http://redis.io) if you don't have it. [Homebrew](http://mxcl.github.com/homebrew/) is a good method. <code>brew install redis</code>
1. Update gems with <code>bundle install</code>
1. Add the URLs you want to spider to config.yml. 
1. Run <code>ruby spider.rb</code>
1. Kill it with <code>CTRL-c</code>

### Settings

The following settings may be manipulated in <code>config.yml</code>:

* *urls* (array) : a comma separated list of URLs to spider. For most sites, you'll want to include the 'www' subdomain also.
* *console* (boolean) : writes each page spidered to the terminal, matrix-style. Useful for knowing if it's running or not. 
* *skip_hash_links* (boolean) : ignore hash anchors links like http://example.com#main-content. If the site relies on hash URLs, you might have a bad time. 
* *test_mode* (boolean) : limits the depth of the search to only those pages that can be reached in one hop. Useful for checking if the spider likes your URLs before you commit to launching it. 
