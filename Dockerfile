# docker build -t docker-mongo .
# docker run --privileged --rm -d --name "dm" docker-mongo
# docker exec -it dm mongo --version
# docker kill dm

from centos/systemd

RUN echo $'[mongodb-org-3.4]\n\
name=MongoDB Repository\n\
baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/3.4/x86_64/\n\
gpgcheck=1\n\
enabled=1\n\
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc' > /etc/yum.repos.d/mongodb-org-3.4.repo
RUN yum install -y mongodb-org
RUN systemctl enable mongod

CMD ["/usr/sbin/init"]
