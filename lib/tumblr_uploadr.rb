require 'tumblr_client'
require 'fileutils'

VERSION = '0.1.0'

LOG = 'tumblr_log'

PRODUCT = 'tumblr_uploadr'
PRODUCT_DESCRIPTION = 'batch uploading to tumblr (drafts)'

CONSUMER_KEY = 'your-consumer-key'
CONSUMER_SECRET = 'your-consumer-secret'
ACCESS_TOKEN = 'your-access-token'
ACCESS_SECRET = 'your-access-token-secret'

def get_jpg_assets(dir)
  dir += '/' unless dir.include? '/'
  glob = Dir.glob "#{dir}**/*"
  glob.select { |x| x.downcase.include? 'jpg' }
end

puts "uploadr #{VERSION}"

if ARGV.count == 0
  puts "usage: #{PRODUCT} <tumblr> <folder> <caption>"
  exit 1
end

puts "writing log to #{LOG}"

tumblr = ARGV[0]
tumblr = "#{tumblr}.tumblr.com" unless tumblr.include? '.'

folder = ARGV[1]
puts "uploading #{folder} to #{tumblr} ..."

caption = ARGV[2]
caption = '' if caption.nil?

jpgs = get_jpg_assets folder
count = jpgs.count
puts "found #{count} jpgs"

Tumblr.configure do |config|
  config.consumer_key = CONSUMER_KEY
  config.consumer_secret = CONSUMER_SECRET
  config.oauth_token = ACCESS_TOKEN
  config.oauth_token_secret = ACCESS_SECRET
end

begin
  client = client = Tumblr::Client.new
rescue => e
  puts "client error: exception #{e}"
  exit 1
end

jpgs.each_with_index do |j, i|
  d = Time.now.strftime("%d/%m/%Y %H:%M")
  puts "#{i+1}/#{count} uploading #{j} ..."

  File.write LOG, "#{j} to #{tumblr} #{d} \n"

  payload = {
    :caption => caption,
    :state => 'draft',
    :data => j
  }
  begin
    client.photo tumblr, payload
  rescue => e
    puts "upload error: exception #{e}"
    exit 1
  end

  sleep 1
end
