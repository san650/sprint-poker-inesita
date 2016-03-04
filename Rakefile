desc 'deploy'
task :deploy do
  sh 'bundle exec inesita build -f'
  sh 'cp public/index.html public/200.html'
  sh 'surge -p ./public -d sprint-poker-inesita.surge.sh'
end
