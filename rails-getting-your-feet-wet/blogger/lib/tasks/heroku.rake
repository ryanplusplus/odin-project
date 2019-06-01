namespace :heroku do
  task :deploy do
    sh 'cd ../.. && \
      git subtree push \
      --prefix rails-getting-your-feet-wet/blogger \
      https://git.heroku.com/ryanplusplus-rails-blogger.git master'
  end

  task :migrate do
    sh 'heroku run rails db:migrate -a ryanplusplus-rails-blogger'
  end

  task :open do
    sh 'heroku open -a ryanplusplus-rails-blogger'
  end

  task :logs do
    sh 'heroku logs --tail -a ryanplusplus-rails-blogger'
  end
end
