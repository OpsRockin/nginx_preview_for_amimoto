ARG BASE_TAG=2-with-sources
FROM amazonlinux:$BASE_TAG
ENV BASE_TAG $BASE_TAG

RUN yum -y update && yum -y install rpm-build git gcc make autoconf tmux \
  pcre-devel libxml2-devel libxslt-devel \
  gd-devel perl-devel perl-ExtUtils-Embed geoip-devel gperftools-devel \
  rubygem-rake bison gcc-c++ libuuid-devel

RUN bash -c 'if [ "$BASE_TAG" -eq 1 ] ; then yum -y install openssl-devel ; fi'

RUN mkdir -p /root/rpmbuild

WORKDIR /root/rpmbuild
# should mount currentDir with '-v `pwd`:/root/rpmbuild'
CMD ["./build.sh"]
