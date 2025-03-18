FROM centos:7

# Settings for repogitory
RUN rm -f /etc/yum.repos.d/CentOS-Base.repo && \
    echo "[base]" > /etc/yum.repos.d/CentOS-Vault.repo && \
    echo "name=CentOS-7 - Base" >> /etc/yum.repos.d/CentOS-Vault.repo && \
    echo "baseurl=http://vault.centos.org/centos/7/os/x86_64/" >> /etc/yum.repos.d/CentOS-Vault.repo && \
    echo "enabled=1" >> /etc/yum.repos.d/CentOS-Vault.repo && \
    echo "gpgcheck=1" >> /etc/yum.repos.d/CentOS-Vault.repo && \
    echo "gpgkey=http://vault.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7" >> /etc/yum.repos.d/CentOS-Vault.repo

# Get aria2 RPM file from EPEL7 & Install
RUN yum install -y wget && \
    wget https://dl.fedoraproject.org/pub/archive/epel/7/x86_64/Packages/a/aria2-1.34.0-5.el7.x86_64.rpm && \
    yum localinstall -y aria2-1.34.0-5.el7.x86_64.rpm && \
    rm -f aria2-1.34.0-5.el7.x86_64.rpm && \
    yum clean all

# 作業ディレクトリを設定
WORKDIR /app

# aria2 の動作確認
CMD ["aria2c", "--version"]
