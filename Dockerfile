FROM alpine:3.4		
MAINTAINER myfinder <medianetworks@gmail.com>		
		
RUN apk update && apk add gcc g++ make git patch perl perl-dev curl ca-certificates wget && update-ca-certificates && rm -fr /var/cache/apk/*		
RUN curl -sL https://git.io/cpm > /usr/bin/cpm && chmod +x /usr/bin/cpm		
WORKDIR /usr		
RUN cpm install Carton		
		
ENV PERL5LIB=/usr/local/lib/perl5		
ENV PATH=/usr/local/bin:$PATH		
		
WORKDIR /		
		
RUN mkdir -p /opt/app		
ADD ./ /opt/app		
		
WORKDIR /opt/app		
RUN carton install		
		
EXPOSE 5000		
CMD carton exec -- plackup app.psgi