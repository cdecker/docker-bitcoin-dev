PREFIX=/usr/local/libdb-4.8
wget -q 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c || exit 1
tar -xzf db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix/
../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$PREFIX
make install

for i in ${PREFIX}/lib/*.a; do
ln -s $i /usr/lib/$(arch)-linux-gnu/
done

for i in ${PREFIX}/include/*.h; do
ln -s $i /usr/include/
done

cd /
rm -rf /db-4.8.30.NC/build_unix/
