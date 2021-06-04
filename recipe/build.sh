#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

set -e

if [[ "${build_platform}" != "${target_platform}" ]]; then
  # Don't try to extract information from the odbc_config executable
  rm $PREFIX/bin/odbc_config
fi

./configure --prefix $PREFIX --with-unixodbc=$PREFIX --with-openssl=$PREFIX
make
# To run this check we need to have access to a mssql instance.
# make check
make install
