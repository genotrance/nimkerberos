# Package

version       = "0.1.1"
author        = "genotrance"
description   = "WinKerberos wrapper for Nim"
license       = "MIT"

skipDirs = @["tests"]

# Dependencies

requires "nimgen >= 0.2.3"

import distros
import strutils

var cmd = ""
if detectOs(Windows):
    cmd = "cmd /c "

task setup, "Setup":
    exec cmd & "nimgen nimkerberos.cfg"

before install:
    setupTask()

task test, "Test":
    withDir("tests"):
        exec("nim c -r testkb")
