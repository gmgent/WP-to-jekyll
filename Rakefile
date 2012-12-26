
SITEDIR = "/Users/theta/src/jekyll"

desc "Compile, commit and push"
task :default => [:commit, :push, :sync]
task :ps => [:push, :sync]

task :sync => [:sync_ec2, :sync_assets]

desc "Commit compiled site and record new version"
task :commit => [:commit_site]

desc "Commit compiled site to Git"
task :commit_site do
  
  begin
      commit_message = ENV['m'] ? "#{ENV['m']} | " : ""
      if commit_message && commit_message.size > 3
        sh "cd /Users/theta/src/jekyll && git add -A"
        sh "cd /Users/theta/src/jekyll && git commit -m '#{commit_message}auto deploy #{Time.now.to_i}'"
      else
        puts "please include a commit message when you use git. ('m=message...')"
        puts "no changes were added to git."
      end
      
  rescue
      puts "there was an error pushing your git changes. In the future, try 'rake ps' to push and sync only."
  end
    
  
end

desc "Push committed site to GitHub"
task :push do
  begin
    puts "Now pushing..."
    sh "cd /Users/theta/src/jekyll && git push"
    puts "Git push was completed. Now syncing..."
  rescue
    puts "Git push did not complete."
  end
end

desc "sync to EC2"
task :sync_ec2 do
  puts "Now syncing..."
  sh "ruby #{SITEDIR}/deploy_command.rb"
  #sh "cd #{SITEDIR}"
end

desc "push assets"
task :sync_assets do
  puts "Now syncing..."
  sh "ruby #{SITEDIR}/deploy_assets.rb"
  sh "cd #{SITEDIR}"
end

task :anew do
  name = ENV['name']
  filename = "#{Time.now.strftime("%Y-%m-%d")}-#{name.gsub(' ', '-')}"
  filename_with_ext = "#{filename}.md"
  sh "touch 'blog/_posts/#{filename_with_ext}'"
  File.open("blog/_posts/#{filename_with_ext}", "w") do |f|
    f.puts "---"
    f.puts "layout: blog"
    f.puts "title: #{name}"
    f.puts "permalink: #{Time.now.strftime("%Y")}/#{Time.now.strftime("%m")}/#{name.gsub(' ', '-')}"
    f.puts "postday: #{Time.now.strftime("%m/%d %Y")}"
    f.puts "posttime: #{Time.now.strftime("%H_%M")}"
    f.puts "comments: true"
    f.puts "categories: [random]"
    f.puts "---"
  end
end

def site_files
  FileList["#{SITEDIR}/**/*"].find_all {|f| File.file? f}
end