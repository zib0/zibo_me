FROM amazonlinux:2
ENV VERSION_JEKYLL=4.2.2
ENV VERSION_RUBY_3_1=3.1.2
ENV VERSION_RUBY_DEFAULT=$VERSION_RUBY_3_1
RUN yum -y update       && \
    yum -y install         \
    git                \
    openssl            \
    openssh-clients    \
    py-pygments        \
    libc6-compat       \
    g++                \
    curl               \
    wget               \
    tar                \
    which            \
    procps               \
    yum clean all       && \
    rm -rf /var/cache/yum
## Install Ruby 3
RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby --with-gems="bundler"
RUN rvm reload

RUN /bin/bash --login -c "\
    rvm install $VERSION_RUBY_3_1 && rvm use $VERSION_RUBY_3_1 && gem install bundler -v 2.3.24 && gem install jekyll -v 4.2.2 && \
    rvm cleanup all"

RUN echo export PATH="/usr/local/rvm/gems/ruby-${VERSION_RUBY_DEFAULT}/bin:/usr/local/rvm/gems/ruby-${VERSION_RUBY_DEFAULT}@global/bin:/usr/local/rvm/rubies/ruby-${VERSION_RUBY_DEFAULT}/bin:/usr/local/rvm/bin:$PATH" >> ~/.bashrc
RUN echo export GEM_PATH="/usr/local/rvm/gems/ruby-${VERSION_RUBY_DEFAULT}" >> ~/.bashrc

ENTRYPOINT [ "bash", "-c" ]