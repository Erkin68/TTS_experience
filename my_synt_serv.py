import tensorflow as tf
import socket
import os
import array as arr
#import re
#import urllib.parse


from http.server import HTTPServer, BaseHTTPRequestHandler
from tensorflow.compat.v1 import InteractiveSession
from hparams import hparams, hparams_debug_string
from synthesizer import Synthesizer



class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):

    content_type = 'application/octet-stream'



    def _set_headers(self):
        self.send_response(200)
        self.send_header('Content-Type', 'application/octet-stream')
        #self.send_header('Content-Length', 404544)
        self.end_headers()
        return

    #def escape_ansi(self,line):
    #    ansi_escape =re.compile(r'(\x9B|\x1B\[)[0-?]*[ -\/]*[@-~]')
    #    return ansi_escape.sub('', line)

    def decode(self,line):
        a_nmbrs = line.split("x")
        nmbrs = arr.array('i')
        for a_nmbr in a_nmbrs:
            if a_nmbr!="":
               nmbrs.append(int(a_nmbr,16))
        s = ''.join([chr(c) for c in nmbrs])
        #print(s)
        return s

    def do_GET(self):
        params = self.path.split("=",1)
        #print(params[0])
        #print(params[1])

        data = synthesizer.synthesize(self.decode(params[1]))

        self._set_headers()
        self.wfile.write(data)
        return

synthesizer = Synthesizer()
config = tf.ConfigProto()
config.gpu_options.allow_growth = True
session = InteractiveSession(config=config)
synthesizer.load("trandModels/model.ckpt-4000")
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

httpd = HTTPServer(('localhost', 8008), SimpleHTTPRequestHandler)
httpd.serve_forever()
