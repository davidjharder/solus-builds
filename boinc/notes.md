# Notes for BOINC

- Clear linux here https://github.com/clearlinux-pkgs/boinc-client


--disable-static DOCBOOK2X_MAN='/usr/bin/db2x_xsltproc -s man $< -o $(patsubst %.xml,%.mxml,$<); db2x_manxml $(patsubst %.xml,%.mxml,$<); echo' \
--disable-silent-rules \
--enable-dynamic-client-linkage \
--disable-server \
--disable-fcgi \
--enable-unicode \
--with-ssl \
--with-x


original

    ./_autosetup
    --disable-silent-rules \
    --enable-dynamic-client-linkage \
    --disable-server \
    --disable-fcgi \
    --enable-unicode \
    --with-wx-config=/usr/bin/wx-config \
    --with-ssl \
    --with-x \
    DOCBOOK2X_MAN='/usr/bin/db2x_xsltproc -s man $< -o $(patsubst %.xml,%.mxml,$<); db2x_manxml $(patsubst %.xml,%.mxml,$<); echo' \