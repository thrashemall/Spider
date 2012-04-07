# SPIDER

A small Ruby script based on [Anemone](http://anemone.rubyforge.org). Used for spidering sites and saving output to a file. 

### Usage

1. Update gems with <code>bundle install</code>
1. Add the URLs you want to spider to config.yml. 
1. Run <code>ruby spider.rb</code>

This will output a timestamped, tab-delimited file in the current directory, which can be manipulated in another program.

### Notes

This requires [Redis](http://redis.io), which can be installed via [Homebrew](http://mxcl.github.com/homebrew/): <code>brew install redis</code>
