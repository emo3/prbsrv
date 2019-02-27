####
# add routines to this file
# this will setup each probe you have created
####
# setup the EIF probe
include_recipe '::setup_eif_probe'
# setup the SNMP probe
include_recipe '::setup_snmp_probe'
