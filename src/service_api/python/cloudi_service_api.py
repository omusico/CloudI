# -*- coding: utf-8; Mode: python; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
# ex: set softtabstop=4 tabstop=4 shiftwidth=4 expandtab fileencoding=utf-8:

import sys, os
_absolute_path = os.path.dirname(os.path.abspath(__file__)).split(os.path.sep)
sys.path.extend([
    os.path.sep.join(_absolute_path + ['jsonrpclib']),
    os.path.sep.join(_absolute_path[:-2] + ['api', 'python']),
])

import jsonrpclib
import erlang
import struct

class _ServiceUUID(object):
    def __init__(self, *args):
        assert len(args) == 16
        self.__bytes = args

    def __str__(self):
        return '<<%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d>>' % (
            self.__bytes
        )

    def raw(self):
        return struct.pack('BBBBBBBBBBBBBBBB', self.__bytes)

class _ServiceDescription(object):
    def __init__(self, *args):
        self.__args = args

    def __str__(self):
        return str(self.__args)

class CloudI(object):
    # initialize with configuration file defaults
    def __init__(self, host = 'localhost', port = 6464):
        address = 'http://%s:%d/cloudi/api/json_rpc/' % (host, port)
        self.__server = jsonrpclib.Server(address)

    def __getattr__(self, name):
        if name == 'services':
            return self.__services
        return self.__server.__getattr__(name)

    def __services(self):
        raw = self.__server.services()
        return [
            (_ServiceUUID(*uuid_tuple),
             _ServiceDescription(*service_configuration))
            for uuid_tuple, service_configuration in erlang.consult(raw)
        ]

