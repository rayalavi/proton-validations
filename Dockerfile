FROM public.ecr.aws/amazonlinux/amazonlinux:2.0.20221210.1-amd64

ARG FUNCTION_DIR="/function"
RUN amazon-linux-extras install python3.8
RUN set -ex \
    && yum groupinstall -y -q "Development tools" \
    && yum install -y -q \
           GeoIP-devel ImageMagick asciidoc bzip2-devel bzr bzrtools cvs cvsps \
           docbook-dtds docbook-style-xsl dpkg-dev e2fsprogs expat-devel expect fakeroot \
           glib2-devel groff gzip icu iptables jq krb5-server libargon2-devel \
           libcurl-devel libdb-devel libedit-devel libevent-devel libffi-devel \
           libicu-devel libjpeg-devel libpng-devel libserf libsqlite3x-devel \
           libtidy-devel libunwind libwebp-devel libxml2-devel libxslt libxslt-devel \
           libyaml-devel libzip-devel mariadb-devel mercurial mlocate mono-devel \
           ncurses-devel oniguruma-devel openssl openssl-devel perl-DBD-SQLite \
           perl-DBI perl-HTTP-Date perl-IO-Pty-Easy perl-TimeDate perl-YAML-LibYAML \
           postgresql-devel procps-ng python-configobj readline-devel rsync sgml-common \
           subversion-perl tar tcl tk vim wget which xfsprogs xmlto xorg-x11-server-Xvfb xz-devel \
           amazon-ecr-credential-helper
# Install the runtime interface client
RUN pip3.8 install \
        --target ${FUNCTION_DIR} \
        awslambdaric

# Set working directory to function root directory
# Create function directory
RUN mkdir -p ${FUNCTION_DIR}
COPY app/* ${FUNCTION_DIR}
RUN mkdir -p ${FUNCTION_DIR}/inputs
COPY inputs/* ${FUNCTION_DIR}/inputs
WORKDIR ${FUNCTION_DIR}
ENV HOME=/tmp
ENTRYPOINT [ "python3.8", "-m", "awslambdaric" ]
CMD [ "app.handler" ]