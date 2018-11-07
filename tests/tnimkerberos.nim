import nimkerberos/kerberos_sspi

var ctxt: sspi_client_state
var ret = auth_sspi_client_init(
    newWideCString("NTLM"), 0, nil, 0, nil, 0, nil, 0, newWideCString("Negotiate"), addr ctxt)
assert ret == AUTH_GSS_COMPLETE

ret = auth_sspi_client_step(addr ctxt, "".cstring, nil)
assert ret == 0

echo ctxt.response

destroy_sspi_client_state(addr ctxt)
