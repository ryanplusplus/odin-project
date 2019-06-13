namespace :heroku do
  task :deploy do
    sh 'cd ../.. && \
      git subtree push \
      --prefix rails-getting-your-feet-wet/toy_app \
      https://git.heroku.com/ryanplusplus-rails-toy_app.git master'
  end

  task :migrate do
    sh 'heroku run rails db:migrate -a ryanplusplus-rails-toy_app'
  end

  task :open do
    sh 'heroku open -a ryanplusplus-rails-toy_app'
  end

  task :logs do
    sh 'heroku logs --tail -a ryanplusplus-rails-toy_app'
  end
end
