desc 'deploy'
task :deploy do
  sh 'bundle exec inesita build -f'
  sh 'cp dist/index.html dist/200.html'
  sh 'surge -p ./dist -d sprintpoker-inesita.surge.sh'
end
