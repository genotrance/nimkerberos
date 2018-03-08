Nimkerberos is a [Nim](https://nim-lang.org/) wrapper for the [WinKerberos](https://github.com/mongodb-labs/winkerberos) library.

Nimkerberos is distributed as a [Nimble](https://github.com/nim-lang/nimble) package and depends on [nimgen](https://github.com/genotrance/nimgen) and [c2nim](https://github.com/nim-lang/c2nim/) to generate the wrappers. The WinKerberos source code is downloaded using Git so having ```git``` in the path is required.

__Installation__

Nimkerberos can be installed via [Nimble](https://github.com/nim-lang/nimble):

```
> nimble install nimgen

> git clone https://github.com/genotrance/nimkerberos
> cd nimkerberos
> nimble install
```

This will download, wrap and install nimkerberos in the standard Nimble package location, typically ~/.nimble. Once installed, it can be imported into any Nim program.

__Usage__

```nim
import nimkerberos/kerberos_sspi

var ctxt: sspi_client_state
var ret = auth_sspi_client_init(
    newWideCString("NTLM"), 0, nil, 0, nil, 0, nil, 0, newWideCString("Negotiate"), addr ctxt)
assert ret == AUTH_GSS_COMPLETE

ret = auth_sspi_client_step(addr ctxt, "".cstring, nil)
assert ret == 0

echo ctxt.response

destroy_sspi_client_state(addr ctxt)
```

The kerberos_sspi.h functions are directly accessible at this time. A higher level API as provided by WinKerberos for Python is still TBD.

Refer to the ```tests``` directory for examples on how the library can be used.

__Credits__

Nimkerberos wraps the WinKerberos source code and all licensing terms of [WinKerberos](https://github.com/mongodb-labs/winkerberos/blob/master/LICENSE) apply to the usage of this package.

Credits go out to [c2nim](https://github.com/nim-lang/c2nim/) as well without which this package would be greatly limited in its abilities.

__Feedback__

Nimkerberos is a work in progress and any feedback or suggestions are welcome. It is hosted on [GitHub](https://github.com/genotrance/nimkerberos) with an MIT license so issues, forks and PRs are most appreciated.
