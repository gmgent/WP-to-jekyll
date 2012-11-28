
SITEDIR = "/Users/theta/src/jekyll"

desc "Compile, commit and push"
task :default => [:commit, :push, :sync]


desc "Commit compiled site and record new version"
task :commit => [:commit_site]

desc "Commit compiled site to Git"
task :commit_site do
  commit_message = ENV['m'] ? "#{ENV['m']} | " : ""
  sh "cd /Users/theta/src/jekyll && git add -A"
  sh "cd /Users/theta/src/jekyll && git commit -m '#{commit_message}auto deploy #{Time.now.to_i}'"
end

desc "Push committed site to GitHub"
task :push do
  sh "cd /Users/theta/src/jekyll && git push"
end

desc "sync to EC2"
task :sync do
  sh "ruby #{SITEDIR}/deploy_command.rb"
  sh "cd #{SITEDIR}"
end

def site_files
  FileList["#{SITEDIR}/**/*"].find_all {|f| File.file? f}
end