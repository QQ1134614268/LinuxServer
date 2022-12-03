docker pull gitlab/gitlab-runner:latest

docker stop gitlab-runner | docker rm  gitlab-runner

docker run -d --name gitlab-runner \
-v /opt/gitlab-runner/etc:/etc/gitlab-runner \
-v /opt/gitlab-runner/run/docker.sock:/var/run/docker.sock \
gitlab/gitlab-runner:latest


docker exec -it gitlab-runner gitlab-runner register -n \
--url https://github.com/ \
--registration-token youarehero \
--executor docker \
--description "Docker Runner" \
--docker-image "maven:3.6.3-jdk-8" \
--docker-volumes /opt/run/docker.sock:/var/run/docker.sock

# 128 126
docker exec -it gitlab-runner gitlab-runner register -n \
--url https://github.com/ \
--registration-token youarehero \
--executor docker \
--description "Docker Runner" \
--docker-image "maven:3.6.3-jdk-8" \
--docker-volumes /opt/run/docker.sock:/var/run/docker.sock