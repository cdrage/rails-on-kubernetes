namespace :docker do
  desc "Push docker images to DockerHub"
  task :push_image do
    TAG = `git rev-parse --short HEAD`.strip

    puts "Building Docker image"
    sh "docker build -t cdrage/rails-app:#{TAG} ."

    IMAGE_ID = `docker images | grep cdrage\/rails-app | head -n1 | awk '{print $3}'`.strip

    puts "Tagging latest image"
    sh "docker tag #{IMAGE_ID} cdrage/rails-app:latest"

    puts "Pushing Docker image"
    sh "docker push cdrage/rails-app:#{TAG}"
    sh "docker push cdrage/rails-app:latest"

    puts "Done"
  end

end
