module TumblrUploadr
  require 'tumblr_uploadr/constants'
  require 'tumblr_client'
  require 'fileutils'

  class << self
    def get_images(dir)
      dir += '/' unless dir.include? '/'
      glob = Dir.glob "#{dir}**/*"
      glob.select do |x|
        f = x.downcase
        (f.include? 'jpg') || (f.include? 'jpeg') || (f.include? 'png')
      end
    end

    def cli
      puts "uploadr #{VERSION}"

      if ARGV.count < 2
        puts "usage: #{PRODUCT} <tumblr> <folder> [caption]"
        exit 1
      end

      puts "writing log to #{LOG}"

      tumblr = ARGV[0]
      tumblr = "#{tumblr}.tumblr.com" unless tumblr.include? '.'

      folder = ARGV[1]
      puts "uploading #{folder} to #{tumblr} ..."

      caption = ARGV[2]
      caption = '' if caption.nil?

      images = get_images folder
      count = images.count
      puts "found #{count} images"

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

      images.each_with_index do |j, i|
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

        sleep PAUSE
      end
    end #def
  end # class
end
