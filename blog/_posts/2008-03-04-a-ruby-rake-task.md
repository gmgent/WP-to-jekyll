---
layout: blog
title: A Ruby Rake Task
permalink: 2008/03/a-ruby-rake-task
postday: 03/04 2008
posttime: 08_00
categories: [Code]
---

<p>namespace :db do<br />
  desc "Loads a schema.rb file into the database and then loads the initial database fixtures."<br />
  task :bootstrap =&gt; [&#039;db:schema:load&#039;, &#039;db:bootstrap:import&#039;]</p>
<p>  # bootstrap namespace based on Rick Olson&#039;s bootstrap rake task.<br />
  namespace :bootstrap do<br />
    desc "Load database fixtures (in db/fixtures//*.{yml,csv}) into the current environment&#039;s database.  Load specific folder using FOLDER=db/foo. Load specific fixtures using FIXTURES=x,y"<br />
    task :import =&gt; :environment do<br />
      require &#039;active_record/fixtures&#039;<br />
      #require &#039;fastercsv&#039;</p>
<p>      import_folder = ENV[&#039;FOLDER&#039;] || "db/fixtures/#{RAILS_ENV}/"<br />
      import_folder += &#039;/&#039; unless import_folder.slice(-1..-1).eql?(&#039;/&#039;)</p>
<p>      rake_start_time = Time.now<br />
      file_count = 0<br />
      ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)<br />
      (ENV[&#039;FIXTURES&#039;] ? ENV[&#039;FIXTURES&#039;].split(/,/) : Dir.glob(File.join(RAILS_ROOT,import_folder, &#039;*.{yml,csv}&#039;))).each do |fixture_file|<br />
        table_start_time = Time.now<br />
        puts "Loading #{fixture_file}"<br />
        Fixtures.create_fixtures(import_folder, File.basename(fixture_file, &#039;.*&#039;))<br />
        table_end_time = Time.now<br />
        puts "   -&gt; #{(table_end_time - table_start_time).to_s}s"<br />
        file_count += 1<br />
      end</p>
<p>      rake_end_time = Time.now<br />
      puts "-- total files: #{file_count}"<br />
      puts "   -&gt; #{(rake_end_time - rake_start_time).to_s}s"<br />
    end<br />
  end</p>
<p>  desc "Run cron tasks."<br />
  task :scheduling =&gt; [&#039;db:scheduling:daily&#039;, &#039;db:scheduling:hourly&#039; ]</p>
<p>  namespace :scheduling do<br />
    desc "Daily cron run."<br />
    task :daily =&gt; :environment do<br />
      for a in Actor.find(:all)<br />
        #calc savings - if logged in over last 3 weeks<br />
          puts a.name<br />
          expires_on = (a.updated_at + 21)<br />
        if expires_on &gt;=  Time.now.to_date<br />
          message1 = a.calc_savings!<br />
          if message1 == ""<br />
            puts "No savings."<br />
          else<br />
            puts message1<br />
            a.log &lt;&lt; message1<br />
            a.save<br />
          end<br />
          u = User.find_by_id(a.user_id)<br />
          s = State.find_by_user_id(u.id)<br />
          s.reset_enthuse!<br />
          s.save<br />
        else<br />
          puts "hasn&#039;t been around."<br />
        end<br />
      end<br />
    end<br />
    desc "Hourly cron run."<br />
    task :hourly =&gt; :environment do<br />
      #increment enthusiasm<br />
      #pay wages if recently logged in - within last 1 hour<br />
      for a in Actor.find(:all)<br />
          puts a.name<br />
          expires_on = (a.updated_at + 1.day)<br />
        if DateTime.now &lt;= expires_on<br />
          #other logic - last_pay_date + consecutive_work_hours<br />
            if a.consecutive_work_hours &lt; 8<br />
              #calc wages<br />
              message2 = a.calc_wages!<br />
              if message2 == ""<br />
                puts "No wages."<br />
              else<br />
                puts message2<br />
                a.log &lt;&lt; message2<br />
                a.save<br />
              end<br />
            end<br />
        else<br />
          #look for shelter<br />
          if a.has_box &gt; 0<br />
            s = State.find_by_user_id(u.id)<br />
            s.take_shelter!<br />
            a.log &lt;&lt; "#{a.name} takes refuge in a shantie. "<br />
          else<br />
            puts "No shantie."<br />
          end<br />
          a.consecutive_work_hours = 0<br />
          a.save<br />
          puts "hasn&#039;t been around."<br />
        end<br />
      end<br />
    end<br />
  end<br />
end</p>
<p><a href="http://www.digbox.net/index.php/RoR/a-ruby-rake-task">Original post</a> blogged on <a href="http://codeboxer.com">codeboxer.com</a>.</p>
