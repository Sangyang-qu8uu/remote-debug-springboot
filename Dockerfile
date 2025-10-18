# 基础镜像
FROM openjdk:8-jre-slim

# 作者
MAINTAINER sang

# 配置
ENV PARAMS=""

# 时区
ENV TZ=PRC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 添加应用
ADD target/*.jar /remote-debug-springboot.jar
EXPOSE 8080 5000

ENTRYPOINT ["sh","-c","java $JAVA_REMOTE_DEBUG -jar $JAVA_OPTS /remote-debug-springboot.jar $PARAMS"]
