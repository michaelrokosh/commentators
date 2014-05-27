namespace :pgbackup do
  desc "TODO"
  task create: :environment do
    sh 'heroku pgbackups:capture —expire'
    sh 'curl -o latest.dump `heroku pgbackups:url`'
    sh 'pg_restore —clean —no-acl —no-owner -h 127.0.0.1 -d helpified_development latest.dump'
  end

end
