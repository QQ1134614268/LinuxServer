FROM centos:centos8.1.1911
RUN yum -y install gcc gcc-c++ zlib zlib-devel libffi-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel xz-devel
&& wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz
&& tar -zxvf  Python-3.7.5.tgz
&& cd Python-3.7.5
&& ./configure --prefix=/usr/local/python3.7 --enable-optimizations
&& make
&& make install
&& ln -s /usr/local/python3.7/bin/python3.7 /usr/bin/python3.7
&& ln -s /usr/local/python3.7/bin/pip3 /usr/bin/pip3.7

RUN yum -y install git
RUN cd /opt
RUN git clone https://gitee.com/biaozhun/world.git
RUN cd /world/
RUN pip3.7 install -r requirement.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
# COPY .. /opt
# WORKDIR /usr/src/app

# ENV DJANGO_SETTINGS_MODULE=config.settings.production
# RUN pip install --no-cache-dir -r requirements/production.txt -i http://mirrors.aliyun.com/pypi/simple/  --trusted-host mirrors.aliyun.com

EXPOSE 80

CMD [ "python3.7", "/opt/world/src/app.py"]
