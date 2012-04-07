require 'anemone'
require 'yaml'
require 'date'
require 'redis'

CONFIG = YAML.load_file("./config.yml")

if CONFIG['test_mode']
  depth = 1
end

Anemone.crawl(CONFIG['urls'], { :depth_limit => depth || false, :discard_page_bodies => true }) do |anemone|

  anemone_storage = Anemone::Storage.Redis

  output_file = "dump-#{Time.new.strftime('%Y-%m-%d_%I:%M:%S%p')}.txt"
  redirect_count = 0
 
  puts "Baby spiders hatched. Kill them with CTRL-C"

  # Header row
  File.open(output_file, "w") { |f| f.puts("URL\tResponse Code\tContent Type") }

  # Data rows
  anemone.on_every_page do |page|
    if CONFIG['skip_hash_links']
      anemone.skip_links_like /\%23/
    end

    if CONFIG['console']
      puts "#{page.url}"
    end

    File.open(output_file, "a") do |file|
      file.puts "#{page.url}\t#{page.code}\t#{page.content_type}"
    end
    
    if page.redirect? 
      redirect_count += 1
    end

  end 

  # write stats
  anemone.after_crawl do |pages| 
    puts "\n-----------\nCrawl Stats\n-----------"
    puts "Uniques: #{pages.size}"
    puts "Redirects: #{redirect_count}"
  end
end

