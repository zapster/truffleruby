require 'mkmf'
$CFLAGS += " -I #{ENV['OPENSSL_INCLUDE']} -DHAVE_OPENSSL_110_THREADING_API -DHAVE_HMAC_CTX_COPY -DHAVE_EVP_CIPHER_CTX_COPY -DHAVE_BN_RAND_RANGE -DHAVE_BN_PSEUDO_RAND_RANGE -DHAVE_X509V3_EXT_NCONF_NID"
$LIBS += " -l #{ENV['OPENSSL_LIB']}"
create_makefile('openssl')
