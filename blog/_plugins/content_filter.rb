# encoding: utf-8

module Liquid
  module AudioFilter
    
    def add_audio_tag(raw)
      filtered = ""
      if raw.scan(/(<a.href..http:..[a-zA-Z]{1,12}[.].{0,12}...{0,1}\/[\w\/-]{3,40}[.]mp3.{1,9}<\/a>)/)[0]
        raw.scan(/(<a.href..http:..[a-zA-Z]{1,12}[.].{0,12}...{0,1}\/[\w\/-]{3,40}[.]mp3.{1,9}<\/a>)/).each do |this|
          matchtag = this.to_s
          filename = matchtag.scan(/<a.{1,}(http:.{9,}mp3)/)[0].to_s
          filtered = raw.gsub!(matchtag, add_tag(filename))
        end
        
      else
        filtered = raw
      end
      filtered
    end
    
  private
  
    def add_tag(filename)
      "<p><audio src='#{filename}' preload='auto' /></p>"
    end
      
  end
end

Liquid::Template.register_filter(Liquid::AudioFilter)