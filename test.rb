#!/usr/bin/ruby
require 'rubygems'
require 'xmlsimple'
require 'fileutils'

inputname = "kristeraxel.wordpress.2012-11-23.xml"

puts "processing #{inputname}"

regex = "/[b][l][o][g].{1,}\/([a-zA-Z].{1,})\//"

@input = XmlSimple.xml_in(File.open(inputname, "r"))

@input["channel"].each do |channel|
  channel_title = channel["title"]
  channel_desc = channel["description"]
  
  puts "title: #{channel_title}"
  puts "desc: #{channel_desc}"
  
  channel.each do |channel_item|
    if channel_item[0]=="item"
      channel_item[1].each do |post_item|
                  
        #this is where the posts live
        datearray = post_item["post_date"].to_s.split("-")
        puts 
        puts post_item["title"]
        puts post_item["encoded"]
        puts post_item["category"].each do |cat|
          puts cat.inspect
        end
        
        re = Regexp.new regex
        puts "fix #{post_item["link"]}"
        linkname = post_item["link"].to_s.scan(/[b][l][o][g].{1,}\/([a-zA-Z].{1,})\//)
        if linkname.to_s.size == 0
          linkname = post_item["title"].to_s.gsub!(" ", "-")
        end
        filename = "#{datearray[0]}/#{datearray[1]}/#{linkname}"
        
        jekyll_post_name = "#{datearray[0]}-#{datearray[1]}-#{datearray[2].to_s[0..1]}-#{linkname}"
        puts jekyll_post_name
        
        physical_file_name = "#{jekyll_post_name}.md"
        
        if File.exist?(physical_file_name) then
          File.delete(physical_file_name)
        end
        
        File.open(physical_file_name, 'w') do |f|
          #front matter
          f.puts "---"
          f.puts "layout: blog\n"
          f.puts "title: #{post_item["title"]}\n"
          f.puts "permalink: #{filename}\n"
          #f.puts "categories: ['test', '']\n"
          
          f.puts "---"
          f.puts          
          
          f.puts post_text
        end
        #deploy file at the end and add "_"
        FileUtils.mv("#{physical_file_name}", "blog/_posts/#{physical_file_name}", :force => true)
      end      
    end
  end
  
end