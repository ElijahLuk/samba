################################################
# Start SUBSYSTEM LDBSAMBA
[SUBSYSTEM::LDBSAMBA]
PUBLIC_DEPENDENCIES = LIBLDB
PRIVATE_DEPENDENCIES = LIBSECURITY SAMDB_SCHEMA LIBNDR NDR_DRSBLOBS NDR_DNSP
# End SUBSYSTEM LDBSAMBA
################################################

LDBSAMBA_OBJ_FILES = $(ldb_sambasrcdir)/ldif_handlers.o
$(eval $(call proto_header_template,$(ldb_sambasrcdir)/ldif_handlers_proto.h,$(LDBSAMBA_OBJ_FILES:.o=.c)))


[PYTHON::python_samba__ldb]
LIBRARY_REALNAME = samba/_ldb.$(SHLIBEXT)
PRIVATE_DEPENDENCIES = LDBSAMBA pyparam_util 

python_samba__ldb_OBJ_FILES = $(ldb_sambasrcdir)/pyldb.o