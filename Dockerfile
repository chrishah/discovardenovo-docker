FROM chrishah/samtools:1.9

MAINTAINER <christoph.hahn@uni-graz.at>

WORKDIR /usr/src
RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y g++-4.8 libjemalloc1=3.6.0-11 libjemalloc-dev=3.6.0-11 libieee1284-3 && \
	ln -s /usr/lib/x86_64-linux-gnu/libieee1284.so.3 /usr/lib/libieee.so && \
	wget ftp://ftp.broadinstitute.org/pub/crd/DiscovarDeNovo/latest_source_code/discovardenovo-52488.tar.gz && \
	tar xfz discovardenovo-52488.tar.gz && \
	rm discovardenovo-52488.tar.gz && \
	cd discovardenovo-52488 && \
	./configure CXX=/usr/bin/g++-4.8 CXXPP=/usr/bin/cpp-4.8 && \
	make all && make install


#add user (not really necessary)
RUN adduser --disabled-password --gecos '' discovar
USER discovar

WORKDIR /home/discovar

