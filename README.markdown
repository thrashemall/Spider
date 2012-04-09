# SPIDER

A small Ruby script based on [Anemone](http://anemone.rubyforge.org). Used for spidering sites and saving output to a file. 

### Usage

1. Install [Redis](http://redis.io) if you don't have it. [Homebrew](http://mxcl.github.com/homebrew/) is a good method. <code>brew install redis</code>
1. Update gems with <code>bundle install</code>
1. Add the URLs you want to spider to config.yml. 
1. Run <code>ruby spider.rb</code>

This will output a timestamped, tab-delimited file in the current directory, which can be manipulated in another program.
