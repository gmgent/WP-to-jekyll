# encoding: utf-8

module Liquid
  module AudioFilter
    
    def add_audio_tag(raw)
      filtered = ""
      if raw.scan(/(<a.{1,}http:.{9,}.mp3.{1,}>)/)[0]
        matchtag = raw.scan(/(<a.{1,}http:.{9,}.mp3.{1,}>)/)[0].to_s
        filename = matchtag.scan(/<a.{1,}(http:.{9,}mp3)/)[0].to_s
        filtered = raw.gsub!(matchtag, add_tag(filename))
      else
        filtered = raw
      end
      filtered
    end
    
  private
  
    def add_tag(filename)
      "<audio src='#{filename}' preload='auto' />"
    end
      
  end
end

Liquid::Template.register_filter(Liquid::AudioFilter)