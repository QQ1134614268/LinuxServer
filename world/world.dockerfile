FROM python:3.7.13-slim
COPY world /home/world
# 前端
RUN cd /home/world && \
	pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
	pip install -r requirements.txt

EXPOSE 9010
CMD cd /home/world && python /home/world/app.py


