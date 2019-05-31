namespace :heroku do
  task :deploy do
    sh 'cd ../.. && \
      git subtree push \
      --prefix rails-getting-your-feet-wet/my_first_rails_app \
      https://git.heroku.com/ryanplusplus-first-rails-app.git master'
  end

  task :migrate do
    sh 'heroku run rails db:migrate -a ryanplusplus-first-rails-app'
  end

  task :open do
    sh 'heroku open -a ryanplusplus-first-rails-app'
  end
end
