# tumblr_uploadr command line interface
module TumblrUploadr
  require 'tumblr_uploadr/constants'

  require 'fileutils'
  require 'tumblr_client'
  require 'yaml'

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

      path = File.join ENV['HOME'], '.tumblr'
      if File.exist?(path)
        configuration = YAML.load_file path
        Tumblr.configure do |config|
          Tumblr::Config::VALID_OPTIONS_KEYS.each do |key|
            config.send(:"#{key}=", configuration[key.to_s])
          end
        end
      else
        puts "error: missing .tumblr file, see #{PRODUCT_URL}"
        exit 1
      end

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

      begin
        client = Tumblr::Client.new
      rescue => e
        puts "client error: exception #{e}"
        exit 1
      end

      images.each_with_index do |j, i|        
        puts "#{i+1}/#{count} uploading #{j} ..."

        d = Time.now.strftime("%d/%m/%Y %H:%M")
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
end # module
