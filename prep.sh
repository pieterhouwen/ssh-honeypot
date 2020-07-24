wget='wget --no-check-certificate'
OPENSSH=/opt/openssh2
mkdir -p /opt/openssh2/dist/
cd ${OPENSSH}
$wget http://zlib.net/zlib-1.2.11.tar.gz
tar xvfz zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure --prefix=${OPENSSH}/dist/ && make && make install
cd ${OPENSSH}
$wget http://www.openssl.org/source/openssl-1.0.1e.tar.gz
tar xvfz openssl-1.0.1e.tar.gz
cd openssl-1.0.1e
cp -f /tmp/Makefile.org .
./config --prefix=${OPENSSH}/dist/ && make && make install
cd ${OPENSSH}
$wget https://ftp.eu.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.2p1.tar.gz
tar xvfz openssh-6.2p1.tar.gz
cd openssh-6.2p1
sed -e 's/struct passwd \* pw = authctxt->pw;/logit("Honey: Username: %s Password: %s", authctxt->user, password);\nstruct passwd \* pw = authctxt->pw;/' -i auth-passwd.c
./configure --prefix=${OPENSSH}/dist/ --with-zlib=${OPENSSH}/dist --with-ssl-dir=${OPENSSH}/dist/ && make && make install
