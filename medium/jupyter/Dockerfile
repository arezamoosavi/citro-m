FROM centos:7

LABEL Vendor=”CentOS” \
    License=GPLv2 \
    Version=2.4.6–40

RUN yum -y update \
    &&  yum -y install epel-release \
    &&  yum -y install gcc openssl-devel bzip2-devel libffi-devel

RUN yum update -y && yum -y install yum-utils && yum -y groupinstall development

RUN yum -y update \
    &&  yum install -y python37u python3-libs python3-devel python3-setuptools python3-pip


# Add the user UID:1000, GID:1000, home at /app
RUN groupadd -r app -g 1000 && useradd -u 1000 -r -g app -m -d /app -s /sbin/nologin -c "App user" app && \
    chmod 755 /app

RUN pip3 install --no-cache-dir jupyterlab
RUN pip3 install --no-cache-dir kafka-python requests pymongo

RUN mkdir -p /notebooks

WORKDIR /notebooks

# CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]

# Jupyter
COPY ./jupyter/jupyter_run.sh /jupyter_run.sh
RUN chmod +x /jupyter_run.sh